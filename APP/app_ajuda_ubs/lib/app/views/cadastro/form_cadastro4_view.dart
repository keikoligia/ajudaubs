import 'package:flutter/material.dart';

import 'package:ajuda_ubs/app/controllers/cadastro_controller.dart';

// ignore: must_be_immutable
class FormCadastro4View extends StatefulWidget {
  CadastroController cadastroController;

  FormCadastro4View({
    Key? key,
    required this.cadastroController,
  }) : super(key: key);

  @override
  State<FormCadastro4View> createState() => _FormCadastro4ViewState();
}

class _FormCadastro4ViewState extends State<FormCadastro4View> {
  @override
  void initState() {
    super.initState();
  }

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
                    child:  Column(
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
                    value: 0.8, color: Color.fromRGBO(138, 162, 212, 1))),
            const SizedBox(height: 100),
            const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  'Qual UBS você freguenta?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(138, 162, 212, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                )),
            const SizedBox(height: 30),
            ValueListenableBuilder(
                valueListenable: widget.cadastroController.dropValue,
                builder: (BuildContext context, String value, _) {
                  return Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: DropdownButtonFormField<String>(
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
                              .dropValue.value = escolha.toString()));
                }),
            const SizedBox(height: 15),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 3,
                        color: const Color.fromRGBO(138, 162, 212, 1)),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                onPressed: () {
                  widget.cadastroController.verificarCad4(context);
                },
                child: const Icon(Icons.arrow_forward)),
            const SizedBox(height: 15)
          ],
        ),
      ),
    );
  }
}
