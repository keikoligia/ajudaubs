import 'package:ajuda_ubs/app/controllers/remedio_controller.dart';
import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class ProcurarRemedioView extends StatefulWidget {
  const ProcurarRemedioView({Key? key}) : super(key: key);

  @override
  State<ProcurarRemedioView> createState() => _ProcurarRemedioViewState();
}

class _ProcurarRemedioViewState extends State<ProcurarRemedioView> {
  String email = '';

  late TextEditingController controllerEmail;
  late RemedioController local;

  @override
  void initState() {
    super.initState();
    controllerEmail = TextEditingController(text: email);
  }

  @override
  void dispose() {
    controllerEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider<RemedioController>(
            create: (context) => RemedioController(context: context),
            child: Builder(builder: (context) {
              local = context.watch<RemedioController>();

              String mensagem = local.erro == ''
                  ? 'Latitude: ${local.lat} | Longitude: ${local.long} |'
                  : local.erro;

              Widget maps = GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(local.lat, local.long),
                  zoom: 15,
                ),
                zoomControlsEnabled: true,
                mapType: MapType.satellite,
                myLocationEnabled: true,
                onMapCreated: local.onMapCreated,
                markers: local.markers,
              );

              return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                        const SizedBox(height: 15),
                        const Text(
                          'Procurar Remédios',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromARGB(255, 138, 161, 212),
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: ComponentsUtils.TextFieldEdit(
                                context,
                                1,
                                'Nome do Remédio',
                                TextInputType.text,
                                const Icon(Icons.search),
                                () {
                                  setState(() {});
                                },
                                controllerEmail,
                                (function) {
                                  email = function;
                                  setState(() {});
                                },
                                true)),
                        (controllerEmail.text.isEmpty)
                            ? Container(
                                height: 0,
                              )
                            : const SizedBox(height: 20),
                        (controllerEmail.text.isEmpty)
                            ? Container(
                                height: 0,
                              )
                            : local.listaDistanciaUBS(),
                        const SizedBox(height: 10),
                        (controllerEmail.text.isEmpty)
                            ? SizedBox(
                                child: Image.asset(
                                  'assets/imagens/fig_procurar_remedio.png',
                                  fit: BoxFit.cover,
                                ),
                                width: 400,
                                height: 350)
                            : Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height / 2,
                                    child: maps)),
                        (controllerEmail.text.isEmpty)
                            ? const Padding(
                                padding: EdgeInsets.only(left: 30, right: 30),
                                child: Text(
                                  '1 - Digite o medicamento desejado na caixa de busca acima.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 138, 161, 212),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ))
                            : Container(),
                        (controllerEmail.text.isEmpty)
                            ? const Padding(
                                padding: EdgeInsets.only(left: 30, right: 30),
                                child: Text(
                                  '2 - O sistema mostrará os Centros de Saúde próximos do seu endereço e a disponibilidade do medicamento.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 138, 161, 212),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ))
                            : Container(),
                      ])));
            })),
        floatingActionButton: (controllerEmail.text.isEmpty)
            ? null
            : FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.black,
                onPressed: () {
                  local.getLocalHome();
                },
                child: const Icon(Icons.home),
              ));
  }
}
