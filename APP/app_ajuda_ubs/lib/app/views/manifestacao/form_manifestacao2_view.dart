// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:ajuda_ubs/app/controllers/manifestacao_controller.dart';
import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

// ignore: must_be_immutable
class FormManifestacao2View extends StatefulWidget {
  ManifestacaoController manifestacaoController;
  String descricao;

  FormManifestacao2View(
      {Key? key, required this.manifestacaoController, required this.descricao})
      : super(key: key);

  @override
  _FormManifestacao2ViewState createState() => _FormManifestacao2ViewState();
}

class _FormManifestacao2ViewState extends State<FormManifestacao2View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
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
            child:  SingleChildScrollView(
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
                            children: [
                              const Text("Manifestação Pública",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      //color: Color.fromARGB(255, 138, 161, 212),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              Text(
                                  "Segunda etapa - ${widget.manifestacaoController.manifestacao.tipo}",
                                  textAlign: TextAlign.left),
                            ],
                          ),
                        ),
                      ]),
                  const SizedBox(height: 20),
                  Text(
                    widget.manifestacaoController.manifestacao.tipo,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Color.fromRGBO(138, 162, 212, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  Text(
                    widget.descricao,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Color.fromRGBO(138, 162, 212, 1),
                        //fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  /*
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Anonimato',
                          style: TextStyle(
                              color: Color.fromARGB(255, 118, 121, 129),
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                        ToggleSwitch(
                          minHeight: 30,
                          cornerRadius: 20.0,
                          activeBgColors: const [
                            [Color.fromARGB(255, 138, 161, 212)],
                            [Color.fromARGB(255, 138, 161, 212)]
                          ],
                          inactiveBgColor:
                              const Color.fromARGB(255, 227, 227, 227),
                          initialLabelIndex: 0,
                          totalSwitches: 2,
                          labels: const ['SIM', 'NÃO'],
                          radiusStyle: true,
                          onToggle: (index) {
                            print('switched to: $index');
                            if (index == 1) {
                              if (AppController.instance.isLogado) {
                                widget.manifestacao.idPaciente =
                                    AppController.instance.paciente.cns;
                              } else {
                                ComponentsUtils.Mensagem(
                                    'Erro de Indentificação',
                                    'Para se identificar na manifestação é necessário estar logado no sistema. Faça o login no aplicativo, caso já tenha uma conta, caso contrário crie uma para continuar o processo de identificação.',
                                    'Login', () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              const LoginUsuarioView()));
                                }, context);
                              }
                            } else {
                              widget.manifestacao.idPaciente = null;
                            }
                          },
                        )
                      ]),*/
                  ValueListenableBuilder(
                      valueListenable:
                          widget.manifestacaoController.dropValueAnonimato,
                      builder: (BuildContext context, String value, _) {
                        return Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: DropdownButtonFormField<String>(
                                isExpanded: true,
                                icon: const Icon(Icons.person),
                                hint: const Text(
                                  'Seus dados pessoais estarão protegidos!',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                decoration: InputDecoration(
                                  label: const Text(
                                    'Identificação Anônima',
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
                                items: widget
                                    .manifestacaoController.dropOpcoesAnonimato
                                    .map((op) => DropdownMenuItem(
                                          value: op,
                                          child: Text(op),
                                        ))
                                    .toList(),
                                onChanged: (escolha) {
                                  widget
                                      .manifestacaoController
                                      .dropValueAnonimato
                                      .value = escolha.toString();
                                }));
                      }),
                  const SizedBox(height: 20),
                  ValueListenableBuilder(
                      valueListenable:
                          widget.manifestacaoController.dropValueOpcoes,
                      builder: (BuildContext context, String value, _) {
                        return Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: DropdownButtonFormField<String>(
                                onTap: () {},
                                isExpanded: true,
                                icon: const Icon(Icons.local_hospital),
                                hint: const Text(
                                  'Escolha onde ocorreu a denúncia',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                decoration: InputDecoration(
                                  label: const Text(
                                    'Local da denúncia',
                                    style: TextStyle(
                                        //color: Color.fromRGBO(138, 162, 212, 1),
                                        // color: Colors.black,
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
                                items: widget.manifestacaoController.dropOpcoes
                                    .map((op) => DropdownMenuItem(
                                          value: op,
                                          child: Text(op,
                                              overflow: TextOverflow.visible),
                                        ))
                                    .toList(),
                                onChanged: (escolha) {
                                  widget.manifestacaoController.dropValueOpcoes
                                      .value = escolha.toString();
                                }));
                      }),
                  const SizedBox(height: 20),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Center(
                          child: TextField(
                        keyboardType: TextInputType.text,
                        maxLength: 500,
                        controller:
                            widget.manifestacaoController.controllerDescricao,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          hintText:
                              'Descreva abaixo o conteúdo de sua manifestação. Seja claro e objetivo.',
                          label: const Text(
                            'Descrição',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
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
                        maxLines: 12,
                      ))),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        onPrimary: Colors.white,
                        primary: const Color.fromARGB(255, 98, 127, 189),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 12),
                      ),
                      onPressed: () async {
                        widget.manifestacaoController.verificacaoMan2(context);
                      },
                      child: const Icon(Icons.arrow_forward)),
                  const SizedBox(height: 20),
                ],
              ),
            )));
  }
}
