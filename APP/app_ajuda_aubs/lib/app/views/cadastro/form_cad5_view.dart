import 'package:ajuda_ubs/app/controllers/cadastro_controller.dart';
import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:ajuda_ubs/app/views/cadastro/form_cad6_view.dart';
import 'package:flutter/material.dart';

class FormCad5View extends StatefulWidget {
  CadastroController cadastroController;

  FormCad5View({Key? key, required this.cadastroController}) : super(key: key);

  @override
  State<FormCad5View> createState() => _FormCad5ViewState();
}

class _FormCad5ViewState extends State<FormCad5View> {
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
                    value: 1, color: Color.fromRGBO(138, 162, 212, 1))),
            const SizedBox(height: 100),
            const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  'Sua senha, sua segurança!',
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
                    'Senha',
                    TextInputType.visiblePassword,
                    const Icon(Icons.password),
                    () {},
                    widget.cadastroController.controllerSen1,
                    (cepp) {},
                    true)),
            const SizedBox(height: 15),
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ComponentsUtils.TextFieldEdit(
                    context,
                    1,
                    'Digite a senha novamente',
                    TextInputType.visiblePassword,
                    const Icon(Icons.password),
                    () {},
                    widget.cadastroController.controllerSen2,
                    (cepp) {},
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
                  widget.cadastroController.verificarCad5(context);
                },
                child: const Text('CADASTRAR')),
            const SizedBox(height: 15)
          ],
        ),
      ),
    ));
  }
}
