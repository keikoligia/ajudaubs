// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ajuda_ubs/app/models/endereco_model.dart';
import 'package:ajuda_ubs/app/models/paciente_model.dart';
import 'package:ajuda_ubs/app/models/result_cep_model.dart';
import 'package:ajuda_ubs/app/models/ubs_model.dart';
import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:ajuda_ubs/app/views/cadastro/form_cad2_view.dart';
import 'package:ajuda_ubs/app/views/cadastro/form_cad3_view.dart';
import 'package:ajuda_ubs/app/views/cadastro/form_cad4_view.dart';
import 'package:ajuda_ubs/app/views/cadastro/form_cad5_view.dart';
import 'package:ajuda_ubs/app/views/cadastro/form_cad6_view.dart';
import 'package:ajuda_ubs/app/views/cadastro/form_cad7_view.dart';
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

  late List<String> dropOpcoes = ['UBS 1', 'UBS 2', 'UBS 3', 'UBS 4'];
  late ValueNotifier<String> dropValue = ValueNotifier('');

  late String dataNascimento = '';

  late List<UBS> ubs;

  var opcoes = <String>[];

  CadastroController.constructor1();

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
    this.dropOpcoes,
    this.dropValue,
  );

  void verificarCad1(BuildContext context, String dataNascimento) {/*
    this.dataNascimento = dataNascimento;

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
      ComponentsUtils.Mensagem(
          true, 'Cartão Nacional de Saúde inválido!', '', context);
    }

    paciente.nome = controllerNome.text;
    paciente.dataNascimento = this.dataNascimento;
    paciente.cns = controllerCns.text;*/

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => FormCad2View(cadastroController: this)));
  }

  void verificarCad2(BuildContext context) {/*
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

    if (teste.length != 11 && teste.length != 8) {
      ComponentsUtils.Mensagem(true, 'Telefone inválido!', '', context);
      return;
    }

    paciente.email = controllerEmail.text;
    paciente.telefone = controllerTelefone.text;*/

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => FormCad3View(cadastroController: this)));
  }

  void verificarCad3(BuildContext context) {/*
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

    endereco.numero = testeNum;
    endereco.idEndereco = paciente.cns;

    paciente.endereco = paciente.cns;*/

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => FormCad4View(cadastroController: this)));
  }

  void verificarCad4(BuildContext context) {
    if (dropValue.value.isEmpty) {
      ComponentsUtils.Mensagem(true, 'Selecione uma UBS!', '', context);
      return;
    }

    String value = dropValue.value;

    Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => FormCad5View(cadastroController: this)));

    if (ubs.isNotEmpty) {
      for (int i = 0; i < ubs.length; i++) {
        UBS u = ubs.elementAt(i);
        if (value == u.nome) {
          paciente.idUbs = u.cnes;

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => FormCad5View(cadastroController: this)));

          return;
        }
      }
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => FormCad5View(cadastroController: this)));
    }
  }

  void verificarCad5(BuildContext context) {
    if (controllerSen1.text.trim() == '') {
      ComponentsUtils.Mensagem(true, 'Digite uma senha.', '', context);
      return;
    }

    if (controllerSen2.text.trim() == '') {
      ComponentsUtils.Mensagem(true, 'Confirme sua senha.', '', context);
      return;
    }

    if (controllerSen2.text.trim() != controllerSen1.text.trim()) {
      ComponentsUtils.Mensagem(
          true, 'As duas senhas não são iguais.', '', context);
      return;
    }

    paciente.senha = controllerSen2.text;

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => FormCad6View(cadastroController: this)));
  }

  void verificarCad6(BuildContext context) async {
    try {
      var response = await http.post(
          Uri.parse('http://localhost:5000/endereco'),
          body: Endereco.end.toMap());

      if (response.statusCode == 200) {
        response = await http.post(Uri.parse('http://localhost:5000/paciente'),
            body: Paciente.pa.toMap());

        if (response.statusCode == 200) {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const FormCad7View()));
        }
      }
    } catch (e) {
      print(e);
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

  late String cepVerifica = '';

  Future searchCep(BuildContext context) async {
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

        endereco.cep = controllerCep.text;
        endereco.rua = controllerRua.text;
        endereco.bairro = resultCep.bairro;
        endereco.complemento = resultCep.complemento;

        endereco.municipio = resultCep.localidade;
        endereco.estado = resultCep.uf;
        return;
      }
    } catch (e) {
      print(e);
      controllerBairro.text = '';
      controllerRua.text = '';
    }

    ComponentsUtils.Mensagem(true, 'CEP Inválido', '', context);
  }

  void loadingUBS() async {
    try {
      var response = await http.get(Uri.parse('http://localhost:5000/ubs'));
      if (response.statusCode == 200) {
        ubs = UBS.fromJsons(response.body);
        for (int i = 0; i < ubs.length; i++) {
          opcoes.add(ubs.elementAt(i).nome);
        }
        dropOpcoes = opcoes;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
