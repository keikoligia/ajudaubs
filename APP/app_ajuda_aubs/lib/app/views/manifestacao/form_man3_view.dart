import 'dart:io';
import 'package:ajuda_ubs/app/views/manifestacao/form_man4_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:ajuda_ubs/app/utils/user.dart';
import 'package:ajuda_ubs/app/utils/user_preferences.dart';


// ignore: must_be_immutable
class FormMan3View extends StatefulWidget {
  const FormMan3View({Key? key}) : super(key: key);

  @override
  _FormMan3ViewState createState() => _FormMan3ViewState();
}

class _FormMan3ViewState extends State<FormMan3View> {
  User user = UserPreferences.myUser;
  var dropOpcoes = ['UBS 1', 'UBS 2', 'UBS 3', 'UBS 4'];
  FilePickerResult? result;
  PlatformFile? file;
  late int qtdImagns = 0;

  String dataNascimento = '';

  final dropValue = ValueNotifier('');

  DateTime dateTime = DateTime.now();

  late bool temImagens = false;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  const Text(
                    'Deseja adicionar imagens?',
                    style: TextStyle(
                        color: Color.fromARGB(255, 138, 161, 212),
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: (qtdImagns >= 3 && temImagens)
                          ? ListTile(
                              enabled: true,
                              onTap: () {
                                pickFiless();
                              },
                              leading: Text(
                                "$qtdImagns /3",
                                textAlign: TextAlign.right,
                              ),
                              title: const Text(
                                "Alterar imagens",
                                textAlign: TextAlign.right,
                              ),
                              trailing: const Icon(Icons.edit),
                            )
                          : ListTile(
                              enabled: true,
                              onTap: () {
                                pickFiless();
                              },
                              leading: Text(
                                "$qtdImagns /3",
                                textAlign: TextAlign.right,
                              ),
                              title: const Text(
                                "Adicionar imagens",
                                textAlign: TextAlign.right,
                              ),
                              trailing: const Icon(Icons.attach_file),
                            )),
                  (result?.files != null && ((result?.files.length ?? 0) <= 3))
                      ? SizedBox(
                          height: 225,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: result!.files.length,
                              itemBuilder: (context, index) {
                                final file = result!.files[index];
                                return buildFile(file);
                              }))
                      : Text(
                          ((qtdImagns > 3)
                              ? 'Por favor, escolha no máximo 3 imagens.'
                              : ''),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 255, 0, 0),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                  const SizedBox(height: 20),
                  const Text(
                    'Quando foi o ocorrido?',
                    style: TextStyle(
                        color: Color.fromARGB(255, 138, 161, 212),
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      keyboardType: TextInputType.datetime,
                      onChanged: (data) {
                        dataNascimento = data;
                      },
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(DateTime.now().year -
                                120), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime.now());

                        if (pickedDate != null) {
                          setState(() {
                            dataNascimento =
                                DateFormat('dd/MM/yyyy').format(pickedDate);
                          }); //formatted date output using intl package =>  2021-03-16
                        }
                      }, //set it true, so that user will not able to edit text
                      controller: TextEditingController(text: dataNascimento),
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.calendar_today),
                        label: const Text(
                          'Data de nascimento',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(height: 20),
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
                                builder: (_) => const FormMan4View()));
                      },
                      child: const Icon(Icons.arrow_forward)),

                  //(file == null)? Container() : Image.file(File(file!.path.toString()), width: 100, height: 100)
                ],
              ),
            ))));
  }

  Widget buildFile(PlatformFile file) {
    final kb = file.size / 1024;
    final mb = kb / 1024;
    final size = (mb >= 1)
        ? '${mb.toStringAsFixed(2)} MB'
        : '${kb.toStringAsFixed(2)} KB';
    return InkWell(
      onTap: () => viewFile(file),
      child: ListTile(
        leading: (file.extension == 'jpg' || file.extension == 'png')
            ? Image.file(
                File(file.path.toString()),
                width: 80,
                height: 80,
              )
            : const SizedBox(
                width: 80,
                height: 80,
              ),
        title: Text(file.name),
        subtitle: Text('${file.extension}'),
        trailing: Text(
          size,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  void pickFiless() async {
    FilePickerResult? arq = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png'],
        allowMultiple: true);

    bool colocouImagens = false;
    if (arq != null) {
      if (arq.files.length < 4 && arq.files.isNotEmpty) {
        colocouImagens = true;
      }
      setState(() {
        result = arq;
        qtdImagns = result!.files.length;
        temImagens = colocouImagens;
      });
    } else {
      return;
    }
  }

  void viewFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }
}