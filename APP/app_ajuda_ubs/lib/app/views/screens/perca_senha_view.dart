import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:flutter/material.dart';
import 'package:ajuda_ubs/app/utils/user.dart';
import 'package:ajuda_ubs/app/utils/user_preferences.dart';

import 'navigation_view.dart';

// ignore: must_be_immutable
class PerdaSenhaView extends StatefulWidget {
  const PerdaSenhaView({Key? key}) : super(key: key);

  @override
  _PerdaSenhaViewState createState() => _PerdaSenhaViewState();
}

class _PerdaSenhaViewState extends State<PerdaSenhaView> {
  User user = UserPreferences.myUser;

  String email = '';

  late TextEditingController controllerEmail =
      TextEditingController(text: email);

  @override
  void initState() {
    super.initState();
    controllerEmail = TextEditingController(text: email);
  }

  @override
  void dispose() {
    controllerEmail.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Text(
                  'Recuperar minha senha',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 138, 161, 212),
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                const SizedBox(height: 15),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Esqueceu sua senha? Não se preocupe. É só nos dizer seu e-mail que enviaremos um link e um código de acesso para você cadastrar uma nova senha no AjudaUBS.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Color.fromARGB(255, 138, 161, 212),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child:
                        Image.asset('assets/imagens/fig_recuperar_senha.png')),
                Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: ComponentsUtils.TextFieldEdit(
                        context,
                        1,
                        'Email',
                        TextInputType.text,
                        const Icon(Icons.email_rounded),
                        () {},
                        controllerEmail, (function) {
                      email = function;
                    }, true)),
                const SizedBox(height: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      onPrimary: Colors.white,
                      primary: const Color.fromARGB(255, 98, 127, 189),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 12),
                    ),
                    onPressed: () async {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const NavigationView()));
                    },
                    child: const Text(
                      'Recuperar acesso',
                      style: TextStyle(fontSize: 18),
                    )),
                const SizedBox(height: 40),
              ],
            ))));
  }
}
