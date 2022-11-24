import 'package:ajuda_ubs/navigation_view.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormAgendamento5View extends StatefulWidget {
  const FormAgendamento5View({Key? key}) : super(key: key);

  @override
  _FormAgendamento5ViewState createState() => _FormAgendamento5ViewState();
}

class _FormAgendamento5ViewState extends State<FormAgendamento5View> {
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
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                const Text(
                  'Obrigado por utilizar os serviços do AjudaUBS ;) ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 138, 161, 212),
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                SizedBox(
                    child: Image.asset(
                      'assets/imagens/fig_Agendamento.png',
                      fit: BoxFit.cover,
                    ),
                    width: 400,
                    height: 350),
                const Text(
                  'Agendamentos',
                  style: TextStyle(
                      color: Color.fromARGB(255, 97, 132, 206),
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'OBS: Caso queira verificar suas consultas ou exames, vá para a Meus Agendamentos na Página Inicial do aplicativo.',
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const NavigationView()));
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
