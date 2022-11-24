// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:async';

import 'package:ajuda_ubs/app/utils/app_controller.dart';
import 'package:flutter/material.dart';

import 'package:ajuda_ubs/app/models/paciente_model.dart';
import 'package:ajuda_ubs/app/utils/user_preferences.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late User usuario;

  late int paginaAtual;
  late Timer timer;
  late Paciente paciente;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    paginaAtual = 0;

    pageController = PageController(initialPage: paginaAtual);
    usuario = User.myUser;
    timer = Timer.periodic(const Duration(milliseconds: 3000), (Timer timer) {
      if (paginaAtual < 5) {
        paginaAtual++;
      } else {
        paginaAtual = 0;
      }
      pageController.jumpToPage(paginaAtual);
    });

    if (AppController.instance.isLogado) {
      paciente = AppController.instance.paciente;
    }
  }

  void onTapped(int index) {
    setState(() {
      paginaAtual = index;
    });
    pageController.jumpToPage(index);
    // Navigator.of(context) .pushReplacementNamed("/desafio");
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),*/
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 254, 254, 254),
                  Color.fromARGB(255, 254, 254, 254),
                  Color.fromARGB(255, 254, 254, 254),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: 60,
                                height: 60,
                                child: Image.asset('assets/imagens/logo.png')),
                            Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                  (!AppController.instance.isLogado)
                                      ? const Text(
                                          'Bem-vindo ao AjudaUBS',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22),
                                        )
                                      : Text(
                                          paciente.nome,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                  (AppController.instance.isLogado)
                                      ? const Text(
                                          'Bem-vindo de volta!',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  138, 162, 212, 1),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        )
                                      : const Text(
                                          'Conheça seu Posto de Saúde',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  138, 162, 212, 1),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        )
                                ])),
                            (AppController.instance.isLogado)
                                ? Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: ClipOval(
                                      child: Material(
                                        color: Colors.transparent,
                                        child: Ink.image(
                                          image:
                                              NetworkImage(usuario.imagePath),
                                          fit: BoxFit.cover,
                                          width: 50,
                                          height: 50,
                                          child: InkWell(onTap: () {}),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                          ]),
                      SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          child: PageView(
                            onPageChanged: onTapped,
                            controller: pageController,
                            children: [
                              SizedBox(
                                  child: Image.asset(
                                      'assets/imagens/fig_denuncias.png')),
                              SizedBox(
                                  child: Image.asset(
                                      'assets/imagens/fig_remedios.png')),
                              SizedBox(
                                  child: Image.asset(
                                      'assets/imagens/fig_ubs.png')),
                              SizedBox(
                                  child: Image.asset(
                                      'assets/imagens/fig_consultas.png')),
                              SizedBox(
                                  child: Image.asset(
                                      'assets/imagens/fig_dados.png')),
                              SizedBox(
                                  child: Image.asset(
                                      'assets/imagens/fig_exames.png')),
                            ],
                          )),
                      const SizedBox(height: 15),
                      Card(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(20.0), //<-- SEE HERE
                          ),
                          color: const Color.fromARGB(255, 138, 161, 212),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 40,
                            height: MediaQuery.of(context).size.height / 10,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(width: 15),
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 5,
                                    child: const Icon(
                                      Icons.local_hospital,
                                      color: Colors.black,
                                      size: 40,
                                    )),
                                const SizedBox(width: 15),
                                const Expanded(
                                    child: Center(
                                  child: Text("Unidades Básicas de Saúde",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                )),
                                const SizedBox(width: 15),
                              ],
                            ),
                          )),
                      Card(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(20.0), //<-- SEE HERE
                          ),
                          color: const Color.fromARGB(255, 138, 161, 212),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 40,
                            height: MediaQuery.of(context).size.height / 10,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(width: 15),
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 5,
                                    child: const Icon(
                                      Icons.add_alert,
                                      color: Colors.black,
                                      size: 40,
                                    )),
                                const SizedBox(width: 15),
                                const Expanded(
                                    child: Center(
                                  child: Text("Ouvidoria Municipal",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                )),
                                const SizedBox(width: 15),
                              ],
                            ),
                          )),
                    ],
                  ),
                ))));
  }
}
