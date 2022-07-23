// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ajuda_ubs/app/models/endereco_model.dart';
import 'package:ajuda_ubs/app/models/paciente_model.dart';
import 'package:ajuda_ubs/app/models/result_cep_model.dart';
import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:ajuda_ubs/app/views/cadastro/form_cad2_view.dart';
import 'package:ajuda_ubs/app/views/cadastro/form_cad3_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CadastroController {
  late Paciente paciente;
  late Endereco endereco;

  late TextEditingController controllerNome;
  late TextEditingController controllerData;
  late TextEditingController controllerCns;

  late TextEditingController controllerTelefone;
  late TextEditingController controllerEmail;

  late TextEditingController controllerCep;
  late TextEditingController controllerNum;
  late TextEditingController controllerComp;
  late TextEditingController controllerRua;
  late TextEditingController controllerBairro;

  late TextEditingController controllerSen2;
  late TextEditingController controllerSen1;

  CadastroController(
    this.paciente,
    this.endereco,
    this.controllerNome,
    this.controllerData,
    this.controllerCns,
    this.controllerTelefone,
    this.controllerEmail,
    this.controllerCep,
    this.controllerNum,
    this.controllerBairro,
    this.controllerRua,
    this.controllerComp,
    this.controllerSen2,
    this.controllerSen1,
  );
/*

  CadastroController(this.paciente, this.endereco, this.controllerNome,
      this.controllerData, this.controllerCns);
*/
  TextEditingController getControlTelefone() {
    return controllerTelefone;
  }

  void setControlTelefone(TextEditingController te) {
    controllerTelefone = te;
  }

  TextEditingController getControlEmail() {
    return controllerEmail;
  }

  void setControlEmail(TextEditingController te) {
    controllerEmail = te;
  }

  void verificarCad1(BuildContext context, String dataNascimento) {
    if (controllerNome.text.trim() == '') {
      ComponentsUtils.Mensagem(true, 'Nome inválido!', '', context);
      return;
    }

    if (!isValidDate(dataNascimento)) {
      ComponentsUtils.Mensagem(
          true, 'Data de nascimento inválida!', '', context);
      return;
    }

    String teste = controllerCns.text.trim();

    try {
      int.parse(teste);
    } catch (e) {
      ComponentsUtils.Mensagem(
          true, 'Digite somente números os cartão.', '', context);
      return;
    }

    if (teste.length != 15) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => FormCad2View(cadastroController: this)));
    } else {
      ComponentsUtils.Mensagem(
          true, 'Cartão Nacional de Saúde inválido!', '', context);
    }
  }

  void verificarCad2(BuildContext context) {
    if (!isValidEmail(controllerEmail.text)) {
      ComponentsUtils.Mensagem(true, 'Email inválido!', '', context);
      return;
    }
    String teste = controllerTelefone.text.trim();

    try {
      int.parse(teste);
    } catch (e) {
      ComponentsUtils.Mensagem(true, 'Digite somente números.', '', context);
      return;
    }

    if (teste.length == 11 || teste.length == 8) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => FormCad3View(cadastroController: this)));
    } else {
      ComponentsUtils.Mensagem(true, 'Telefone inválido!', '', context);
    }
  }

  void verificarCad3(BuildContext context) {
    String testeCep = controllerCep.text.trim();

    try {
      int.parse(testeCep);
    } catch (e) {
      ComponentsUtils.Mensagem(
          true, 'Digite somente os números do CEP.', '', context);
      return;
    }

    if (testeCep.length != 8 || testeCep != cepVerifica) {
      ComponentsUtils.Mensagem(true, 'CEP inválido!', '', context);
      return;
    }

    String testeNum = controllerNum.text.trim();

    try {
      int.parse(testeNum);
    } catch (e) {
      ComponentsUtils.Mensagem(
          true, 'Digite somente o número da residência.', '', context);
      return;
    }

    if (testeNum.length > 6) {
      ComponentsUtils.Mensagem(true, 'Número inválido!', '', context);
      return;
    }

    if (controllerBairro.text.trim() == '' || controllerRua.text.trim() == '') {
      ComponentsUtils.Mensagem(
          true, 'Digite seu CEP e o consulte clicando no botão!', '', context);
    }
  }

  bool isValidDate(String input) {
    try {
      final date = DateTime.parse(input);

      final originalFormatString = toOriginalFormatString(date);
      return input == originalFormatString;
    } catch (e) {
      return false;
    }
  }

  String toOriginalFormatString(DateTime dateTime) {
    final y = dateTime.year.toString().padLeft(4, '0');
    final m = dateTime.month.toString().padLeft(2, '0');
    final d = dateTime.day.toString().padLeft(2, '0');
    return "$y-$m-$d";
  }

  bool isValidEmail(String email) {
    RegExp reg = RegExp(r"^[^@]+@[^@]+\.[^@]+$");
    return reg.hasMatch(email);
  }

  bool loading = false;
  bool enableField = true;
  late String result = '';
  late String cepVerifica = '';

  void searching(bool enable) {
    result = (enable) ? '' : result;
    loading = enable;
    enableField = !enable;
  }

  Widget circularLoading() {
    return const SizedBox(
      height: 15.0,
      width: 15.0,
      child: CircularProgressIndicator(),
    );
  }

  Future searchCep(BuildContext context) async {
    searching(true);
    final cep = controllerCep.text;

    try {
      var response =
          await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));
      if (response.statusCode == 200) {
        final resultCep = ResultCep.fromJson(response.body);
        cepVerifica = cep;

        controllerBairro.text =
            '${resultCep.bairro} - ${resultCep.localidade}, ${resultCep.uf}';

        controllerRua.text = resultCep.logradouro;

        searching(false);
        return;
      }
    } catch (e) {
      controllerBairro.text = '';
      controllerRua.text = '';
    }

    ComponentsUtils.Mensagem(true, 'CEP Inválido', '', context);

    searching(false);
  }

  // var dropOpcoes = ['UBS 1', 'UBS 2', 'UBS 3', 'UBS 4'];
  // final dropValue = ValueNotifier('');

}
