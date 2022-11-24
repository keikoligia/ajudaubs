// ignore_for_file: must_be_immutable

import 'package:http/http.dart' as http;
import 'package:ajuda_ubs/app/models/paciente_model.dart';
import 'package:ajuda_ubs/app/models/ubs_model.dart';
import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:ajuda_ubs/app/utils/user_preferences.dart';
import 'package:flutter/material.dart';
import 'editar_usuario2_view.dart';

class EditarUsuarioView extends StatefulWidget {
  late Paciente paciente;
  late List<String> dropOpcoes;
  late UBS ubs;

  EditarUsuarioView({
    Key? key,
    required this.paciente,
    required this.dropOpcoes,
    required this.ubs,
  }) : super(key: key);

  @override
  _EditarUsuarioViewState createState() => _EditarUsuarioViewState();
}

class _EditarUsuarioViewState extends State<EditarUsuarioView> {
  User user = User.myUser;
  late final TextEditingController controllerEnd;
  late final TextEditingController controllerNome;
  late final TextEditingController controllerEmail;
  late final TextEditingController controllerTelefone;
  late final TextEditingController controllerData;

  @override
  void dispose() {
    controllerNome.dispose();
    controllerEnd.dispose();
    controllerEmail.dispose();
    controllerTelefone.dispose();
    super.dispose();
    controllerData.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const user = User.myUser;
    final dropValue = ValueNotifier('');
    late List<String> dropOpcoes = widget.dropOpcoes;
    var paciente = widget.paciente;

    controllerEnd = TextEditingController(text: paciente.endereco);
    controllerNome = TextEditingController(text: paciente.nome);
    controllerEmail = TextEditingController(text: paciente.email);
    controllerTelefone = TextEditingController(text: paciente.telefone);
    controllerData = TextEditingController(text: paciente.dataNascimento);

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
            child: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 5),
                  ComponentsUtils.ImagePerson(
                      context, user.imagePath, true, () async {}),
                  const SizedBox(height: 15),
                  ComponentsUtils.TextFieldEdit(
                      context,
                      1,
                      'Nome completo',
                      TextInputType.text,
                      const Icon(Icons.person),
                      () {},
                      controllerNome, (cepp) {
                    paciente.nome = cepp;
                  }, true),
                  const SizedBox(height: 15),
                  ComponentsUtils.TextFieldEdit(
                      context,
                      1,
                      'Email',
                      TextInputType.emailAddress,
                      const Icon(Icons.email),
                      () {},
                      controllerEmail, (cepp) {
                    paciente.email = cepp;
                  }, true),
                  const SizedBox(height: 15),
                  ComponentsUtils.TextFieldEdit(
                      context,
                      1,
                      'Data de nascimento',
                      TextInputType.datetime,
                      const Icon(Icons.calendar_today),
                      () {},
                      controllerData, (cepp) {
                    paciente.dataNascimento = cepp;
                  }, true),
                  const SizedBox(height: 15),
                  ComponentsUtils.TextFieldEdit(
                      context,
                      1,
                      'Telefone',
                      TextInputType.phone,
                      const Icon(Icons.phone),
                      () {},
                      controllerTelefone, (cepp) {
                    paciente.telefone = cepp;
                  }, true),
                  const SizedBox(height: 15),
                  ComponentsUtils.TextFieldEdit(
                      context,
                      2,
                      'Endereço',
                      TextInputType.streetAddress,
                      const Icon(Icons.maps_home_work),
                      () {},
                      controllerEnd, (cepp) {
                    paciente.endereco = cepp;
                  }, true),
                  const SizedBox(height: 15),
                  ValueListenableBuilder(
                      valueListenable: dropValue,
                      builder: (BuildContext context, String value, _) {
                        return DropdownButtonFormField<String>(
                            isExpanded: true,
                            icon: const Icon(Icons.local_hospital),
                            hint: Text(widget.ubs.nome,
                                overflow: TextOverflow.visible,
                                style: const TextStyle(color: Colors.black)),
                            decoration: InputDecoration(
                                label: const Text(
                                  'UBS - Unidade Básica de Saúde',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                      color: Color.fromRGBO(138, 162, 212, 1),
                                      width: 2,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                      color: Color.fromRGBO(138, 162, 212, 1),
                                      width: 2,
                                    ))),
                            value: (value.isEmpty) ? null : value,
                            items: dropOpcoes
                                .map((op) => DropdownMenuItem(
                                      value: op,
                                      child: Text(op,
                                          overflow: TextOverflow.visible),
                                    ))
                                .toList(),
                            onChanged: (escolha) =>
                                dropValue.value = escolha.toString());
                      }),
                  const SizedBox(height: 15),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        onPrimary: Colors.white,
                        primary: const Color.fromARGB(255, 177, 193, 228),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 12),
                      ),
                      onPressed: () async {
                        try {
                          var response = await http.put(
                              Uri.parse(
                                  'http://localhost:3000/paciente/${paciente.cns}'),
                              body: paciente.toMap());
                          if (response.statusCode == 200) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => EditarUsuario2View()));
                          }
                        } catch (e) {
                          print(e.toString());
                        }
                      },
                      child: const Icon(Icons.done)),
                  const SizedBox(height: 5),
                ],
              ),
            ))));
  }
}
