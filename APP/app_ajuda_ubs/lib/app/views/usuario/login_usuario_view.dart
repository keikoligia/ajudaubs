import 'package:ajuda_ubs/app/controllers/login_controller.dart';
import 'package:ajuda_ubs/app/models/paciente_model.dart';
import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:ajuda_ubs/app/views/cadastro/form_cadastro1_view.dart';
import 'package:flutter/material.dart';

import 'recuperar_usuario_view.dart';

class LoginUsuarioView extends StatefulWidget {
  const LoginUsuarioView({Key? key}) : super(key: key);

  @override
  _LoginUsuarioViewState createState() => _LoginUsuarioViewState();
}

class _LoginUsuarioViewState extends State<LoginUsuarioView> {
  late LoginController pacienteController;
  late Paciente paciente;
  late bool senhaVisivel;

  @override
  void initState() {
    super.initState();
    senhaVisivel = true;
    pacienteController = LoginController(
        login: TextEditingController(), senha: TextEditingController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
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
                          pacienteController.login,
                          (cepp) {},
                          true),
                      const SizedBox(height: 15),
                      TextField(
                        obscureText: senhaVisivel,
                        keyboardType: TextInputType.visiblePassword,
                        controller: pacienteController.senha,
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                              child: (senhaVisivel == true)
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                              onTap: () {
                                setState(() {
                                  senhaVisivel = !senhaVisivel;
                                });
                              }),

                          //hintText: hint,
                          label: const Text(
                            'Senha',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(138, 162, 212, 1),
                                width: 2,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(138, 162, 212, 1),
                                width: 2,
                              )),
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
                                        builder: (_) => FormCadastro1View(
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
