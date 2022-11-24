import 'package:ajuda_ubs/app/controllers/cadastro_controller.dart';
import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

// ignore: must_be_immutable
class FormCadastro2View extends StatefulWidget {
  CadastroController cadastroController;
  FormCadastro2View({
    Key? key,
    required this.cadastroController,
  }) : super(key: key);

  @override
  State<FormCadastro2View> createState() => _FormCadastro2ViewState();
}

class _FormCadastro2ViewState extends State<FormCadastro2View> {
  late DateTime dateTime = DateTime.now();


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
                    child:  Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                                  return const Text('2 de 4');
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
                                Text("Segunda etapa",
                                    textAlign: TextAlign.left),
                              ],
                            ),
                          ),
                        ]),
                    const SizedBox(height: 60),
                    const Text(
                      'Como podemos entrar em contato?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(138, 162, 212, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    const SizedBox(height: 15),
                    ComponentsUtils.TextFieldEdit(
                        context,
                        1,
                        'Telefone',
                        TextInputType.phone,
                        const Icon(Icons.phone),
                        () {},
                        widget.cadastroController.controllerTelefone,
                        (tele) {},
                        true),
                    const SizedBox(height: 15),
                    ComponentsUtils.TextFieldEdit(
                        context,
                        1,
                        'Email',
                        TextInputType.emailAddress,
                        const Icon(Icons.email),
                        () {},
                        widget.cadastroController.controllerEmail,
                        (ctt) {},
                        true),
                    const SizedBox(height: 20),
                    const Text(
                      'Qual UBS você freguenta?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(138, 162, 212, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    const SizedBox(height: 30),
                    ValueListenableBuilder(
                        valueListenable: widget.cadastroController.dropValue,
                        builder: (BuildContext context, String value, _) {
                          return DropdownButtonFormField<String>(
                              isExpanded: true,
                              icon: const Icon(Icons.local_hospital),
                              hint: const Text(
                                  'Escolha a UBS que está vinculado atualmente'),
                              decoration: InputDecoration(
                                label: const Text(
                                  'UBS - Unidade Básica de Saúde',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                      color: Color.fromRGBO(138, 162, 212, 1),
                                      width: 2,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                      color: Color.fromRGBO(138, 162, 212, 1),
                                      width: 2,
                                    )),
                              ),
                              value: (value.isEmpty) ? null : value,
                              items: widget.cadastroController.dropOpcoes
                                  .map((op) => DropdownMenuItem(
                                        value: op,
                                        child: Text(op,
                                            overflow: TextOverflow.visible),
                                      ))
                                  .toList(),
                              onChanged: (escolha) {
                                widget.cadastroController.dropValue.value =
                                    escolha.toString();
                              });
                        }),
                    const SizedBox(height: 30),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          onPrimary: Colors.white,
                          primary: const Color.fromARGB(255, 125, 149, 202),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 12),
                        ),
                        onPressed: () {
                          widget.cadastroController.verificarCad2(context);
                        },
                        child: const Icon(Icons.arrow_forward)),
                    const SizedBox(height: 15)
                  ],
                ),
              ),
            ));
  }
}
