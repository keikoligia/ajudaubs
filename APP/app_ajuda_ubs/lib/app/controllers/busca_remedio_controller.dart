// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ajuda_ubs/app/models/remedio_model.dart';
import 'package:ajuda_ubs/app/models/ubs_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class BuscaRemedioController extends ChangeNotifier {
  late double lat = 0.0;
  late double long = 0.0;
  late TextEditingController controllerNomeRemedio;
  late Remedio remedio;
  late bool erro = false;
  late Set<Marker> markers = <Marker>{};
  late GoogleMapController _mapsController;
  late List<UBS> ubs;
  late BuildContext context;
  bool primeira = false;
  late final _initialCameraPosition = CameraPosition(
    target: LatLng(lat, long),
    zoom: 16.5,
  );

  List<Circle> circles = [];

// ignore: prefer_collection_literals
  BuscaRemedioController(
      {required this.context, required this.controllerNomeRemedio}) {
    getPosicao();
  }

  get mapsController => _mapsController;

  onMapCreated(GoogleMapController gmc) async {
    _mapsController = gmc;
    getPosicao();
  }

  late List<UbsDistancia> rankingDistancia = [];

  getRemedio() async {
    try {
      var textRemedio = controllerNomeRemedio.text.trim();
      var responseRemedio = await http
          .get(Uri.parse('http://localhost:3000/remedio/$textRemedio'));

      if (responseRemedio.statusCode == 200) {
        erro = false;
        remedio = Remedio.fromJson(responseRemedio.body);
        loadPostos();
        listaDistanciaUBS();
      } else {
        erro = true;
      }
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  showToast() {
    FToast fToast;

    fToast = FToast();
    fToast.init(context);

    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: const Color.fromARGB(255, 138, 161, 212),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text("Endereço Copiado"),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }

  Widget listaDistanciaUBS() {
    return SizedBox(
        height: 120,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: rankingDistancia.length,
            itemBuilder: (context, index) {
              UbsDistancia file = rankingDistancia[index];
              return InkWell(
                  onLongPress: () {
                    Clipboard.setData(ClipboardData(text: file.ubs.endereco));
                    showToast(); // duration
                  },
                  onTap: () {
                    clickUbs(file.ubs);
                  },
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(height: 5),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text(file.ubs.nome,
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15)),
                                        Text(
                                          file.ubs.endereco,
                                          textAlign: TextAlign.start,
                                        )
                                      ])),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width / 4,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                            '${(file.distancia / 1000).toStringAsFixed(2)} km'),
                                        const SizedBox(height: 10),
                                        (remedio.receita == 1)
                                            ? const Text(
                                                'DISPONÍVEL\n(RECEITA)',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.green),
                                              )
                                            : const Text(
                                                'DISPONÍVEL',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.green),
                                              )
                                      ])),
                            ])
                      ]));
            }));
  }

  loadPostos() async {
    try {
      var responseRemedio = await http.get(Uri.parse(
          'http://localhost:3000/remedioUbs/${remedio.nomeComercial}'));

      if (responseRemedio.statusCode == 200) {
        erro = false;

        ubs = UBS.fromJsons(responseRemedio.body);
        rankingDistancia = [];

        for (UBS ubs in ubs) {
          double dist = Geolocator.distanceBetween(
              lat, long, ubs.latitude, ubs.longitude);
          rankingDistancia.add(UbsDistancia(ubs, dist));
          markers.add(
            Marker(
              markerId: MarkerId(ubs.nome),
              infoWindow: InfoWindow(
                  anchor: const Offset(0.0, 0.0),
                  title: ubs.nome,
                  snippet: ubs.endereco),
              position: LatLng(ubs.latitude, ubs.longitude),
              icon: BitmapDescriptor.defaultMarkerWithHue(210),
              onTap: () {
                //clickUbs(ubs);
              },
            ),
          );
        }

        rankingDistancia.sort((a, b) => a.distancia < b.distancia ? -1 : 1);
        notifyListeners();
      } else {
        erro = true;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void clickUbs(UBS ubs) {
    _mapsController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(ubs.latitude, ubs.longitude),
      zoom: 16.5,
    )));

    showModalBottomSheet(
      context: context,
      builder: (context) => Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        children: [
          Image.network(ubs.fotoUrl,
              height: 250,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover)
        ],
      ),
    );
  }

  getPosicao() async {
    try {
      Position posicao = await _posicaoAtual();
      lat = posicao.latitude;
      long = posicao.longitude;
      markers.add(Marker(
          markerId: const MarkerId('ResidenciaLocal'),
          position: LatLng(lat, long),
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueGreen)));

      for (int i = 1; i < 4; i++) {
        circles.add(Circle(
            circleId: CircleId('$i'),
            radius: i * 1000,
            strokeColor: const Color.fromARGB(255, 94, 155, 255),
            strokeWidth: 3,
            fillColor: const Color.fromRGBO(138, 162, 212, 1).withOpacity(0.5),
            center: LatLng(lat, long)));
      }

      _mapsController.animateCamera(CameraUpdate.newLatLng(LatLng(lat, long)));
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  Future<Position> _posicaoAtual() async {
    LocationPermission permissao;

    bool ativado = await Geolocator.isLocationServiceEnabled();
    if (!ativado) {
      return Future.error('Por favor, habilite a localização no smartphone');
    }

    permissao = await Geolocator.checkPermission();
    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();
      if (permissao == LocationPermission.denied) {
        return Future.error('Você precisa autorizar o acesso à localização');
      }
    }

    if (permissao == LocationPermission.deniedForever) {
      return Future.error('Você precisa autorizar o acesso à localização');
    }

    return await Geolocator.getCurrentPosition();
  }

  void getLocalHome() {
    _mapsController
        .animateCamera(CameraUpdate.newCameraPosition(_initialCameraPosition));
  }
}

class UbsDistancia {
  final UBS ubs;
  final double distancia;

  UbsDistancia(this.ubs, this.distancia);
}
