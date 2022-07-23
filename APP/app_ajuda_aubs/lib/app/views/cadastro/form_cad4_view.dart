import 'package:ajuda_ubs/app/views/cadastro/form_cad5_view.dart';
import 'package:flutter/material.dart';
import 'package:ajuda_ubs/app/utils/user_preferences.dart';

class FormCad4View extends StatefulWidget {
  const FormCad4View({Key? key}) : super(key: key);

  @override
  State<FormCad4View> createState() => _FormCad4ViewState();
}

class _FormCad4ViewState extends State<FormCad4View> {
  var user = UserPreferences.myUser;

  var dropOpcoes = ['UBS 1', 'UBS 2', 'UBS 3', 'UBS 4'];
  final dropValue = ValueNotifier('');

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
                valueListenable: dropValue,
                builder: (BuildContext context, String value, _) {
                  return Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: DropdownButtonFormField<String>(
                          isExpanded: true,
                          icon: const Icon(Icons.local_hospital),
                          hint: const Text('UBS São Quirino'),
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
                          items: dropOpcoes
                              .map((op) => DropdownMenuItem(
                                    value: op,
                                    child: Text(op),
                                  ))
                              .toList(),
                          onChanged: (escolha) =>
                              dropValue.value = escolha.toString()));
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
                  Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        const FormCad5View()));
                },
                child: const Icon(Icons.arrow_forward)),
            const SizedBox(height: 15)
          ],
        ),
      ),
    ));
  }
}
