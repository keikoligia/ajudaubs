import 'package:ajuda_ubs/app/views/manifestacao/form_man3_view.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:ajuda_ubs/app/utils/user.dart';
import 'package:ajuda_ubs/app/utils/user_preferences.dart';

// ignore: must_be_immutable
class FormMan2View extends StatefulWidget {
  String option;

  FormMan2View({Key? key, required this.option}) : super(key: key);

  @override
  _FormMan2ViewState createState() => _FormMan2ViewState();
}

class _FormMan2ViewState extends State<FormMan2View> {
  User user = UserPreferences.myUser;
  var dropOpcoes = ['UBS 1', 'UBS 2', 'UBS 3', 'UBS 4'];

  late final TextEditingController controllerNome;
  late final TextEditingController controllerFuncao;

  @override
  void initState() {
    super.initState();
    controllerNome = TextEditingController();
    controllerFuncao = TextEditingController();
  }

  @override
  void dispose() {
    controllerNome.dispose();
    controllerFuncao.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dropValue = ValueNotifier('');
    return Scaffold(
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    widget.option,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 138, 161, 212),
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  const SizedBox(height: 30),
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Anonimato',
                          style: TextStyle(
                              color: Color.fromARGB(255, 118, 121, 129),
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        ToggleSwitch(
                          minHeight: 30,
                          cornerRadius: 20.0,
                          activeBgColors: const [
                            [Color.fromARGB(255, 138, 161, 212)],
                            [Color.fromARGB(255, 138, 161, 212)]
                          ],
                          inactiveBgColor:
                              const Color.fromARGB(255, 227, 227, 227),
                          initialLabelIndex: 0,
                          totalSwitches: 2,
                          labels: const ['SIM', 'NÃO'],
                          radiusStyle: true,
                          onToggle: (index) {
                            //print('switched to: $index');
                          },
                        )
                      ]),
                  const SizedBox(height: 20),
                  (widget.option != "SUGERIR")
                      ? ValueListenableBuilder(
                          valueListenable: dropValue,
                          builder: (BuildContext context, String value, _) {
                            return Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: DropdownButtonFormField<String>(
                                    onTap: () {
                                      //  _showMyDialog('Destinatário',
                                      //      'Órgão para o qual você quer enviar sua manifestação');
                                    },
                                    isExpanded: true,
                                    icon: const Icon(Icons.local_hospital),
                                    hint: const Text('UBS São Quirino'),
                                    decoration: InputDecoration(
                                        label: const Text(
                                            'Local do fato - Orgão refente a sua manifestação',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12))),
                                    value: (value.isEmpty) ? null : value,
                                    items: dropOpcoes
                                        .map((op) => DropdownMenuItem(
                                              value: op,
                                              child: Text(op),
                                            ))
                                        .toList(),
                                    onChanged: (escolha) =>
                                        dropValue.value = escolha.toString()));
                          })
                      : Container(),
                  const SizedBox(height: 30),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Center(
                          child: TextField(
                        keyboardType: TextInputType.text,
                        onChanged: (cepp) {},
                        onTap: () {
                          // _showMyDialog('Descrição',
                          //     'Descreva o conteúdo de sua manifestação. Seja claro e objetivo. Informações pessoais, inclusive identificação, não devem ser inseridas a não ser que sejam essenciais para a caracterização da manifestação.');
                        }, //set it true, so that user will not able to edit text
                        controller: controllerNome,
                        decoration: InputDecoration(
                          label: const Text(
                            'Descrição - Descreva o conteúdo da manifestação',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        maxLines: 15,
                      ))),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text('0/500', textAlign: TextAlign.left))),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        onPrimary: Colors.white,
                        primary: const Color.fromARGB(255, 177, 193, 228),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 12),
                      ),
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const FormMan3View()));
                      },
                      child: const Icon(Icons.arrow_forward)),
                  const SizedBox(height: 40),
                ],
              ),
            )));
  }

  Future<void> showMyDialog(String titulo, String texto) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.error_outline),
                const SizedBox(width: 10),
                Text(titulo,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24))
              ]),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(texto),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Certo'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

/*
  print('Name: ${file.name}');
  print('Bytes: ${file.bytes}');
  print('Name: ${file.size}');
  print('Name: ${file.extension}');
  print('Name: ${file.path}');                        
*/