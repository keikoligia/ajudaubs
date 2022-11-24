import 'package:flutter/material.dart';

import '../usuario/login_usuario_view.dart';

class FormCad7View extends StatefulWidget {
  const FormCad7View({Key? key}) : super(key: key);

  @override
  State<FormCad7View> createState() => _FormCad7ViewState();
}

class _FormCad7ViewState extends State<FormCad7View> {
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 70),

                const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      'Obrigado por se cadastrar no AjudaUBS ;)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 138, 161, 212),
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    )),
                SizedBox(
                    child: Image.asset(
                      'assets/imagens/fig_concluir_cad.png',
                      fit: BoxFit.cover,
                    ),
                    width: 400,
                    height: 350),
                const SizedBox(height: 10),
                const Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Text(
                      'Utilize o aplicativo para facilitar seu contato com a UBS.',
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
                              builder: (_) => const LoginUsuarioView()));
                    },
                    child: const Text('CERTO')),

                //(file == null)? Container() : Image.file(File(file!.path.toString()), width: 100, height: 100)
              ],
            )));
  }
}
