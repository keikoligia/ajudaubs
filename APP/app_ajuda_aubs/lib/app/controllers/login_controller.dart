import 'package:ajuda_ubs/app/models/paciente_model.dart';
import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PacienteController {
  late Paciente paciente;
  late TextEditingController login;
  late TextEditingController senha;

  PacienteController({required this.login, required this.senha});

  void verificarLogin(BuildContext context) async {
    String textLogin = login.text;
    String textSenha = senha.text;

    if (textLogin == '') {
      ComponentsUtils.Mensagem(true, 'Usúario inexiste!', '', context);
      return;
    }

    try {
      var response = await http
          .get(Uri.parse('http://localhost:5000/paciente/$textLogin'));
      if (response.statusCode == 200) {
        paciente = Paciente.fromJson(response.body);
        if (paciente.email == textLogin || paciente.cns == textLogin) {
          if (paciente.senha == textSenha) {
            Navigator.of(context).pushReplacementNamed('/home');
          } else {
            ComponentsUtils.Mensagem(true, 'Senha inválida!', '', context);
            return;
          }
        }
      } else {
        ComponentsUtils.Mensagem(true, 'Usúario inexiste!', '', context);
        return;
      }
    } catch (e) {
      //print(e.toString());
    }
  }
}
