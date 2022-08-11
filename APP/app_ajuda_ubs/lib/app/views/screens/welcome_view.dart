import 'dart:async';
import 'package:ajuda_ubs/app/controllers/cadastro_controller.dart';
import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:ajuda_ubs/app/views/cadastro/form_cad1_view.dart';
import 'package:ajuda_ubs/app/views/screens/navigation_view.dart';
import 'package:flutter/material.dart';

import 'login_view.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
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
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: /*Stack(
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/imagens/background_image.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(color: const Color.fromRGBO(138, 162, 212, 1).withOpacity(0.5)),*/
                Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                            child:
                                Image.asset('assets/imagens/fig_remedios.png')),
                        SizedBox(
                            child: Image.asset('assets/imagens/fig_ubs.png')),
                        SizedBox(
                            child: Image.asset(
                                'assets/imagens/fig_consultas.png')),
                        SizedBox(
                            child: Image.asset('assets/imagens/fig_dados.png')),
                        SizedBox(
                            child:
                                Image.asset('assets/imagens/fig_exames.png')),
                      ],
                    )),
                const SizedBox(height: 15),
                SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width - 50,
                    child: ComponentsUtils.ButtonTextColor(
                        context, 'Cadastre-se', () {
                      CadastroController cadastroController =
                          CadastroController.constructor1();

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => FormCad1View(
                                  cadastroController: cadastroController,
                                  inicio: true)));
                    }, const Color.fromRGBO(138, 162, 212, 1))),
                const SizedBox(height: 15),
                SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width - 50,
                    child: ComponentsUtils.ButtonTextColor(
                        context, 'Já tenho conta', () {
                      /*   Navigator.of(context).pushReplacementNamed('/login');*/
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const LoginView()));
                    }, const Color.fromARGB(255, 177, 193, 228))),
                const SizedBox(height: 15),
                SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width - 50,
                    child:
                        ComponentsUtils.ButtonTextColor(context, 'Anônimo', () {
                      /*Navigator.of(context).pushReplacementNamed('/home');*/

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const NavigationView()));
                    }, const Color.fromRGBO(138, 162, 212, 1)))
              ],
            ) /*,
              ],
            )*/
            ));
  }
}
