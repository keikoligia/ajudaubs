import 'package:ajuda_ubs/app/controllers/login_controller.dart';
import 'package:ajuda_ubs/app/models/paciente_model.dart';
import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:ajuda_ubs/app/views/cadastro/form_cad1_view.dart';
import 'package:flutter/material.dart';

import 'perca_senha_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController controllerLogin;
  late TextEditingController controllerSenha;
  late PacienteController pacienteController;
  late Paciente paciente;

  @override
  void initState() {
    super.initState();
    controllerLogin = TextEditingController();
    controllerSenha = TextEditingController();
    pacienteController =
        PacienteController(login: controllerLogin, senha: controllerSenha);
  }

  @override
  Widget build(BuildContext context) {
    bool senhaVisivel = false;

    return Scaffold(
        body: SingleChildScrollView(
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Bem-vindo de volta!',
                        style: TextStyle(
                            color: Color.fromRGBO(138, 162, 212, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      const SizedBox(height: 15),
                      ComponentsUtils.TextFieldEdit(
                          context,
                          1,
                          'Email ou  CNS',
                          TextInputType.emailAddress,
                          const Icon(Icons.login),
                          () {},
                          controllerLogin,
                          (cepp) {},
                          true),
                      const SizedBox(height: 15),
                      TextField(
                        obscureText: senhaVisivel,
                        keyboardType: TextInputType.visiblePassword,
                        controller: controllerSenha,
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                              child: (senhaVisivel == true)
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                              onTap: () {
                                setState(() {
                                  senhaVisivel = !senhaVisivel;
                                });
                              }),
                          label: const Text(
                            'Senha',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            const PerdaSenhaView()));
                              },
                              child: const Text("Esqueceu a senha?",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      color: Color.fromRGBO(138, 162, 212, 1),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      decoration: TextDecoration.underline)),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => FormCad1View(
                                            cadastroController: null,
                                            inicio: true)));
                              },
                              child: const Text("Não possui usuário?",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      color: Color.fromRGBO(138, 162, 212, 1),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      decoration: TextDecoration.underline)),
                            ),
                          ]),
                      const SizedBox(height: 15),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                onPrimary: Colors.white,
                                primary:
                                    const Color.fromARGB(255, 177, 193, 228),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 12),
                              ),
                              onPressed: () async {
                                pacienteController.verificarLogin(context);
                              },
                              child: const Text('ENTRAR'))),
                      const SizedBox(height: 15),
                    ],
                  ),
                ))));
  }
}
