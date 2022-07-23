import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:ajuda_ubs/app/views/cadastro/form_cad6_view.dart';
import 'package:flutter/material.dart';

class FormCad5View extends StatefulWidget {
  const FormCad5View({Key? key}) : super(key: key);

  @override
  State<FormCad5View> createState() => _FormCad5ViewState();
}

class _FormCad5ViewState extends State<FormCad5View> {
  String senhaPrim = '';
  String senhaSegun = '';

  late final TextEditingController controllerSen2;
  late final TextEditingController controllerSen1;

  @override
  void initState() {
    super.initState();
    controllerSen1 = TextEditingController(text: senhaPrim);
    controllerSen2 = TextEditingController(text: senhaSegun);
  }

  @override
  void dispose() {
    controllerSen1.dispose();
    controllerSen2.dispose();
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
                    controllerSen1, (cepp) {
                  senhaPrim = cepp;
                }, true)),
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
                    controllerSen2, (cepp) {
                  senhaSegun = cepp;
                }, true)),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const FormCad6View()));
                },
                child: const Text('CADASTRAR')),
            const SizedBox(height: 15)
          ],
        ),
      ),
    ));
  }
}
