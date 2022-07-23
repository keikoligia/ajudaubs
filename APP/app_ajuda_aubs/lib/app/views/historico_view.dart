import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import '../utils/components_widget.dart';

class HistoricoView extends StatefulWidget {
  const HistoricoView({Key? key}) : super(key: key);

  @override
  State<HistoricoView> createState() => _HistoricoViewState();
}

class _HistoricoViewState extends State<HistoricoView> {
  String email = ' ';

  late TextEditingController controllerEmail =
      TextEditingController(text: email);

  @override
  void initState() {
    super.initState();
    controllerEmail = TextEditingController(text: email);
    controllerEmail.text = ' ';
  }

  @override
  void dispose() {
    controllerEmail.dispose();
    super.dispose();
  }

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
                  const SizedBox(height: 40),
                  const Text(
                    'Histórico de registros',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 138, 161, 212),
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: ComponentsUtils.TextFieldEdit(
                          context,
                          1,
                          'Pesquisar',
                          TextInputType.text,
                          const Icon(Icons.search),
                          () {},
                          controllerEmail, (function) {
                        email = function;
                      }, true)),
                  const SizedBox(height: 10),
                  SizedBox(
                      height: MediaQuery.of(context).size.height - 250,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 15,
                          itemBuilder: (context, index) {
                            //List<Manifestacao> manifestacoes;
                            //Manifestacao file = manifestacoes.get(index);
                            //return listRegistros(file);

                            return listRegistros();
                          }))
                ]))));
  }

  Widget listRegistros() {
    return const ExpansionTileCard(
        leading: Text(
          'Elogio',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromARGB(255, 138, 161, 212),
//  color: Color.fromARGB(255, 255, 0, 0),
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
        title: Text(
          '08/05/2004 - UBS São Quirino',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromARGB(255, 138, 161, 212),
//  color: Color.fromARGB(255, 255, 0, 0),
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
        children: <Widget>[
          Divider(
            thickness: 1.0,
            height: 1.0,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                // ignore: unnecessary_const
                child: Text(
                  'text',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Color.fromARGB(255, 138, 161, 212),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              )),
        ]);
  }
}
