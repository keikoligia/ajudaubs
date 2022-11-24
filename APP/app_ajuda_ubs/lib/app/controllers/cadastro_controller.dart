// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ajuda_ubs/app/models/endereco_model.dart';
import 'package:ajuda_ubs/app/models/paciente_model.dart';
import 'package:ajuda_ubs/app/models/result_cep_model.dart';
import 'package:ajuda_ubs/app/models/ubs_model.dart';
import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:ajuda_ubs/app/views/cadastro/form_cadastro1_view.dart';
import 'package:ajuda_ubs/app/views/cadastro/form_cadastro2_view.dart';
import 'package:ajuda_ubs/app/views/cadastro/form_cadastro3_view.dart';
import 'package:ajuda_ubs/app/views/cadastro/form_cadastro5_view.dart';
import 'package:ajuda_ubs/app/views/cadastro/form_cadastro7_view.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class CadastroController extends ChangeNotifier {
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
  late GoogleMapController _mapsController;
  late Set<Marker> markers = <Marker>{};

  late List<UBS> ubs;

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

  void verificarCad1(BuildContext context, String dataNascimento) {
    this.dataNascimento = dataNascimento;

    if (controllerNome.text.trim() == '') {
      //  ComponentsUtils.Mensagem(true, 'Nome inválido!\n', '', context);
      ComponentsUtils.Mensagem(
          false,
          'Erro no Email',
          'O email inserido não existe ou não é válido. Insira um endereço de email adequado ',
          '',
          () {},
          context);

      return;
    }

    if (!isValidDate(dataNascimento)) {
      // ComponentsUtils.Mensagem(true,
      //'Data de nascimento inválida!\nModelo: (dia/mes/ano)\n', '', context);
      ComponentsUtils.Mensagem(
          false,
          'Erro no Email',
          'O email inserido não existe ou não é válido. Insira um endereço de email adequado ',
          '',
          () {},
          context);

      return;
    }

    String teste = controllerCns.text.trim();

    try {
      int.parse(teste);
    } catch (e) {
      // ComponentsUtils.Mensagem(
      //   true, 'Digite somente os números do cartão.\n', '', context);
      ComponentsUtils.Mensagem(
          false,
          'Erro no Email',
          'O email inserido não existe ou não é válido. Insira um endereço de email adequado ',
          '',
          () {},
          context);

      return;
    }

    if (teste.length != 15) {
      //ComponentsUtils.Mensagem(
      //     true, 'Cartão Nacional de Saúde inválido!\n', '', context);
      ComponentsUtils.Mensagem(
          false,
          'Erro no Email',
          'O email inserido não existe ou não é válido. Insira um endereço de email adequado ',
          '',
          () {},
          context);

      return;
    }

    paciente.nome = controllerNome.text;
    paciente.dataNascimento = controllerData.text;
    paciente.cns = controllerCns.text;

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => FormCadastro2View(cadastroController: this)));
  }

  void verificarCad2(BuildContext context) {
    if (!isValidEmail(controllerEmail.text)) {
      ComponentsUtils.Mensagem(
          false,
          'Erro no Email',
          'O email inserido não existe ou não é válido. Insira um endereço de email adequado ',
          '',
          () {},
          context);
      return;
    }
    String teste = controllerTelefone.text.trim();

    try {
      int.parse(teste);
    } catch (e) {
      //  ComponentsUtils.Mensagem(
      //     true, 'Digite somente os números do seu telefone.\n', '', context);
      ComponentsUtils.Mensagem(
          false,
          'Erro no Email',
          'O email inserido não existe ou não é válido. Insira um endereço de email adequado ',
          '',
          () {},
          context);

      return;
    }

    if (teste.length != 11 && teste.length != 8) {
      // ComponentsUtils.Mensagem(true, 'Telefone inválido!\n', '', context);
      ComponentsUtils.Mensagem(
          false,
          'Erro no Email',
          'O email inserido não existe ou não é válido. Insira um endereço de email adequado ',
          '',
          () {},
          context);

      return;
    }

    paciente.email = controllerEmail.text;
    paciente.telefone = controllerTelefone.text;

    if (dropValue.value.isEmpty) {
      // ComponentsUtils.Mensagem(true, 'Selecione uma UBS!', '', context);
      ComponentsUtils.Mensagem(
          false,
          'Erro no Email',
          'O email inserido não existe ou não é válido. Insira um endereço de email adequado ',
          '',
          () {},
          context);

      return;
    }

    String value = dropValue.value;

    if (ubs.isNotEmpty) {
      UBS posto = ubs.firstWhere((element) => value == element.nome);

      paciente.idUbs = posto.cnes;
    } else {
      //  ComponentsUtils.Mensagem(
      //true, 'Erro de carregamento. Refaça essa etapa.', '', context);
      ComponentsUtils.Mensagem(
          false,
          'Erro no Email',
          'O email inserido não existe ou não é válido. Insira um endereço de email adequado ',
          '',
          () {},
          context);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) =>
                  FormCadastro1View(cadastroController: this, inicio: false)));
      return;
    }

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => FormCadastro3View(cadastroController: this)));
  }

  void verificarCad3(BuildContext context) {
    String testeCep = controllerCep.text.trim();

    try {
      int.parse(testeCep);
    } catch (e) {
      //ComponentsUtils.Mensagem(
      //  true, 'Digite somente os números do CEP.', '', context);
      ComponentsUtils.Mensagem(
          false,
          'Erro no Email',
          'O email inserido não existe ou não é válido. Insira um endereço de email adequado ',
          '',
          () {},
          context);

      return;
    }

    if (testeCep.length != 8 || testeCep != cepVerifica) {
      // ComponentsUtils.Mensagem(true, 'CEP inválido!', '', context);
      ComponentsUtils.Mensagem(
          false,
          'Erro no Email',
          'O email inserido não existe ou não é válido. Insira um endereço de email adequado ',
          '',
          () {},
          context);

      return;
    }

    String testeNum = controllerNum.text.trim();

    try {
      int.parse(testeNum);
    } catch (e) {
      //ComponentsUtils.Mensagem(
      //      true, 'Digite somente o número da residência.', '', context);
      ComponentsUtils.Mensagem(
          false,
          'Erro no Email',
          'O email inserido não existe ou não é válido. Insira um endereço de email adequado ',
          '',
          () {},
          context);

      return;
    }

    if (testeNum.length > 6) {
      // ComponentsUtils.Mensagem(true, 'Número inválido!', '', context);
      ComponentsUtils.Mensagem(
          false,
          'Erro no Email',
          'O email inserido não existe ou não é válido. Insira um endereço de email adequado ',
          '',
          () {},
          context);

      return;
    }

    if (controllerBairro.text.trim() == '' || controllerRua.text.trim() == '') {
      //ComponentsUtils.Mensagem(
      // true, 'Digite seu CEP e o consulte clicando no botão!', '', context);      ComponentsUtils.Mensagem('Erro no Email', 'O email inserido não existe ou não é válido. Insira um endereço de email adequado ', '', (){}, context);

    }

    endereco.numero = testeNum;
    endereco.idEndereco = paciente.cns;
    endereco.complemento = controllerComp.text;

    String comp =
        (endereco.complemento == "") ? '' : ' - ' + endereco.complemento;
//    "endereco": "Rua Amadeu Gardini, 249 - Jardim Santana, Campinas - SP - CEP 13088652",

    paciente.endereco = endereco.rua +
        ', ' +
        endereco.numero +
        comp +
        ' - ' +
        endereco.bairro +
        ', ' +
        endereco.municipio +
        ' - ' +
        endereco.estado +
        ' - CEP ' +
        endereco.cep;

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => FormCadastro5View(cadastroController: this)));
  }

  void verificarCad4(BuildContext context) {
    if (dropValue.value.isEmpty) {
      //ComponentsUtils.Mensagem(true, 'Selecione uma UBS!', '', context);
      ComponentsUtils.Mensagem(
          false,
          'Erro no Email',
          'O email inserido não existe ou não é válido. Insira um endereço de email adequado ',
          '',
          () {},
          context);

      return;
    }

    if (ubs.isNotEmpty) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => FormCadastro5View(cadastroController: this)));

      return;
    }
  }

  void verificarCad5(BuildContext context) async {
    if (controllerSen1.text.trim() == '') {
      //ComponentsUtils.Mensagem(true, 'Digite uma senha.', '', context);
      ComponentsUtils.Mensagem(
          false,
          'Erro no Email',
          'O email inserido não existe ou não é válido. Insira um endereço de email adequado ',
          '',
          () {},
          context);

      return;
    }

    if (controllerSen2.text.trim() == '') {
      //ComponentsUtils.Mensagem(true, 'Confirme sua senha.', '', context);
      ComponentsUtils.Mensagem(
          false,
          'Erro no Email',
          'O email inserido não existe ou não é válido. Insira um endereço de email adequado ',
          '',
          () {},
          context);

      return;
    }

    if (controllerSen2.text.trim() != controllerSen1.text.trim()) {
      //ComponentsUtils.Mensagem(   true, 'As duas senhas não são iguais.', '', context);
      ComponentsUtils.Mensagem(
          false,
          'Erro no Email',
          'O email inserido não existe ou não é válido. Insira um endereço de email adequado ',
          '',
          () {},
          context);

      return;
    }

    paciente.senha = controllerSen2.text;

    try {
      var response = await http.post(
          Uri.parse('http://localhost:3000/paciente'),
          body: paciente.toMap());

      if (response.statusCode == 200) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const FormCad7View()));
      }
    } catch (e) {
      print(e);
    }
  }

  void verificarCad6(BuildContext context) async {
    try {
      var response = await http.post(
          Uri.parse('http://localhost:3000/paciente'),
          body: paciente.toMap());

      if (response.statusCode == 200) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const FormCad7View()));
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
            '${resultCep.bairro} - ${resultCep.cidade}, ${resultCep.uf}';

        controllerRua.text = resultCep.logradouro;

        endereco.cep = controllerCep.text;
        endereco.rua = controllerRua.text;
        endereco.bairro = resultCep.bairro;
        endereco.complemento = resultCep.complemento;

        endereco.municipio = resultCep.cidade;
        endereco.estado = resultCep.uf;
        return;
      }
    } catch (e) {
      print(e);
      controllerBairro.text = '';
      controllerRua.text = '';
    }
    ComponentsUtils.Mensagem(
        false,
        'Erro no Email',
        'O email inserido não existe ou não é válido. Insira um endereço de email adequado ',
        '',
        () {},
        context);

    //ComponentsUtils.Mensagem(true, 'CEP Inválido', '', context);
  }

  onMapCreated(GoogleMapController gmc) async {
    _mapsController = gmc;
    getPosicao();
  }

  getPosicao() async {
    try {
      Position posicao = await _posicaoAtual();

      var latlng = LatLng(posicao.latitude, posicao.longitude);

      markers.add(Marker(
          markerId: const MarkerId('ResidenciaLocal'),
          position: latlng,
          infoWindow:
              const InfoWindow(anchor: Offset(0.0, 0.0), title: 'Localização'),
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueAzure)));

      _mapsController.animateCamera(CameraUpdate.newLatLng(latlng));
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  Future<Position> _posicaoAtual() async {
    LocationPermission permissao;

    bool ativado = await Geolocator.isLocationServiceEnabled();
    if (!ativado) {
      return Future.error('Por favor, habilite a localização no smartphone');
    }

    permissao = await Geolocator.checkPermission();
    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();
      if (permissao == LocationPermission.denied) {
        return Future.error('Você precisa autorizar o acesso à localização');
      }
    }

    if (permissao == LocationPermission.deniedForever) {
      return Future.error('Você precisa autorizar o acesso à localização');
    }

    return await Geolocator.getCurrentPosition();
  }

  void loadingUBS() async {
    try {
      var response = await http.get(Uri.parse('http://localhost:3000/ubs'));
      if (response.statusCode == 200) {
        ubs = UBS.fromJsons(response.body);
        dropOpcoes.clear();
        for (int i = 0; i < ubs.length; i++) {
          dropOpcoes.add(ubs.elementAt(i).nome);
        }
      }
    } catch (e) {
      print('ERRO CARREGADOR UBS CAD 4');
    }
  }
}
