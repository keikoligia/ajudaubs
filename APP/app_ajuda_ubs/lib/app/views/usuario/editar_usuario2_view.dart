// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

import '../../../navigation_view.dart';

class EditarUsuario2View extends StatefulWidget {
  EditarUsuario2View({Key? key}) : super(key: key);

  @override
  _EditarUsuario2ViewState createState() => _EditarUsuario2ViewState();
}

class _EditarUsuario2ViewState extends State<EditarUsuario2View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
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
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const NavigationView()));
            },
            child: const Text('CONCLUIR')),
      ],
    )));
  }
}
