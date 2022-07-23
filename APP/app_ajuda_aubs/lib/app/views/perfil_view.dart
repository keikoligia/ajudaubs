import 'package:ajuda_ubs/app/views/edit_perfil_view.dart';
import 'package:ajuda_ubs/app/views/ubs_view.dart';
import 'package:flutter/material.dart';
import '../utils/user_preferences.dart';
import '../utils/components_widget.dart';

class PerfilView extends StatefulWidget {
  const PerfilView({Key? key}) : super(key: key);

  @override
  _PerfilViewState createState() => _PerfilViewState();
}

class _PerfilViewState extends State<PerfilView> {
  @override
  Widget build(BuildContext context) {
    const user = UserPreferences.myUser;

    return Scaffold(
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              ComponentsUtils.ImagePerson(
                  context, user.imagePath, false, () async {}),
              const SizedBox(height: 15),
              Column(
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    user.email,
                    style: const TextStyle(color: Colors.grey),
                  )
                ],
              ),
              const SizedBox(height: 15),
              Center(
                  child: ComponentsUtils.ButtonTextColor(
                context,
                'Atualizar dados',
                () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const EditPerfilView()));
                },
                const Color.fromRGBO(138, 162, 212, 1),
              )),
              const SizedBox(height: 15),
              Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ComponentsUtils.TextValueIcon(
                      context,
                      const Icon(Icons.call_to_action),
                      '700207452947129',
                      'Cartão do SUS'),
                  const Divider(
                      height: 30,
                      endIndent: 20,
                      indent: 20,
                      thickness: 0.5,
                      color: Color.fromRGBO(138, 162, 212, 1)),
                  ComponentsUtils.TextValueIcon(context,
                      const Icon(Icons.phone), '(19)994974618', 'Telefone'),
                  const Divider(
                      height: 30,
                      endIndent: 20,
                      indent: 20,
                      thickness: 0.5,
                      color: Color.fromRGBO(138, 162, 212, 1)),
                  ComponentsUtils.TextValueIcon(context, const Icon(Icons.home),
                      'Rua Amadeu Gardini, 249', 'Endereço'),
                  const Divider(
                      height: 30,
                      endIndent: 20,
                      indent: 20,
                      thickness: 0.5,
                      color: Color.fromRGBO(138, 162, 212, 1)),
                  ComponentsUtils.TextValueIcon(
                      context,
                      const Icon(Icons.calendar_today),
                      '08/05/2004',
                      'Nascimento'),
                  const Divider(
                      height: 30,
                      endIndent: 20,
                      indent: 20,
                      thickness: 0.5,
                      color: Color.fromRGBO(138, 162, 212, 1)),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(width: 15),
                      const Icon(Icons.local_hospital),
                      const SizedBox(width: 15),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 4,
                          child: const Text(
                            'UBS',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          )),
                      const SizedBox(width: 15),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Center(
                          child: ComponentsUtils.ButtonTextColor(
                              context, 'UBS São Quirino', () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const UbsView()));
                          }, const Color.fromARGB(255, 117, 136, 179)),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
            ],
          ))),
    );
  }
}
