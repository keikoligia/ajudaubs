// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ajuda_ubs/app/models/ubs_model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class RemedioController extends ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  String erro = '';
  Set<Marker> markers = Set<Marker>();
  late GoogleMapController _mapsController;
  late List<UBS> ubs;
  BuildContext context;

  RemedioController({required this.context}) {
    getPosicao();
  }

  get mapsController => _mapsController;

  onMapCreated(GoogleMapController gmc) async {
    _mapsController = gmc;
    getPosicao();
    loadPostos();
  }

  late List<double> distancia = [];

  loadPostos() async {
    try {
      var response = await http.get(Uri.parse('http://localhost:5000/ubs'));
      if (response.statusCode == 200) {
        ubs = UBS.fromJsons(response.body);
        ubs.forEach((ubs) {
          double dist = Geolocator.distanceBetween(
              lat, long, ubs.latitude, ubs.longitude);
          distancia.add(dist);
          markers.add(
            Marker(
              markerId: MarkerId(ubs.nome),
              position: LatLng(ubs.latitude, ubs.longitude),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueBlue),
              onTap: () => {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Wrap(
                    children: [
                      Image.network(ubs.endereco,
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover),
                      Padding(
                        padding: const EdgeInsets.only(top: 24, left: 24),
                        child: Text(
                          ubs.nome,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 60, left: 24),
                        child: Text(
                          ubs.endereco,
                        ),
                      ),
                    ],
                  ),
                )
              },
            ),
          );
        });
        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
    }
  } /*
  */

  getPosicao() async {
    try {
      Position posicao = await _posicaoAtual();
      lat = posicao.latitude;
      long = posicao.longitude;
      markers.add(Marker(
          markerId: MarkerId('ResidenciaLocal'),
          position: LatLng(lat, long),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue)));
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
}
