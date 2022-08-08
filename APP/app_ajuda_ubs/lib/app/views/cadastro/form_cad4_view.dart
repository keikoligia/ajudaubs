import 'package:ajuda_ubs/app/controllers/cadastro_controller.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormCad4View extends StatefulWidget {
  CadastroController cadastroController;

  FormCad4View({Key? key, required this.cadastroController}) : super(key: key);

  @override
  State<FormCad4View> createState() => _FormCad4ViewState();
}

class _FormCad4ViewState extends State<FormCad4View> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: const Text(
                      'CADASTRO',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 138, 161, 212),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )),
                const SizedBox(height: 5),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: const LinearProgressIndicator(
                        value: 0.64, color: Color.fromRGBO(138, 162, 212, 1))),
                const SizedBox(height: 100),
                const Text(
                  'Qual UBS você freguenta?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(138, 162, 212, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                const SizedBox(height: 30),
                ValueListenableBuilder(
                    valueListenable: widget.cadastroController.dropValue,
                    builder: (BuildContext context, String value, _) {
                      return DropdownButtonFormField<String>(
                          isExpanded: true,
                          icon: const Icon(Icons.local_hospital),
                          hint: const Text(
                              'Escolha a UBS que está vinculado atualmente'),
                          decoration: InputDecoration(
                              label: const Text(
                                'UBS - Unidade Básica de Saúde',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              )),
                          value: (value.isEmpty) ? null : value,
                          items: widget.cadastroController.dropOpcoes
                              .map((op) => DropdownMenuItem(
                                    value: op,
                                    child: Text(op),
                                  ))
                              .toList(),
                          onChanged: (escolha) => widget.cadastroController
                              .dropValue.value = escolha.toString());
                    }),
                const SizedBox(height: 15),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 3,
                            color: const Color.fromRGBO(138, 162, 212, 1)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Image.asset(
                      'assets/imagens/ubs.png',
                      fit: BoxFit.cover,
                    ),
                    width: 200,
                    height: 200),
                const SizedBox(height: 15),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      onPrimary: Colors.white,
                      primary: const Color.fromARGB(255, 125, 149, 202),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 12),
                    ),
                    onPressed: () {
                      widget.cadastroController.verificarCad4(context);
                    },
                    child: const Icon(Icons.arrow_forward)),
                const SizedBox(height: 15)
              ],
            )),
      ),
    ));
  }
}
