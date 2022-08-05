import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class UbsView extends StatefulWidget {
  const UbsView({Key? key}) : super(key: key);

  @override
  State<UbsView> createState() => _UbsViewState();
}

class _UbsViewState extends State<UbsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'UBS São Quirino',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    ignoreGestures: true,
                    maxRating: 5,
                    itemCount: 5,
                    itemSize: 30,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      // print(rating);
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 3,
                              color: const Color.fromARGB(255, 163, 176, 206)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Image.asset(
                        'assets/imagens/ubs.png',
                        fit: BoxFit.cover,
                      ),
                      width: 200,
                      height: 200),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      ComponentsUtils.TextLabelValue(
                          context, 'ubs@campinas.sp.gov.br', 'Email'),
                      const Divider(
                          height: 15,
                          endIndent: 20,
                          indent: 20,
                          thickness: 1,
                          color: Color.fromRGBO(138, 162, 212, 1)),
                      ComponentsUtils.TextLabelValue(
                          context, '(19) 3256-7243', 'Telefone'),
                      const Divider(
                          height: 15,
                          endIndent: 20,
                          indent: 20,
                          thickness: 1,
                          color: Color.fromRGBO(138, 162, 212, 1)),
                      ComponentsUtils.TextLabelValue(
                          context,
                          'Avenida Diogo Álvares, 1450 - Parque São Quirino - CEP 13088-221',
                          'Endereço'),
                      const Divider(
                          height: 15,
                          endIndent: 20,
                          indent: 20,
                          thickness: 1,
                          color: Color.fromRGBO(138, 162, 212, 1)),
                      ComponentsUtils.TextLabelValue(
                          context,
                          'Segunda à sexta-feira, das 7h às 19h / Sábado, das 7h00 às 13h00',
                          'Horário de Funcionamento'),
                      const Divider(
                          height: 15,
                          endIndent: 20,
                          indent: 20,
                          thickness: 1,
                          color: Color.fromRGBO(138, 162, 212, 1)),
                      ComponentsUtils.TextLabelValue(
                          context, 'Distrito de Saúde Leste', 'Vínculo'),
                      const Divider(
                          height: 15,
                          endIndent: 20,
                          indent: 20,
                          thickness: 1,
                          color: Color.fromRGBO(138, 162, 212, 1)),
                      ComponentsUtils.TextLabelValue(context, '5', 'Elogios'),
                      const Divider(
                          height: 15,
                          endIndent: 20,
                          indent: 20,
                          thickness: 1,
                          color: Color.fromRGBO(138, 162, 212, 1)),
                      ComponentsUtils.TextLabelValue(context, '2', 'Denúncias'),
                      const SizedBox(height: 15),
                      SizedBox(
                          width: MediaQuery.of(context).size.width - 20,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: const Color.fromARGB(255, 163, 176, 206),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  //const SizedBox(width: 15),
                                  SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      child: const Text(
                                        'Avaliar UBS:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      )),
                                  SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Center(
                                              child: RatingBar.builder(
                                            initialRating: 0,
                                            minRating: 1,
                                            maxRating: 5,
                                            itemCount: 5,
                                            itemSize: 30,
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 1.0),
                                            itemBuilder: (context, _) =>
                                                const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              //   print(rating);
                                            },
                                          )),
                                        ],
                                      ))
                                ]),
                          ))
                    ],
                  ),
                ],
              ),
            )));
  }
}
