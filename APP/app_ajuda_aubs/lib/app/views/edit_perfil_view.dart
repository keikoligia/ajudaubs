import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:flutter/material.dart';
import '../utils/user.dart';
import '../utils/user_preferences.dart';

class EditPerfilView extends StatefulWidget {
  const EditPerfilView({Key? key}) : super(key: key);

  @override
  _EditPerfilViewState createState() => _EditPerfilViewState();
}

class _EditPerfilViewState extends State<EditPerfilView> {
  User user = UserPreferences.myUser;
  var dropOpcoes = ['UBS 1', 'UBS 2', 'UBS 3', 'UBS 4'];

  String endereco =
      'Rua Amadeu Gardini, 249 - 13088652 - Jardim Santana - Campinas, SP ';
  String nome = 'Fabricio Onofre Rezende de Camargo';
  String email = 'fabricio.falcoon@gmail.com';
  String cns = '700207452947129';
  String telefone = '19994974618';
  String data = '08/05/2004';

  late final TextEditingController controllerEnd;
  late final TextEditingController controllerNome;
  late final TextEditingController controllerCns;
  late final TextEditingController controllerEmail;
  late final TextEditingController controllerTelefone;

  late final TextEditingController controllerData;

  @override
  void initState() {
    super.initState();
    controllerEnd = TextEditingController(text: endereco);
    controllerNome = TextEditingController(text: nome);
    controllerCns = TextEditingController(text: cns);
    controllerEmail = TextEditingController(text: email);
    controllerTelefone = TextEditingController(text: telefone);
    controllerData = TextEditingController(text: data);
  }

  @override
  void dispose() {
    controllerNome.dispose();
    controllerEnd.dispose();
    controllerCns.dispose();
    controllerEmail.dispose();
    controllerTelefone.dispose();
    super.dispose();
    controllerData.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const user = UserPreferences.myUser;
    final dropValue = ValueNotifier('');
    return Scaffold(
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 15),
                  ComponentsUtils.ImagePerson(
                      context, user.imagePath, true, () async {}),
                  const SizedBox(height: 15),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: ComponentsUtils.TextFieldEdit(
                          context,
                          1,
                          'Nome completo',
                          TextInputType.text,
                          const Icon(Icons.person),
                          () {},
                          controllerNome, (cepp) {
                        nome = cepp;
                      }, true)),
                  const SizedBox(height: 15),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: ComponentsUtils.TextFieldEdit(
                          context,
                          1,
                          'Nome completo',
                          TextInputType.emailAddress,
                          const Icon(Icons.email),
                          () {},
                          controllerEmail, (cepp) {
                        email = cepp;
                      }, true)),
                  const SizedBox(height: 15),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: ComponentsUtils.TextFieldEdit(
                          context,
                          1,
                          'Cartão do SUS',
                          TextInputType.emailAddress,
                          const Icon(Icons.card_membership),
                          () {},
                          controllerCns, (cepp) {
                        cns = cepp;
                      }, true)),
                  const SizedBox(height: 15),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: ComponentsUtils.TextFieldEdit(
                          context,
                          1,
                          'Data de nascimento',
                          TextInputType.datetime,
                          const Icon(Icons.calendar_today),
                          () {},
                          controllerData, (cepp) {
                        data = cepp;
                      }, true)),
                  const SizedBox(height: 15),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: ComponentsUtils.TextFieldEdit(
                          context,
                          1,
                          'Telefone',
                          TextInputType.phone,
                          const Icon(Icons.phone),
                          () {},
                          controllerTelefone, (cepp) {
                        telefone = cepp;
                      }, true)),
                  const SizedBox(height: 15),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: ComponentsUtils.TextFieldEdit(
                          context,
                          1,
                          'Endereço',
                          TextInputType.streetAddress,
                          const Icon(Icons.maps_home_work),
                          () {},
                          controllerEnd, (cepp) {
                        endereco = cepp;
                      }, true)),
                  const SizedBox(height: 15),
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
                                      'UBS',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
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
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        onPrimary: Colors.white,
                        primary: const Color.fromARGB(255, 177, 193, 228),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 12),
                      ),
                      onPressed: () {},
                      child: const Icon(Icons.done)),
                  const SizedBox(height: 15),
                ],
              ),
            )));
  }
}
