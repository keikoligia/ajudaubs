import 'package:ajuda_ubs/app/controllers/busca_remedio_controller.dart';
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
  late TextEditingController controllerNomeRemedio;
  late BuscaRemedioController remedioController;

  @override
  void initState() {
    super.initState();
    controllerNomeRemedio = TextEditingController();
  }

  @override
  void dispose() {
    controllerNomeRemedio.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<BuscaRemedioController>(
          create: (context) => BuscaRemedioController(
              context: context, controllerNomeRemedio: controllerNomeRemedio),
          child: Builder(builder: (context) {
            remedioController = context.watch<BuscaRemedioController>();

            Widget maps = GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(remedioController.lat, remedioController.long),
                  zoom: 15,
                ),
                zoomControlsEnabled: true,
                mapType: MapType.satellite,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                onMapCreated: remedioController.onMapCreated,
                markers: remedioController.markers,
                circles: Set<Circle>.from(remedioController.circles));

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
                                  'Por favor, digite o nome genérico do medicamento.',
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
                                          controllerNomeRemedio,
                                          (function) {
                                            setState(() {
                                              remedioController.getRemedio();
                                            });
                                          },
                                          true)),
                                  Icons.healing),
                              (controllerNomeRemedio.text.isEmpty)
                                  ? Container()
                                  : const SizedBox(height: 10),
                              (controllerNomeRemedio.text.isEmpty ||
                                      remedioController.erro)
                                  ? Container()
                                  : ComponentsUtils.CardSuport(
                                      context,
                                      'UBS',
                                      'Lista das UBSs que contém o medicamento pesquisado',
                                      remedioController.listaDistanciaUBS(),
                                      Icons.list),
                              (controllerNomeRemedio.text.isEmpty ||
                                      remedioController.erro)
                                  ? Container()
                                  : const SizedBox(height: 10),
                              (remedioController.erro)
                                  ? (controllerNomeRemedio.text.isEmpty)
                                      ? SizedBox(
                                          child: Image.asset(
                                            'assets/imagens/fig_procurar_remedio.png',
                                            fit: BoxFit.cover,
                                          ),
                                          width: 400,
                                          height: 350)
                                      : Container()
                                  : (controllerNomeRemedio.text.isEmpty)
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
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
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
                              (controllerNomeRemedio.text.isEmpty)
                                  ? const Text(
                                      '1 - Digite o medicamento desejado na caixa de busca acima.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 138, 161, 212),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    )
                                  : (remedioController.erro)
                                      ? const Text(
                                          'Por favor, tente novamente.',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 229, 95, 95),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        )
                                      : Container(),
                              (controllerNomeRemedio.text.isEmpty)
                                  ? const Text(
                                      '2 - O sistema mostrará os Centros de Saúde próximos do seu endereço e a disponibilidade do medicamento.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 138, 161, 212),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    )
                                  : (remedioController.erro)
                                      ? const Text(
                                          'Medicamento não encontrado!',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 229, 95, 95),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        )
                                      : Container()
                            ]))));
          })),
    );
  }
}
