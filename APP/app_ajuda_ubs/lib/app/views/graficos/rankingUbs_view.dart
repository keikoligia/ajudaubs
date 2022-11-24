// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'dart:convert';

import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:ajuda_ubs/app/utils/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ajuda_ubs/app/models/ubs_model.dart';
import 'package:ajuda_ubs/app/views/screens/ubs_view.dart';

class RankingUbsView extends StatefulWidget {
  const RankingUbsView({Key? key}) : super(key: key);

  @override
  _RankingUbsViewState createState() => _RankingUbsViewState();
}

class _RankingUbsViewState extends State<RankingUbsView> {
  late UBS? ubs;
  var foto = User.myUser;

  bool isLoadUbs = false;

  @override
  void initState() {
    super.initState();
    loadPostos();
  }

  loadUbs(String ubs) async {
    try {
      var responseUbs =
          await http.get(Uri.parse('http://localhost:3000/ubs/$ubs'));

      if (responseUbs.statusCode == 200) {
        UBS listUbs = UBS.fromJson(responseUbs.body);
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => UbsView(ubs: listUbs)));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Ranking UBS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 138, 161, 212),
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                              ComponentsUtils.ImageRanking(
                                context,
                                foto.imagePath,
                                true,
                                const Text(
                                  '3°',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      shadows: <Shadow>[
                                        Shadow(
                                          blurRadius: 3.0,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ],
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              Text(
                                listUbs[2].nome,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  shadows: <Shadow>[
                                    Shadow(
                                      blurRadius: 3.0,
                                      color: Colors.white,
                                    ),
                                  ],
                                  color: Colors.brown,
                                  fontWeight: FontWeight.bold,
                                  //fontSize: 10
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 138, 161, 212),
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        topLeft: Radius.circular(12)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 3,
                                        blurRadius: 5,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      )
                                    ]),
                              )
                            ])),
                        Expanded(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                              ComponentsUtils.ImageRanking(
                                context,
                                foto.imagePath,
                                true,
                                const Text(
                                  '1°',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      shadows: <Shadow>[
                                        Shadow(
                                          blurRadius: 3.0,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ],
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              Text(
                                listUbs[0].nome,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  shadows: <Shadow>[
                                    Shadow(
                                      blurRadius: 3.0,
                                      color: Colors.white,
                                    ),
                                  ],
                                  //     color: Colors.amber,
                                  fontWeight: FontWeight.bold,
                                  //fontSize: 10
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 120,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 138, 161, 212),
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        topLeft: Radius.circular(12)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 3,
                                        blurRadius: 5,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      )
                                    ]),
                              )
                            ])),
                        Expanded(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                              ComponentsUtils.ImageRanking(
                                context,
                                foto.imagePath,
                                true,
                                const Text(
                                  '2°',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      shadows: <Shadow>[
                                        Shadow(
                                          blurRadius: 3.0,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ],
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              Text(
                                listUbs[1].nome,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  shadows: <Shadow>[
                                    Shadow(
                                      blurRadius: 3.0,
                                      color: Colors.white,
                                    ),
                                  ],
                                  // color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  //fontSize: 10
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 80,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 138, 161, 212),
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        topLeft: Radius.circular(12)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 3,
                                        blurRadius: 5,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      )
                                    ]),
                              )
                            ])),
                      ]),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 201, 214, 242),
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(12),
                              topLeft: Radius.circular(12)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            )
                          ]),
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: listUbs.length,
                          itemBuilder: (context, index) {
                            UbsAvalicao file = listUbs[index];
                            if (index > 0) {
                              String pos = '${index + 3}°';
                              return SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 100,
                                  child: InkWell(
                                      onTap: () {
                                        loadUbs(file.cnes);
                                      },
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                Text(
                                                  pos,
                                                  textAlign: TextAlign.center,
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      5,
                                                  child: SizedBox(
                                                    child: Image.network(
                                                        'https://i0.wp.com/cartacampinas.com.br/wordpress/wp-content/uploads/foto-ubs-divulgacao-pref-de-maranguape.jpg?fit=650%2C396&ssl=1&w=640',
                                                        fit: BoxFit.fill),
                                                    //decoration: BoxDecoration(border: BoxFit.cover,
                                                    width: 30,
                                                    height: 30,
                                                  ),
                                                ),
                                                SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            1.5,
                                                    child: Center(
                                                      child: Text(file.nome,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontSize: 15)),
                                                    )),
                                              ],
                                            )
                                          ])));
                            }
                            return Container();
                          }))
                ]))));
  }

  loadPostos() async {
    try {
      var responseUbs = await http.get(Uri.parse('http://localhost:3000/rank'));

      if (responseUbs.statusCode == 200) {
        listUbs = UbsAvalicao.fromJsons(responseUbs.body);

        listUbs.sort((a, b) => a.media > b.media ? -1 : 1);

        setState(() {});
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

late List<UbsAvalicao> listUbs = [];
late UbsAvalicao ubs;

class UbsAvalicao {
  final String nome;
  final double media;
  final String cnes;
  UbsAvalicao({
    required this.nome,
    required this.media,
    required this.cnes,
  });

  static List<UbsAvalicao> fromJsons(String str) {
    final list = json.decode(str);

    var users = <UbsAvalicao>[];

    for (int i = 0; i < list.length; i++) {
      users.add(UbsAvalicao.fromMap(list[i]));
    }

    return users;
  }

  UbsAvalicao copyWith({
    String? nome,
    double? media,
    String? cnes,
  }) {
    return UbsAvalicao(
      nome: nome ?? this.nome,
      media: media ?? this.media,
      cnes: cnes ?? this.cnes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'media': media,
      'cnes': cnes,
    };
  }

  factory UbsAvalicao.fromMap(Map<String, dynamic> map) {
    return UbsAvalicao(
      nome: map['nome'] as String,
      media: map['media'] as double,
      cnes: map['cnes'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UbsAvalicao.fromJson(String source) =>
      UbsAvalicao.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UbsAvalicao(nome: $nome, media: $media, cnes: $cnes)';

  @override
  bool operator ==(covariant UbsAvalicao other) {
    if (identical(this, other)) return true;

    return other.nome == nome && other.media == media && other.cnes == cnes;
  }

  @override
  int get hashCode => nome.hashCode ^ media.hashCode ^ cnes.hashCode;
}
