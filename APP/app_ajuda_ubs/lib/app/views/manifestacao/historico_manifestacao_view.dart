// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:ajuda_ubs/app/models/envolvido_model.dart';
import 'package:ajuda_ubs/app/models/manifestacao_model.dart';
import 'package:ajuda_ubs/app/models/ubs_model.dart';
import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:ajuda_ubs/app/utils/user_preferences.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HistoricoManifestacaoView extends StatefulWidget {
  const HistoricoManifestacaoView({Key? key}) : super(key: key);

  @override
  State<HistoricoManifestacaoView> createState() =>
      _HistoricoManifestacaoViewState();
}

class _HistoricoManifestacaoViewState extends State<HistoricoManifestacaoView> {
  late List<Manifestacao> manifestacoes = [];
  late List<Envolvido> envolvidos = [];
  late List<UBS> listUbs = [];
  late TextEditingController controllerEmail = TextEditingController();
  late User usuario;
  late int paginaAtual = 0;
  late Timer timer;
  late PageController pageController;

  @override
  void dispose() {
    controllerEmail.dispose();
    super.dispose();
    timer.cancel();
  }

  @override
  void initState() {
    getManifestacoes();
    super.initState();
  }

  void getManifestacoes() async {
    try {
      var response =
          await http.get(Uri.parse('http://localhost:3000/manifestacao'));
      if (response.statusCode == 200) {
        manifestacoes = Manifestacao.fromJsons(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    try {
      var response = await http.get(Uri.parse('http://localhost:3000/ubs'));
      if (response.statusCode == 200) {
        listUbs = UBS.fromJsons(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    try {
      var response =
          await http.get(Uri.parse('http://localhost:3000/envolvido'));
      if (response.statusCode == 200) {
        envolvidos = Envolvido.fromJsons(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    setState(() {});
  }

  dados(String titulo, String conteudo, bool textNegrito, bool textColor) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width / 4,
            child: Text(
              titulo,
              textAlign: TextAlign.left,
              style: const TextStyle(
                  //color: Color.fromARGB(255, 97, 132, 206),
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            )),
        Expanded(
          child: SelectableText(
            conteudo,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: (textColor == true)
                    ? Color.fromARGB(255, 71, 116, 212)
                    : null,
                fontWeight: (textNegrito == true) ? FontWeight.bold : null,
                fontSize: 15),
          ),
        ),
      ],
    );
  }

  Widget dadosClick(var file, bool isImage, String titulo, String subTitulo) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width / 4,
            child: Text(
              titulo,
              textAlign: TextAlign.left,
              style: const TextStyle(
                  // color: Color.fromARGB(255, 97, 132, 206),
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            )),
        Expanded(
          child: GestureDetector(
            onTap: () {
              pageController = PageController(initialPage: paginaAtual);

              List<Widget> retImagens = [];
              List<int> list = [];
              List<int> qtdComponente = [];

              if (isImage) {
                if (file.imagem1 != null) {
                  list = utf8.encode(file.imagem1!);
                  Uint8List bytesImage1 = Uint8List.fromList(list);
                  retImagens.add(Image.memory(bytesImage1));
                  qtdComponente.add(0);
                }

                if (file.imagem2 != null) {
                  list = utf8.encode(file.imagem2!);
                  Uint8List bytesImage2 = Uint8List.fromList(list);
                  retImagens.add(Image.memory(bytesImage2));
                  qtdComponente.add(1);
                }

                if (file.imagem3 != null) {
                  list = utf8.encode(file.imagem3!);
                  Uint8List bytesImage3 = Uint8List.fromList(list);
                  retImagens.add(Image.memory(bytesImage3));
                  qtdComponente.add(2);
                }
              }

              if (retImagens.isNotEmpty || !isImage) {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => Column(children: <Widget>[
                          const SizedBox(height: 10),
                          Center(
                            child: Text(
                              subTitulo,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 97, 132, 206),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          (isImage)
                              ? SizedBox(
                                  height: 70,
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: qtdComponente.map((i) {
                                        return InkWell(
                                          onTap: () {
                                            setState(() {
                                              paginaAtual = i;
                                            });
                                            pageController.jumpToPage(i);
                                          },
                                          child: Container(
                                            margin: EdgeInsets.all(10),
                                            width: 30,
                                            height: 30,
                                            child: Center(
                                              child: Text((i + 1).toString(),
                                                  textAlign: TextAlign.center),
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: Color.fromARGB(
                                                  255, 138, 161, 212),
                                            ),
                                          ),
                                        );
                                      }).toList()))
                              : Container(),
                          const SizedBox(height: 10),
                          (isImage)
                              ? Expanded(
                                  child: PageView(
                                      onPageChanged: (index) {
                                        setState(() {
                                          paginaAtual = index;
                                        });
                                        pageController.jumpToPage(index);
                                      },
                                      controller: pageController,
                                      children: [
                                        for (var item in retImagens) item
                                      ]),
                                )
                              : Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'NOME',
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                              // color: Color.fromARGB(255, 97, 132, 206),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        const SizedBox(height: 10),
                                        for (var item in envolvidos)
                                          Text(item.nomeEnvolvido)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'CARGO',
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                              // color: Color.fromARGB(255, 97, 132, 206),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        const SizedBox(height: 10),
                                        for (var item in envolvidos)
                                          Text(item.cargoEnvolvido)
                                      ],
                                    ),
                                  ],
                                ),
                        ]));
              } else {
                ComponentsUtils.Mensagem(
                    false,
                    'Erro nas Imagens',
                    'Nenhuma imagem foi encontrada na manifestação.',
                    '',
                    () {},
                    context);
              }
            },
            child: Text(
              'Clique para exibir...',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  //color: Color.fromARGB(255, 71, 116, 212),
                  //fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
        )
      ],
    );
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
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 40),
                          const Text(
                            'Histórico de Manifestações',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromARGB(255, 138, 161, 212),
                                fontWeight: FontWeight.bold,
                                fontSize: 27),
                          ),
                          const SizedBox(height: 20),
                          ComponentsUtils.TextFieldEdit(
                              context,
                              1,
                              'Pesquisar',
                              TextInputType.text,
                              const Icon(Icons.search),
                              () {},
                              controllerEmail,
                              (function) {},
                              true),
                          const SizedBox(height: 10),
                          SizedBox(
                              height: MediaQuery.of(context).size.height - 250,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: manifestacoes.length,
                                  itemBuilder: (context, index) {
                                    Manifestacao file = manifestacoes[index];

                                    UBS ubs = listUbs.singleWhere((element) =>
                                        element.cnes == file.idUbs);

                                    return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ExpansionTileCard(
                                              leading: Text(
                                                '${file.tipo}'
                                                '\n'
                                                ' ${file.dataManifestacao}',
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 76, 114, 196),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                              title: Text(
                                                ubs.nome,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 138, 161, 212),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                              children: [
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20,
                                                            right: 20),
                                                    child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Divider(
                                                            thickness: 1.0,
                                                            height: 5.0,
                                                          ),
                                                          dados(
                                                              'Descrição:',
                                                              file.descricao,
                                                              false,
                                                              false),
                                                          const SizedBox(
                                                              height: 10),
                                                          dados(
                                                              'Status:',
                                                              file.status,
                                                              true,
                                                              true),
                                                          const SizedBox(
                                                              height: 10),
                                                          dados(
                                                              'Protocolo:',
                                                              file.protocolo,
                                                              false,
                                                              true),
                                                          const SizedBox(
                                                              height: 10),
                                                          dados(
                                                              'Código:',
                                                              file.codigoAcesso,
                                                              false,
                                                              true),
                                                          const SizedBox(
                                                              height: 10),
                                                          dadosClick(
                                                              file,
                                                              true,
                                                              'Imagens:',
                                                              'Lista de imagens:'),
                                                          const SizedBox(
                                                              height: 10),
                                                          dadosClick(
                                                              file,
                                                              false,
                                                              'Envolvidos:',
                                                              'Lista de envolvidos:'),
                                                          const SizedBox(
                                                              height: 10),
                                                        ]))
                                              ]),
                                          const Divider(
                                              height: 15,
                                              endIndent: 20,
                                              indent: 20,
                                              thickness: 1,
                                              color: Color.fromRGBO(
                                                  138, 162, 212, 1)),
                                          const SizedBox(height: 10),
                                        ]);
                                  }))
                        ])))));
  }
}
