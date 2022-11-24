// ignore_for_file: must_be_immutable

import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ajuda_ubs/app/models/ubs_model.dart';

class UbsView extends StatefulWidget {
  UBS ubs;

  UbsView({Key? key, required this.ubs}) : super(key: key);

  @override
  State<UbsView> createState() => _UbsViewState();
}

class _UbsViewState extends State<UbsView> {
  @override
  Widget build(BuildContext context) {
    UBS posto = widget.ubs;

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
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    posto.nome,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 138, 161, 212),
//  color: Color.fromARGB(255, 255, 0, 0),
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
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
                          context, posto.email, 'Email'),
                      const Divider(
                          height: 15,
                          endIndent: 20,
                          indent: 20,
                          thickness: 1,
                          color: Color.fromRGBO(138, 162, 212, 1)),
                      ComponentsUtils.TextLabelValue(
                          context, posto.telefone, 'Telefone'),
                      const Divider(
                          height: 15,
                          endIndent: 20,
                          indent: 20,
                          thickness: 1,
                          color: Color.fromRGBO(138, 162, 212, 1)),
                      ComponentsUtils.TextLabelValue(
                          context, posto.endereco, 'Endereço'),
                      const Divider(
                          height: 15,
                          endIndent: 20,
                          indent: 20,
                          thickness: 1,
                          color: Color.fromRGBO(138, 162, 212, 1)),
                      ComponentsUtils.TextLabelValue(
                          context, posto.vinculo, 'Vinculo'),
                      const Divider(
                          height: 15,
                          endIndent: 20,
                          indent: 20,
                          thickness: 1,
                          color: Color.fromRGBO(138, 162, 212, 1)),
                      ComponentsUtils.TextLabelValue(
                          context, posto.cnes, 'CNES'),
                      const Divider(
                          height: 15,
                          endIndent: 20,
                          indent: 20,
                          thickness: 1,
                          color: Color.fromRGBO(138, 162, 212, 1)),
                      ComponentsUtils.TextLabelValue(
                          context, posto.idPrefeitura, 'Prefeitura'),
                      const Divider(
                          height: 15,
                          endIndent: 20,
                          indent: 20,
                          thickness: 1,
                          color: Color.fromRGBO(138, 162, 212, 1)),
                      ComponentsUtils.TextLabelValue(
                          context, posto.horario, 'Horário de Funcionamento'),
                      const Divider(
                          height: 15,
                          endIndent: 20,
                          indent: 20,
                          thickness: 1,
                          color: Color.fromRGBO(138, 162, 212, 1)),
                      /* ComponentsUtils.TextLabelValue(
                          context, posto., 'Vínculo'),
                      const Divider(
                          height: 15,
                          endIndent: 20,
                          indent: 20,
                          thickness: 1,
                          color: Color.fromRGBO(138, 162, 212, 1)),*/
                      Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 3,
                                child: const Text(
                                  'Avaliar UBS:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                )),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Center(
                                  child: RatingBar.builder(
                                initialRating: 0,
                                minRating: 1,
                                maxRating: 5,
                                itemCount: 5,
                                itemSize: 30,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 1.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  //   print(rating);
                                },
                              )),
                            )
                          ]),
                    ],
                  ),
                ],
              ),
            ))));
  }
}
