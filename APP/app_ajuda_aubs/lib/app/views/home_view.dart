import 'package:ajuda_ubs/app/views/cadastro/form_cad1_view.dart';
import 'package:ajuda_ubs/app/views/login_view.dart';
import 'package:ajuda_ubs/app/views/manifestacao/form_man1_view.dart';
import 'package:ajuda_ubs/app/views/perfil_view.dart';
import 'package:ajuda_ubs/app/views/procurar_remedio_view.dart';
import 'package:flutter/material.dart';
//import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int paginaAtual = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: paginaAtual);
  }

  void onTapped(int index) {
    setState(() {
      paginaAtual = index;
    });
    pageController.jumpToPage(index);
    // Navigator.of(context) .pushReplacementNamed("/desafio");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          onPageChanged: onTapped,
          controller: pageController,
          children: const [
            FormCad1View(),
            ProcurarRemedioView(),
            FormMan1View(),
            LoginView(),
            PerfilView(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 81, 179, 245),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: 'Procurar'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Denunciar'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart_rounded), label: 'Dados'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil')
          ],
          currentIndex: paginaAtual,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          onTap: onTapped,
        ));
  }
}
