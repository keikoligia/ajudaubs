import 'package:ajuda_ubs/app/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:ajuda_ubs/app/utils/user.dart';
import 'package:ajuda_ubs/app/utils/user_preferences.dart';

// ignore: must_be_immutable
class FormMan5View extends StatefulWidget {
  String protocolo;

  FormMan5View({Key? key, required this.protocolo}) : super(key: key);

  @override
  _FormMan5ViewState createState() => _FormMan5ViewState();
}

class _FormMan5ViewState extends State<FormMan5View> {
  User user = UserPreferences.myUser;

/*
  void makeCall() async {
    String phone = "tel:19994974618";

    if (await canLaunch(phone)) {
      launch(phone);
    } else {
      throw 'ERRO AO LIGAR';
    }
  }

  void sendMessage() async {
    String message = "sms:19994974618?body=ola";

    if (await canLaunch(message)) {
      launch(message);
    } else {
      throw 'ERRO NO SMS';
    }
  }

  void sendEmail() async {
    String email =
        "mailto:cc20130@g.unicamp.br??subject=qualquer assunto&body=ola mundo";

    if (await canLaunch(email)) {
      launch(email);
    } else {
      throw 'ERRO NO EMAIL';
    }
  }

  void acessUrl() async {
    String url = "https://ajudaubsapi.herokuapp.com/";

    if (await canLaunch(url)) {
      launch(url);
    } else {
      throw 'ERRO NO EMAIL';
    }
  }
*/
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
                  'Obrigado por utilizar os serviços da Ouvidoria Municipal ;) ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 138, 161, 212),
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                SizedBox(
                    child: Image.asset(
                      'assets/imagens/fig_concluir_man.png',
                      fit: BoxFit.cover,
                    ),
                    width: 400,
                    height: 350)
                ,
                SelectableText(
                  'Protocolo: ${widget.protocolo}',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 97, 132, 206),
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'OBS: Utilize o protocolo de atendimento para acompanhar o andamento de sua manifestação',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 138, 161, 212),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const HomeView()));
                    },
                    child: const Text('CONCLUIR')),
              ],
            ))));
  }

  Future<void> showMyDialog(String titulo, String texto) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.error_outline),
                const SizedBox(width: 10),
                Text(titulo,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24))
              ]),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(texto),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Certo'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
