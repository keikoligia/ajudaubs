import 'package:ajuda_ubs/app/controllers/cadastro_controller.dart';
import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:flutter/material.dart';

class FormCad2View extends StatefulWidget {
  CadastroController cadastroController;
  FormCad2View({
    Key? key,
    required this.cadastroController,
  }) : super(key: key);

  @override
  State<FormCad2View> createState() => _FormCad2ViewState();
}

class _FormCad2ViewState extends State<FormCad2View> {
  

  late DateTime dateTime = DateTime.now();

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
            const SizedBox(height: 30),
            const Text(
              'CADASTRO',
              style: TextStyle(
                  color: Color.fromARGB(255, 138, 161, 212),
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            const SizedBox(height: 5),
            const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: LinearProgressIndicator(
                    value: 0.4, color: Color.fromRGBO(138, 162, 212, 1))),
            const SizedBox(height: 100),
            const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  'Como podemos entrar em contato?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(138, 162, 212, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                )),
            const SizedBox(height: 15),
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ComponentsUtils.TextFieldEdit(
                    context,
                    1,
                    'Telefone',
                    TextInputType.phone,
                    const Icon(Icons.phone),
                    () {},
                    widget.cadastroController.controllerTelefone,
                    (tele) {},
                    true)),
            const SizedBox(height: 15),
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ComponentsUtils.TextFieldEdit(
                    context,
                    1,
                    'Email',
                    TextInputType.emailAddress,
                    const Icon(Icons.email),
                    () {},
                    widget.cadastroController.controllerEmail,
                    (ctt) {},
                    true)),
            const SizedBox(height: 15),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  onPrimary: Colors.white,
                  primary: const Color.fromARGB(255, 125, 149, 202),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                onPressed: () {
                  widget.cadastroController.verificarCad2(context);
                },
                child: const Icon(Icons.arrow_forward)),
            const SizedBox(height: 15)
          ],
        ),
      ),
    ));
  }
}
