// ignore_for_file: unused_import

import 'package:ajuda_ubs/app/controllers/manifestacao_controller.dart';
import 'package:ajuda_ubs/app/models/cargoarea_model.dart';
import 'package:ajuda_ubs/app/models/envolvido_model.dart';
import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class FormManifestacao4View extends StatefulWidget {
  ManifestacaoController manifestacaoController;

  FormManifestacao4View({Key? key, required this.manifestacaoController})
      : super(key: key);
  @override
  _FormManifestacao4ViewState createState() => _FormManifestacao4ViewState();
}

class _FormManifestacao4ViewState extends State<FormManifestacao4View> {
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
            child: SingleChildScrollView(
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
                                return const Text('4 de 4');
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
                                  "Última etapa - ${widget.manifestacaoController.manifestacao.tipo}",
                                  textAlign: TextAlign.left),
                            ],
                          ),
                        ),
                      ]),
                  const SizedBox(height: 20),
                  const Text(
                    'Deseja adicionar imagens?',
                    style: TextStyle(
                        color: Color.fromARGB(255, 138, 161, 212),
                        fontWeight: FontWeight.bold,
                        fontSize: 19),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: (widget.manifestacaoController.qtdImagns >=
                                      3 &&
                                  widget.manifestacaoController.temImagens)
                              ? ListTile(
                                  enabled: true,
                                  onTap: () {
                                    widget.manifestacaoController.pickFiless();
                                  },
                                  leading: Text(
                                    "${widget.manifestacaoController.qtdImagns} /3",
                                    textAlign: TextAlign.right,
                                  ),
                                  title: const Text(
                                    "Alterar imagens",
                                    textAlign: TextAlign.right,
                                  ),
                                  trailing: const Icon(Icons.edit),
                                )
                              : ListTile(
                                  enabled: true,
                                  onTap: () {
                                    widget.manifestacaoController.pickFiless();
                                  },
                                  leading: Text(
                                    "${widget.manifestacaoController.qtdImagns} /3",
                                    textAlign: TextAlign.right,
                                  ),
                                  title: const Text(
                                    "Adicionar imagens",
                                    textAlign: TextAlign.right,
                                  ),
                                  trailing: const Icon(Icons.attach_file),
                                ))),
                  (widget.manifestacaoController.result?.files != null &&
                          ((widget.manifestacaoController.result?.files
                                      .length ??
                                  0) <=
                              3))
                      ? SizedBox(
                          height: 225,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: widget
                                  .manifestacaoController.result!.files.length,
                              itemBuilder: (context, index) {
                                final file = widget.manifestacaoController
                                    .result!.files[index];
                                return widget.manifestacaoController
                                    .buildFile(file);
                              }))
                      : Text(
                          ((widget.manifestacaoController.qtdImagns > 3)
                              ? 'Por favor, escolha no máximo 3 imagens.'
                              : ''),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 255, 0, 0),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                  const Text(
                    'Quais são os envolvidos no fato?',
                    style: TextStyle(
                        color: Color.fromARGB(255, 138, 161, 212),
                        fontWeight: FontWeight.bold,
                        fontSize: 19),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                      height: 135 *
                          widget.manifestacaoController.qtdEnvolvidos
                              .toDouble(),
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount:
                              widget.manifestacaoController.qtdEnvolvidos,
                          itemBuilder: (context, index) {
                            widget.manifestacaoController.nome.add('');
                            widget.manifestacaoController.funcao.add('');

                            widget.manifestacaoController.texts.add(
                                TextEditingController(
                                    text: widget
                                        .manifestacaoController.nome[index]));
                            var dropValueFuncao = ValueNotifier('');

                            return Padding(
                                padding:
                                    const EdgeInsets.only(left: 40, right: 40),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 5),
                                    ComponentsUtils.TextFieldEdit(
                                        context,
                                        1,
                                        'Nome do ${index + 1}° Envolvido',
                                        TextInputType.text,
                                        const Icon(Icons.person),
                                        () {},
                                        widget.manifestacaoController
                                            .texts[index], (function) {
                                      widget.manifestacaoController
                                          .nome[index] = function;
                                    }, true),
                                    const SizedBox(height: 5),
                                    ValueListenableBuilder(
                                        valueListenable: dropValueFuncao,
                                        builder: (BuildContext context,
                                            String value, _) {
                                          return DropdownButtonFormField<
                                                  String>(
                                              isExpanded: true,
                                              icon: const Icon(Icons.person),
                                              /*hint: const Text(
                                                'Seus dados pessoais estarão protegidos!',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),*/
                                              decoration: InputDecoration(
                                                label: const Text(
                                                  'Função do envolvido',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15),
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        borderSide:
                                                            const BorderSide(
                                                          color: Color.fromRGBO(
                                                              138, 162, 212, 1),
                                                          width: 2,
                                                        )),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        borderSide:
                                                            const BorderSide(
                                                          color: Color.fromRGBO(
                                                              138, 162, 212, 1),
                                                          width: 2,
                                                        )),
                                              ),
                                              value: (value.isEmpty)
                                                  ? null
                                                  : value,
                                              items: widget
                                                  .manifestacaoController
                                                  .cargosAreas
                                                  .map((op) => DropdownMenuItem(
                                                        value: op,
                                                        child: Text(op),
                                                      ))
                                                  .toList(),
                                              onChanged: (escolha) {
                                                setState(() {
                                                  dropValueFuncao.value =
                                                      escolha!;
                                                  widget.manifestacaoController
                                                      .funcao[index] = escolha;
                                                });
                                              });
                                        }),
                                    const SizedBox(height: 15),
                                  ],
                                ));
                          })),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            onPrimary: Colors.white,
                            primary: const Color.fromARGB(255, 177, 193, 228),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 12),
                          ),
                          onPressed: () async {
                            if (widget.manifestacaoController.qtdEnvolvidos ==
                                    0 ||
                                (widget
                                        .manifestacaoController
                                        .nome[widget.manifestacaoController
                                                .qtdEnvolvidos -
                                            1]
                                        .isNotEmpty &&
                                    widget
                                        .manifestacaoController
                                        .funcao[widget.manifestacaoController
                                                .qtdEnvolvidos -
                                            1]
                                        .isNotEmpty)) {
                              setState(() {
                                widget.manifestacaoController.qtdEnvolvidos++;
                              });
                            } else {
                              ComponentsUtils.Mensagem(
                                  false,
                                  'Erro ',
                                  'Preencha os dados do ${widget.manifestacaoController.qtdEnvolvidos}° envolvido antes de adicionar outro.',
                                  'Certo',
                                  () {},
                                  context);
                            }
                          },
                          child: const Icon(Icons.add)),
                      const SizedBox(height: 20),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            onPrimary: Colors.white,
                            primary: const Color.fromARGB(255, 177, 193, 228),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 12),
                          ),
                          onPressed: () async {
                            setState(() {
                              if (widget.manifestacaoController.qtdEnvolvidos >
                                  0) {
                                widget.manifestacaoController.qtdEnvolvidos--;
                              }
                            });
                          },
                          child: const Icon(Icons.remove)),
                      const SizedBox(height: 20),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            onPrimary: Colors.white,
                            primary: const Color.fromARGB(255, 98, 127, 189),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 12),
                          ),
                          onPressed: () async {
                            widget.manifestacaoController
                                .verificacaoMan4(context);
                          },
                          child: const Text('Finalizar')),
                    ],
                  ),
                ]))));
  }
}
