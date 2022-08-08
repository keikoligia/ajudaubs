import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:flutter/material.dart';

class ProcurarRemedioView extends StatefulWidget {
  const ProcurarRemedioView({Key? key}) : super(key: key);

  @override
  State<ProcurarRemedioView> createState() => _ProcurarRemedioViewState();
}

class _ProcurarRemedioViewState extends State<ProcurarRemedioView> {
  String email = '';

  late TextEditingController controllerEmail;

  @override
  void initState() {
    super.initState();
    controllerEmail = TextEditingController(text: email);
  }

  @override
  void dispose() {
    controllerEmail.dispose();
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
                    'Procurar Remédios',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 138, 161, 212),
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: ComponentsUtils.TextFieldEdit(
                          context,
                          1,
                          'Nome do Remédio',
                          TextInputType.text,
                          const Icon(Icons.search),
                          () {
                            setState(() {
                              
                            });
                          },
                          controllerEmail, (function) {
                        email = function;
                      }, true)),
                  SizedBox(
                      child: Image.asset(
                        'assets/imagens/fig_procurar_remedio.png',
                        fit: BoxFit.cover,
                      ),
                      width: 400,
                      height: 350),
                  const Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Text(
                        '1 - Digite o medicamento desejado na caixa de busca acima.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(255, 138, 161, 212),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      )),
                  const Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Text(
                        '2 - O sistema mostrará os Centros de Saúde próximos do seu endereço e a disponibilidade do medicamento.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(255, 138, 161, 212),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      )),
                ]))));
  }
}
