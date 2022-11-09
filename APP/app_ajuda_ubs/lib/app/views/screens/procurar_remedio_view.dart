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
                  circles: Set<Circle>.from(local.circles));

              return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                      child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
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
                                ComponentsUtils.CardSuport(
                                    context,
                                    'Pesquisa',
                                    'Por favor, digite pelo menos 3 letras do nome genérico do medicamento.',
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: ComponentsUtils.TextFieldEdit(
                                            context,
                                            1,
                                            '',
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
                                    Icons.healing),
                                (controllerEmail.text.isEmpty)
                                    ? Container(
                                        height: 0,
                                      )
                                    : const SizedBox(height: 20),
                                (controllerEmail.text.isEmpty)
                                    ? Container(
                                        height: 0,
                                      )
                                    : ComponentsUtils.CardSuport(
                                        context,
                                        'Unidades Básicas de Saúde',
                                        'Lista das UBSs que contém o medicamento pesquisado',
                                        local.listaDistanciaUBS(),
                                        Icons.list),
                                const SizedBox(height: 10),
                                (controllerEmail.text.isEmpty)
                                    ? SizedBox(
                                        child: Image.asset(
                                          'assets/imagens/fig_procurar_remedio.png',
                                          fit: BoxFit.cover,
                                        ),
                                        width: 400,
                                        height: 350)
                                    : SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                2,
                                        child: Container(
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 182, 182, 182),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.3),
                                                  spreadRadius: 3,
                                                  blurRadius: 5,
                                                  offset: const Offset(0,
                                                      3), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: maps)),
                                (controllerEmail.text.isEmpty)
                                    ? const Text(
                                        '1 - Digite o medicamento desejado na caixa de busca acima.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 138, 161, 212),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      )
                                    : Container(),
                                (controllerEmail.text.isEmpty)
                                    ? const Text(
                                        '2 - O sistema mostrará os Centros de Saúde próximos do seu endereço e a disponibilidade do medicamento.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 138, 161, 212),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      )
                                    : Container(),
                              ]))));
            })),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
