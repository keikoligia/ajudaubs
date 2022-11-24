import 'package:ajuda_ubs/app/utils/app_controller.dart';
import 'package:ajuda_ubs/app/views/manifestacao/consultar_manifestacao_view.dart';
import 'package:flutter/material.dart';
import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:ajuda_ubs/navigation_view.dart';
import 'package:ajuda_ubs/app/views/screens/splash_view.dart';
import 'package:ajuda_ubs/app/views/screens/welcome_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: AppController.instance,
        builder: (context, child) {
          return MaterialApp(
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: const [Locale('pt', 'BR')],
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primarySwatch: ComponentsUtils.colorBaseApp(
                      const Color.fromRGBO(138, 162, 212, 1)),
                  brightness: AppController.instance.isDartTheme
                      ? Brightness.dark
                      : Brightness.light),
              routes: {
                "/": (context) => const SplashView(),
                "/welcome": ((context) => const WelcomeView()),
                "/home": ((context) => const ConsultarManifestacaoView())
              });
        });
  }
}
