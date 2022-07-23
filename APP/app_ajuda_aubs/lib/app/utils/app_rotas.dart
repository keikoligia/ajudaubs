import 'package:ajuda_ubs/app/views/cadastro/form_cad1_view.dart';
import 'package:ajuda_ubs/app/views/cadastro/form_cad2_view.dart';
import 'package:ajuda_ubs/app/views/cadastro/form_cad3_view.dart';
import 'package:ajuda_ubs/app/views/cadastro/form_cad4_view.dart';
import 'package:ajuda_ubs/app/views/cadastro/form_cad5_view.dart';
import 'package:ajuda_ubs/app/views/edit_perfil_view.dart';

import 'package:ajuda_ubs/app/views/home_view.dart';
import 'package:ajuda_ubs/app/views/login_view.dart';
import 'package:ajuda_ubs/app/views/splash_view.dart';
import 'package:ajuda_ubs/app/views/ubs_view.dart';
import 'package:ajuda_ubs/app/views/welcome_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'app_controller.dart';

class AppRotas extends StatelessWidget {
  const AppRotas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: AppController.instance,
        builder: (context, child) {
          return MaterialApp(
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate
              ],
              supportedLocales: const [Locale('pt', 'BR')],
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primarySwatch: Colors.lightBlue,
                  brightness: AppController.instance.isDartTheme
                      ? Brightness.dark
                      : Brightness.light) ,
             routes: {
                "/": (context) => const SplashView(),
                "/welcome": ((context) => const WelcomeView()),
                "/home": ((context) => const HomeView()),
                "/login": ((context) => const LoginView()),
                "/ubs": ((context) => const UbsView()),
                "/editPerfil": ((context) => const EditPerfilView()),
                "/formCad1": ((context) => const FormCad1View()),
                "/formCad4": ((context) => const FormCad4View()),
                "/formCad5": ((context) => const FormCad5View()),
                "/perfil": (context) => AppController.instance.isLogado
                    ? const SplashView()
                    : const WelcomeView(),
              }
              );
        });
  }
}
