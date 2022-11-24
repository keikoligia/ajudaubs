// ignore_for_file: must_be_immutable, unnecessary_const, unused_import

import 'package:ajuda_ubs/app/utils/app_controller.dart';
import 'package:ajuda_ubs/app/views/agendamento/form_agendamento1_view.dart';
import 'package:ajuda_ubs/app/views/cadastro/form_cadastro7_view.dart';
import 'package:ajuda_ubs/app/views/graficos/graficos_view.dart';
import 'package:ajuda_ubs/app/views/manifestacao/consultar_manifestacao_view.dart';
import 'package:ajuda_ubs/app/views/manifestacao/form_manifestacao1_view.dart';
import 'package:ajuda_ubs/app/views/manifestacao/form_manifestacao5_view.dart';
import 'package:ajuda_ubs/app/views/manifestacao/historico_manifestacao_view.dart';
import 'package:ajuda_ubs/app/views/screens/home_view.dart';
import 'package:ajuda_ubs/app/views/screens/splash_view.dart';
import 'package:ajuda_ubs/app/views/usuario/perfil_usuario_view.dart';
import 'package:flutter/material.dart';
import 'app/views/screens/procurar_remedio_view.dart';
import 'app/views/screens/welcome_view.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              paginaAtual = index;
            });
            pageController.jumpToPage(index);
          },
          controller: pageController,
          children: [
            const ConsultarManifestacaoView(),
            const ProcurarRemedioView(),
            (AppController.instance.isLogado)
                ? const FormAgendamento1View()
                : const FormManifestacao1View(),
            const GraficosView(),
            (AppController.instance.isLogado)
                ? const PerfilUsuarioView()
                : const HistoricoManifestacaoView(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 81, 179, 245),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: 'Procurar'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Manifestar'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart_rounded), label: 'Dados'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil')
          ],
          currentIndex: paginaAtual,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              paginaAtual = index;
            });
            pageController.jumpToPage(index);
          },
        ));
  }
}
