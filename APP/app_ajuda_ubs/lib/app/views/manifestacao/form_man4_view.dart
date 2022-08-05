import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:ajuda_ubs/app/views/manifestacao/form_man5_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ajuda_ubs/app/utils/user.dart';
import 'package:ajuda_ubs/app/utils/user_preferences.dart';
import 'dart:convert';
import 'dart:math';

// ignore: must_be_immutable
class FormMan4View extends StatefulWidget {
  const FormMan4View({Key? key}) : super(key: key);

  @override
  _FormMan4ViewState createState() => _FormMan4ViewState();
}

class _FormMan4ViewState extends State<FormMan4View> {
  User user = UserPreferences.myUser;
  var dropOpcoes = ['UBS 1', 'UBS 2', 'UBS 3', 'UBS 4'];
  FilePickerResult? result;
  PlatformFile? file;
  late int qtdImagns = 0;

  late bool temImagens = false;
  static final Random _random = Random.secure();

  String nome = '';
  String funcao = '';

  late final TextEditingController controllerNome;
  late final TextEditingController controllerFuncao;

  @override
  void initState() {
    super.initState();
    controllerNome = TextEditingController(text: nome);
    controllerFuncao = TextEditingController(text: funcao);
  }

  @override
  void dispose() {
    controllerNome.dispose();
    controllerFuncao.dispose();
    super.dispose();
  }

  static String gerarProtocolo([int length = 32]) {
    var values = List<int>.generate(length, (i) => _random.nextInt(256));
    return base64Url.encode(values);
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
                  const SizedBox(
                    height: 70,
                  ),
                  const Text(
                    'Quais são os envolvidos no fato?',
                    style: TextStyle(
                        color: Color.fromARGB(255, 138, 161, 212),
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: ComponentsUtils.TextFieldEdit(
                          context,
                          1,
                          'Nome do Envolvido',
                          TextInputType.text,
                          const Icon(Icons.person),
                          () {},
                          controllerFuncao, (function) {
                        funcao = function;
                      }, true)),
                  const SizedBox(height: 10),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: ComponentsUtils.TextFieldEdit(
                          context,
                          1,
                          'Função do Envolvido',
                          TextInputType.text,
                          const Icon(Icons.person_pin_sharp),
                          () {},
                          controllerFuncao, (function) {
                        funcao = function;
                      }, true)),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            onPrimary: Colors.white,
                            primary: const Color.fromARGB(255, 177, 193, 228),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 12),
                          ),
                          onPressed: () async {
                            //pickFiless();
                          },
                          child: const Icon(Icons.add)),
                      const SizedBox(height: 20),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            onPrimary: Colors.white,
                            primary: const Color.fromARGB(255, 98, 127, 189),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 12),
                          ),
                          onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => FormMan5View(
                                        protocolo: gerarProtocolo(6))));
                          },
                          child: const Icon(Icons.arrow_forward)),

                      //(file == null)? Container() : Image.file(File(file!.path.toString()), width: 100, height: 100)
                    ],
                  ),
                ]))));
  }
}
