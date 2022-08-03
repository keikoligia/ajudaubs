
import 'package:ajuda_ubs/app/views/screens/navigation_view.dart';
import 'package:ajuda_ubs/app/views/screens/splash_view.dart';
import 'package:ajuda_ubs/app/views/screens/welcome_view.dart';
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
                      : Brightness.light),
              routes: {
                "/": (context) => const SplashView(),
                "/welcome": ((context) => const WelcomeView()),
                "/home": ((context) => const NavigationView()),
                "/perfil": (context) => AppController.instance.isLogado
                    ? const SplashView()
                    : const WelcomeView(),
              });
        });
  }
}
