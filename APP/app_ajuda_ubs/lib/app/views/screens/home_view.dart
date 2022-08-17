import 'dart:async';

import 'package:ajuda_ubs/app/utils/user_preferences.dart';
import 'package:flutter/material.dart';
//import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var user = UserPreferences.myUser;

  int paginaAtual = 0;
  late Timer timer;

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: paginaAtual);

    timer = Timer.periodic(const Duration(milliseconds: 3000), (Timer timer) {
      if (paginaAtual < 5) {
        paginaAtual++;
      } else {
        paginaAtual = 0;
      }
      pageController.jumpToPage(paginaAtual);
    });
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
        body: SingleChildScrollView(
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /*
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.settings)),*/
                            SizedBox(
                                width: 60,
                                height: 60,
                                child: Image.asset('assets/imagens/logo.png')),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Fabricio Onofre',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  ),
                                  Text(
                                    'Bem-vindo de volta!',
                                    style: TextStyle(
                                        color: Color.fromRGBO(138, 162, 212, 1),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  )
                                ]),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: ClipOval(
                                child: Material(
                                  color: Colors.transparent,
                                  child: Ink.image(
                                    image: NetworkImage(user.imagePath),
                                    fit: BoxFit.cover,
                                    width: 50,
                                    height: 50,
                                    child: InkWell(onTap: () {}),
                                  ),
                                ),
                              ),
                            ),
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
                      /*
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          child:
                              Image.asset('assets/imagens/fig_acompanhar.png')),
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage('assets/imagens/fig_acompanhar.png'),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        width: 300,
                        height: 200,
                      ),*/
                    ],
                  ),
                ))));
  }
}
