// ignore_for_file: must_be_immutable

import 'package:ajuda_ubs/app/models/paciente_model.dart';
import 'package:ajuda_ubs/app/models/ubs_model.dart';
import 'package:ajuda_ubs/app/utils/app_controller.dart';
import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:ajuda_ubs/app/utils/user_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'editar_usuario_view.dart';
import '../screens/ubs_view.dart';

class PerfilUsuarioView extends StatefulWidget {
  const PerfilUsuarioView({Key? key}) : super(key: key);

  @override
  _PerfilUsuarioViewState createState() => _PerfilUsuarioViewState();
}

class _PerfilUsuarioViewState extends State<PerfilUsuarioView> {
  var foto = User.myUser;
  late UBS ubs;
  late Paciente usuario;
  late List<String> dropOpcoes = ['UBS 1', 'UBS 2', 'UBS 3', 'UBS 4'];

  fazerLigacao() async {
    const url = "tel:86994324465";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    usuario = AppController.instance.paciente;

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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  ComponentsUtils.ImagePerson(
                      context, foto.imagePath, false, () {}),
                  const SizedBox(height: 15),
                  Column(
                    children: [
                      Text(
                        usuario.nome,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        usuario.email,
                        style: const TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Center(
                      child: ComponentsUtils.ButtonTextColor(
                    context,
                    'Atualizar dados',
                    () async {
                      late List<UBS> listUbs;

                      try {
                        var response = await http
                            .get(Uri.parse('http://localhost:3000/ubs'));
                        if (response.statusCode == 200) {
                          listUbs = UBS.fromJsons(response.body);
                          dropOpcoes.clear();
                          for (int i = 0; i < listUbs.length; i++) {
                            dropOpcoes.add(listUbs.elementAt(i).nome);
                          }
                        }
                      } catch (e) {
                        print(e.toString());
                      }

                      ubs = listUbs.singleWhere((element) =>
                          element.cnes ==
                          AppController.instance.paciente.idUbs);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => EditarUsuarioView(
                                  paciente: usuario,
                                  dropOpcoes: dropOpcoes,
                                  ubs: ubs)));
                    },
                    const Color.fromRGBO(138, 162, 212, 1),
                  )),
                  const SizedBox(height: 15),
                  Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ComponentsUtils.TextValueIcon(
                          context,
                          const Icon(Icons.call_to_action),
                          usuario.cns,
                          'Cartão do SUS'),
                      const Divider(
                          height: 30,
                          endIndent: 20,
                          indent: 20,
                          thickness: 0.5,
                          color: Color.fromRGBO(138, 162, 212, 1)),
                      ComponentsUtils.TextValueIcon(
                          context,
                          const Icon(Icons.phone),
                          usuario.telefone,
                          'Telefone'),
                      const Divider(
                          height: 30,
                          endIndent: 20,
                          indent: 20,
                          thickness: 0.5,
                          color: Color.fromRGBO(138, 162, 212, 1)),
                      ComponentsUtils.TextValueIcon(context,
                          const Icon(Icons.home), usuario.endereco, 'Endereço'),
                      const Divider(
                          height: 30,
                          endIndent: 20,
                          indent: 20,
                          thickness: 0.5,
                          color: Color.fromRGBO(138, 162, 212, 1)),
                      ComponentsUtils.TextValueIcon(
                          context,
                          const Icon(Icons.calendar_today),
                          usuario.dataNascimento,
                          'Nascimento'),
                      const Divider(
                          height: 30,
                          endIndent: 20,
                          indent: 20,
                          thickness: 0.5,
                          color: Color.fromRGBO(138, 162, 212, 1)),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(width: 15),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 8,
                              child: const Icon(Icons.local_hospital)),
                          const SizedBox(width: 15),
                          const Text(
                            'UBS',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 40, right: 40),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: const StadiumBorder(),
                                      onPrimary: Colors.white,
                                      primary: const Color.fromARGB(
                                          255, 117, 136, 179),
                                      textStyle: const TextStyle(
                                          fontFamily: 'Merriweather',
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold)),
                                  child: const Text('Acessar UBS'),
                                  onPressed: () async {
                                    try {
                                      var responseUbs = await http.get(Uri.parse(
                                          'http://localhost:3000/ubs/${AppController.instance.paciente.idUbs}'));

                                      if (responseUbs.statusCode == 200) {
                                        ubs = UBS.fromJson(responseUbs.body);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    UbsView(ubs: ubs)));
                                      }
                                    } catch (e) {
                                      print(e.toString());
                                      print('ERRO PERFIL -> UBS');
                                    }
                                  },
                                )),
                          ),
                          const SizedBox(width: 15),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  )),
                ],
              ))),
    ));
  }
}
