import 'package:ajuda_ubs/app/models/paciente_model.dart';
import 'package:ajuda_ubs/app/utils/app_controller.dart';
import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginController {
  late Paciente paciente;
  late TextEditingController login;
  late TextEditingController senha;

  LoginController({required this.login, required this.senha});

  void verificarLogin(BuildContext context) async {
    String textLogin = login.text;
    String textSenha = senha.text;

    if (textLogin == '') {
      // ComponentsUtils.Mensagem(true, 'Usúario inexiste!', '', context);
      ComponentsUtils.Mensagem(
          false,
          'Erro no Email',
          'O email inserido não existe ou não é válido. Insira um endereço de email adequado ',
          '',
          () {},
          context);

      return;
    }

    try {
      var response = await http
          .get(Uri.parse('http://localhost:3000/paciente/$textLogin'));
      if (response.statusCode == 200) {
        paciente = Paciente.fromJson(response.body);
        if (paciente.email == textLogin || paciente.cns == textLogin) {
          if (paciente.senha == textSenha) {
            AppController.instance.paciente = paciente;
            AppController.instance.isLogado = true;
            Navigator.of(context).pushReplacementNamed('/home');
          } else {
            // ComponentsUtils.Mensagem(true, 'Senha inválida!', '', context);
            ComponentsUtils.Mensagem(
                false,
                'Erro no Email',
                'O email inserido não existe ou não é válido. Insira um endereço de email adequado ',
                '',
                () {},
                context);

            return;
          }
        }
      } else {
        //ComponentsUtils.Mensagem(true, 'Usúario inexiste!', '', context);
        ComponentsUtils.Mensagem(
            false,
            'Erro no Email',
            'O email inserido não existe ou não é válido. Insira um endereço de email adequado ',
            '',
            () {},
            context);

        return;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
