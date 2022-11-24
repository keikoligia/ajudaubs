import 'package:ajuda_ubs/app/controllers/cadastro_controller.dart';
import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:ajuda_ubs/app/views/cadastro/form_cadastro1_view.dart';
import 'package:ajuda_ubs/app/views/usuario/login_usuario_view.dart';
import 'package:ajuda_ubs/navigation_view.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 254, 254, 254),
                  Color.fromARGB(255, 254, 254, 254),
                  Color.fromARGB(255, 254, 254, 254),
                  Color.fromARGB(255, 254, 254, 254),
                  Color.fromRGBO(138, 162, 212, 1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        child: Image.asset('assets/imagens/logo_nome.png')),
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
                                  builder: (_) => FormCadastro1View(
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const LoginUsuarioView()));
                        }, const Color.fromARGB(255, 177, 193, 228))),
                    const SizedBox(height: 15),
                    SizedBox(
                        height: 40,
                        width: MediaQuery.of(context).size.width - 50,
                        child: ComponentsUtils.ButtonTextColor(
                            context, 'Anônimo', () {
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
                )));
  }
}
