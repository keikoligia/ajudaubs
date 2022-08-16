// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ajuda_ubs/app/models/ubs_model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class RemedioController extends ChangeNotifier {
  late double lat = 0.0;
  late double long = 0.0;
  late String erro = '';
  late Set<Marker> markers = Set<Marker>();
  late GoogleMapController _mapsController;
  late List<UBS> ubs;
  late BuildContext context;
  late final _initialCameraPosition = CameraPosition(
    target: LatLng(lat, long),
    zoom: 16.5,
  );

  List<Circle> circles = [];

// ignore: prefer_collection_literals
  RemedioController({required this.context}) {
    getPosicao();
  }

  get mapsController => _mapsController;

  onMapCreated(GoogleMapController gmc) async {
    _mapsController = gmc;
    getPosicao();
    loadPostos();
  }

  late List<UbsDistancia> rankingDistancia = [];

  Widget listaDistanciaUBS() {
    return Container(
        decoration: BoxDecoration(
         // color: const Color(0xff7c94b6),          
          border: Border.all(
            color:const Color.fromRGBO(138, 162, 212, 1),
            width: 3,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        height: 120,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: rankingDistancia.length,
            itemBuilder: (context, index) {
              UbsDistancia file = rankingDistancia[index];
              return InkWell(
                  onTap: () {
                    clickUbs(file.ubs);
                  },
                  child: ListTile(
                    //leading: Text('$index'),
                    title: Text(
                      file.ubs.nome,
                      textAlign: TextAlign.start,
                    ),
                    subtitle: Text(
                      file.ubs.endereco,
                      textAlign: TextAlign.start,
                    ),
                    trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                              '${(file.distancia / 1000).toStringAsFixed(2)} km'),
                          const SizedBox(height: 10),
                          (file.ubs.telefone != null)
                              ? const Text(
                                  'DISPONÍVEL',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.green),
                                )
                              : const Text(
                                  'INDISPONÍVEL',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.red),
                                )
                        ]),
                  ));
            }));
  }

  loadPostos() async {
    try {
      var responseUbs = await http.get(Uri.parse('http://localhost:3000/ubs'));

      if (responseUbs.statusCode == 200) {
        ubs = UBS.fromJsons(responseUbs.body);
        /*var responseRemedio = await http.get(Uri.parse('http://localhost:3000/remedioUbs/${ubs.indexOf(perfil.ubs)}/$remedio'));


      if (responseRemedio.statusCode == 200) {
                remedioUbs = RemedioUbs.fromJsons(responseRemedio.body);            

          if(remedioUbs.qtd > 0){

            ubs.forEach
          }
        }*/

        ubs.forEach((ubs) {
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
                clickUbs(ubs);
              },
            ),
          );
        });

        rankingDistancia.sort((a, b) => a.distancia < b.distancia ? -1 : 1);

        notifyListeners();
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
              BitmapDescriptor.hueAzure)));

      for (int i = 1; i < 4; i++) {
        circles.add(Circle(
            circleId: CircleId('${i}'),
            radius: i * 1000,
            strokeColor: Color.fromARGB(255, 94, 155, 255),
            strokeWidth: 3,
            fillColor: const Color.fromRGBO(138, 162, 212, 1).withOpacity(0.5),
            center: LatLng(lat, long)));
      }

      _mapsController.animateCamera(CameraUpdate.newLatLng(LatLng(lat, long)));
    } catch (e) {
      erro = e.toString();
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

  UbsDistancia(
    this.ubs,
    this.distancia,
  );
}
