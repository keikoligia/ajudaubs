import 'package:ajuda_ubs/app/views/manifestacao/form_man1_view.dart';
import 'package:ajuda_ubs/app/views/screens/map_view.dart';
import 'package:ajuda_ubs/app/views/screens/maps_viw.dart';
import 'package:ajuda_ubs/app/views/screens/perfil_view.dart';
import 'package:ajuda_ubs/app/views/screens/remedio_maps_view.dart';
import 'package:flutter/material.dart';
import 'home_view.dart';
import 'procurar_remedio_view.dart';
//import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({Key? key}) : super(key: key);

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
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
            HomeView(),
            ProcurarRemedioView(),
            FormMan1View(),
            RemedioMapsView(),
            MapsView(),
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
