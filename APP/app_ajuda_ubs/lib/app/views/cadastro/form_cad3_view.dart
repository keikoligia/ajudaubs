import 'package:ajuda_ubs/app/controllers/cadastro_controller.dart';
import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:flutter/material.dart';
import 'package:ajuda_ubs/app/utils/user_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class FormCad3View extends StatefulWidget {
  CadastroController cadastroController;
  FormCad3View({Key? key, required this.cadastroController}) : super(key: key);

  @override
  State<FormCad3View> createState() => _FormCad3ViewState();
}

class _FormCad3ViewState extends State<FormCad3View> {
  var user = UserPreferences.myUser;

  late String cep = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                const SizedBox(height: 30),
                const Text(
                  'CADASTRO',
                  style: TextStyle(
                      color: Color.fromARGB(255, 138, 161, 212),
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                const SizedBox(height: 5),
                const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: LinearProgressIndicator(
                        value: 0.6, color: Color.fromRGBO(138, 162, 212, 1))),
                const SizedBox(height: 100),
                const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      'Onde você reside atualmente?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(138, 162, 212, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    )),
                const SizedBox(height: 15),
                Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 20, right: 10),
                          child: SizedBox(
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
                                  true))),
                      const SizedBox(height: 15),
                      Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: SizedBox(
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
                                  true))),
                    ]),
                const SizedBox(height: 10),
                Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: ComponentsUtils.TextFieldEdit(
                        context,
                        1,
                        'Complemento',
                        TextInputType.streetAddress,
                        const Icon(Icons.edit),
                        () {},
                        widget.cadastroController.controllerComp,
                        (cepp) {},
                        true)),
                const SizedBox(height: 10),
                Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: ComponentsUtils.TextFieldEdit(
                        context,
                        1,
                        'Logradouro',
                        TextInputType.streetAddress,
                        const Icon(Icons.edit_road),
                        () {},
                        widget.cadastroController.controllerRua,
                        (cepp) {},
                        false)),
                const SizedBox(height: 10),
                Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: ComponentsUtils.TextFieldEdit(
                        context,
                        1,
                        'Bairro - Cidade - Estado',
                        TextInputType.text,
                        const Icon(Icons.location_city),
                        () {},
                        widget.cadastroController.controllerBairro,
                        (cepp) {},
                        false)),
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
                  onTap: () => launch(
                      'https://buscacepinter.correios.com.br/app/endereco/index.php'),
                )
              ]),
            )));
  }
}
