// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ajuda_ubs/app/controllers/cadastro_controller.dart';
import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class FormCadastro3View extends StatefulWidget {
  CadastroController cadastroController;
  FormCadastro3View({
    Key? key,
    required this.cadastroController,
  }) : super(key: key);

  @override
  State<FormCadastro3View> createState() => _FormCadastro3ViewState();
}

class _FormCadastro3ViewState extends State<FormCadastro3View> {
  late String cep = '';

  late GoogleMapController mapController;

  final LatLng center = const LatLng(-22.9106045, -47.0689968);

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 254, 254, 254),
                  Color.fromARGB(255, 254, 254, 254),
                  Color.fromARGB(255, 254, 254, 254),
                  Color.fromARGB(255, 254, 254, 254),
                  Color.fromRGBO(138, 162, 212, 1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                const SizedBox(height: 30),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                          height: 50,
                          width: 50,
                          child: SimpleCircularProgressBar(
                            progressStrokeWidth: 5,
                            backStrokeWidth: 5,
                            progressColors: const [
                              Color.fromARGB(255, 138, 161, 212)
                            ],
                            mergeMode: true,
                            animationDuration: 1,
                            onGetText: (double value) {
                              return const Text('3 de 4');
                            },
                          )),
                      const SizedBox(width: 20),
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text("Cadastro para Pacientes",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    //color: Color.fromARGB(255, 138, 161, 212),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                            Text("Terceira etapa", textAlign: TextAlign.left),
                          ],
                        ),
                      ),
                    ]),
                const SizedBox(height: 20),
                const Text(
                  'Onde você reside atualmente?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(138, 162, 212, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const SizedBox(height: 15),
                Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2.8,
                          child: ComponentsUtils.TextFieldEdit(
                              context,
                              1,
                              'CEP',
                              TextInputType.number,
                              const Icon(Icons.location_pin),
                              () {},
                              widget.cadastroController.controllerCep,
                              (cepp) {},
                              true)),
                      const SizedBox(height: 15),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: ComponentsUtils.TextFieldEdit(
                              context,
                              1,
                              'Número',
                              TextInputType.number,
                              const Icon(Icons.maps_home_work),
                              () {},
                              widget.cadastroController.controllerNum,
                              (cepp) {},
                              true)),
                    ]),
                const SizedBox(height: 10),
                ComponentsUtils.TextFieldEdit(
                    context,
                    1,
                    'Complemento',
                    TextInputType.streetAddress,
                    const Icon(Icons.edit),
                    () {},
                    widget.cadastroController.controllerComp,
                    (cepp) {},
                    true),
                const SizedBox(height: 10),
                ComponentsUtils.TextFieldEdit(
                    context,
                    1,
                    'Logradouro',
                    TextInputType.streetAddress,
                    const Icon(Icons.edit_road),
                    () {},
                    widget.cadastroController.controllerRua,
                    (cepp) {},
                    false),
                const SizedBox(height: 10),
                ComponentsUtils.TextFieldEdit(
                    context,
                    1,
                    'Bairro - Cidade - Estado',
                    TextInputType.text,
                    const Icon(Icons.location_city),
                    () {},
                    widget.cadastroController.controllerBairro,
                    (cepp) {},
                    false),
                const SizedBox(height: 15),
                Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            onPrimary: Colors.white,
                            primary: const Color.fromARGB(255, 125, 149, 202),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 12),
                          ),
                          onPressed: () {
                            widget.cadastroController.searchCep(context);
                          },
                          child: const Text('Consultar CEP')),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            onPrimary: Colors.white,
                            primary: const Color.fromARGB(255, 125, 149, 202),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 12),
                          ),
                          onPressed: () {
                            widget.cadastroController.verificarCad3(context);
                          },
                          child: const Icon(Icons.arrow_forward))
                    ]),
                const SizedBox(height: 15),
                GestureDetector(
                  child: const Text(
                    'Não sei meu CEP',
                    style: TextStyle(
                        color: Color.fromARGB(255, 125, 149, 202),
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold),
                  ),
                  // ignore: deprecated_member_use
                  onTap: () => launch(
                      'https://buscacepinter.correios.com.br/app/endereco/index.php'),
                ),
                const SizedBox(height: 15),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3.5,
                    child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: center,
                          zoom: 11,
                        ),
                        zoomControlsEnabled: true,
                        //mapType: MapType.satellite,
                        myLocationEnabled: true,
                        onMapCreated: widget.cadastroController.onMapCreated,
                        markers: widget.cadastroController.markers))
              ]),
            )));
  }
}
