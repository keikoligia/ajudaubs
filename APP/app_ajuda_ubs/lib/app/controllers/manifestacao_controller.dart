// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_typing_uninitialized_variables
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:ajuda_ubs/app/models/cargoarea_model.dart';
import 'package:ajuda_ubs/app/models/envolvido_model.dart';
import 'package:ajuda_ubs/app/models/manifestacao_model.dart';
import 'package:ajuda_ubs/app/models/ubs_model.dart';
import 'package:ajuda_ubs/app/utils/app_controller.dart';
import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:ajuda_ubs/app/views/manifestacao/form_manifestacao2_view.dart';
import 'package:ajuda_ubs/app/views/manifestacao/form_manifestacao3_view.dart';
import 'package:ajuda_ubs/app/views/manifestacao/form_manifestacao4_view.dart';
import 'package:ajuda_ubs/app/views/manifestacao/form_manifestacao5_view.dart';
import 'package:ajuda_ubs/app/views/usuario/login_usuario_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class ManifestacaoController extends ChangeNotifier {
  var dropValueOpcoes = ValueNotifier('');
  var dropValueAnonimato = ValueNotifier('');
  var dropOpcoes = ['UBS 1', 'UBS 2', 'UBS 3'];
  var dropOpcoesAnonimato = ['SIM', 'NÃO'];

  late List<UBS> listUbs;
  TextEditingController controllerDescricao = TextEditingController();
  TextEditingController controllerProtocolo = TextEditingController();
  TextEditingController controllerCodigo = TextEditingController();
  late Manifestacao manifestacao;

  late FilePickerResult? result;
  late PlatformFile? file;
  int qtdImagns = 0;
  bool temImagens = false;

  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  DateTime data = DateTime.now();

  String dataDenuncia = '';
  List<String> nome = [];
  List<String> funcao = [];
  List<String> cargosAreas = [];
  List<TextEditingController> texts = [];

  int qtdEnvolvidos = 1;

  bool isEscolheu = false;

  ManifestacaoController() {
    manifestacao = Manifestacao(
        protocolo: '',
        idUbs: '',
        codigoAcesso: '',
        idPaciente: '',
        tipo: '',
        status: 'PENDENTE',
        imagem1: '',
        imagem2: '',
        imagem3: '',
        descricao: '',
        dataManifestacao: '');

    result = null;

    getUBS();
    getCargos();
  }

  getCargos() async {
    try {
      var response =
          await http.get(Uri.parse('http://localhost:3000/cargoarea'));
      if (response.statusCode == 200) {
        late List<CargoArea> cargos = CargoArea.fromJsons(response.body);
        cargosAreas = cargos.map((op) => op.nomeCargo).toList();
        notifyListeners();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
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
    FilePickerResult? arq;
    try {
      arq = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['jpg', 'png'],
          allowMultiple: true);
    } catch (err) {
      debugPrint(err.toString());
    }

    bool colocouImagens = false;
    if (arq != null) {
      if (arq.files.length < 4 && arq.files.isNotEmpty) {
        colocouImagens = true;
      }

      final ByteData bytes = await rootBundle.load(arq.files[0].path!);
      Uint8List imageInUnit8List = bytes.buffer.asUint8List();
      final tempDir = await getTemporaryDirectory();
      File file = await File('${tempDir.path}/image.png').create();
      file.writeAsBytesSync(imageInUnit8List);

      result = arq;
      qtdImagns = result!.files.length;
      temImagens = colocouImagens;
      notifyListeners();
    } else {
      return;
    }
  }

  void viewFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }

  void getUBS() async {
    try {
      var response = await http.get(Uri.parse('http://localhost:3000/ubs'));
      if (response.statusCode == 200) {
        listUbs = UBS.fromJsons(response.body);
        dropOpcoes.clear();
        for (int i = 0; i < listUbs.length; i++) {
          dropOpcoes.add(listUbs.elementAt(i).nome);
        }
        notifyListeners();
      }
    } catch (e) {
      print('ERRO CARREGADOR UBS CAD 4');
    }
  }

  static String _fourDigits(int n) {
    int absN = n.abs();
    String sign = n < 0 ? "-" : "";
    if (absN >= 1000) return "$n";
    if (absN >= 100) return "${sign}0$absN";
    if (absN >= 10) return "${sign}00$absN";
    return "${sign}000$absN";
  }

  static String _twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  String getDateDenuncia(BuildContext context) {
    String y = _fourDigits(data.year);
    String m = _twoDigits(data.month);
    String d = _twoDigits(data.day);

    dataDenuncia = "$d/$m/$y";

    if (isEscolheu) {
      return dataDenuncia;
    } else {
      return 'Selecione uma data';
    }
  }

  String gerarProtocolo([int length = 32]) {
    var values =
        List<int>.generate(length, (i) => Random.secure().nextInt(256));
    return base64Url.encode(values);
  }

  void verificacaoMan1(
      BuildContext context, String categoria, String descricao) async {
    /* if (categoria.trim() == "") {
      ComponentsUtils.Mensagem('Erro Manifestação',
          'Selecione uma categoria de manifestação.', '', () {}, context);
      return;
    }*/

    manifestacao.tipo = categoria;

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => FormManifestacao2View(
                  manifestacaoController: this,
                  descricao: descricao,
                )));
  }

  void verificacaoMan2(BuildContext context) async {
    if (dropValueAnonimato.value.isEmpty) {
//  ComponentsUtils.Mensagem(true, 'Nome inválido!\n', '', context);
      ComponentsUtils.Mensagem(
          false,
          'Erro na Identificação',
          'Selecione uma forma de identicação, podendo ou não ser em anônimato.',
          '',
          () {},
          context);

      return;
    } else {
      if (dropValueAnonimato.value.toUpperCase() == 'NÃO') {
        if (AppController.instance.isLogado) {
          manifestacao.idPaciente = AppController.instance.paciente.cns;
          dropValueAnonimato.value = 'NÃO';
        } else {
          ComponentsUtils.Mensagem(
              false,
              'Erro de Indentificação',
              'Para se identificar na manifestação é necessário estar logado no AjudaUBS. Faça o login no aplicativo ou crie uma conta para continuar o processo de identificação.',
              'Login', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const LoginUsuarioView()));
          }, context);
        }
      }
    }
    if (dropValueOpcoes.value.isEmpty) {
      ComponentsUtils.Mensagem(false, 'Erro no Local',
          'Selecione onde aconteceu a denúncia.', '', () {}, context);

      return;
    } else {
      manifestacao.idUbs = listUbs
          .singleWhere((element) => element.nome == dropValueOpcoes.value)
          .cnes;
    }

    //DateTime date = DateTime(2017, 9, 7, 17, 30);

    if (controllerDescricao.text.trim() == '') {
      //  ComponentsUtils.Mensagem(true, 'Nome inválido!\n', '', context);
      ComponentsUtils.Mensagem(false, 'Erro na Descrição!',
          'Escreva a denúncia no campo de descrição.', '', () {}, context);

      return;
    } else {
      manifestacao.descricao = controllerDescricao.text;
    }

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) =>
                FormManifestacao3View(manifestacaoController: this)));
  }

  void verificacaoMan3(BuildContext context) async {
    if (dataDenuncia.isEmpty) {
      ComponentsUtils.Mensagem(
          false, 'Erro de Data!', 'Selecione uma data.', '', () {}, context);

      return;
    }

    manifestacao.dataManifestacao = dataDenuncia;

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) =>
                FormManifestacao4View(manifestacaoController: this)));
  }

  void verificacaoMan4(BuildContext context) async {
    debugPrint(nome.toString());
    debugPrint(funcao.toString());
    debugPrint(manifestacao.toString());

    //List<Envolvido> listEnvol = [];

    bool protocoloOK = false;
    String proto = "";

    do {
      proto = gerarProtocolo(6);
      try {
        var response = await http
            .get(Uri.parse('http://localhost:3000/manifestacao/$proto'));

        if (response.statusCode == 404) {
          protocoloOK = true;
        }
      } catch (e) {
        debugPrint('e');
      }
    } while (!protocoloOK);

    manifestacao.protocolo = proto + '/${selectedDay.year}';
    manifestacao.codigoAcesso = gerarProtocolo(6);

    try {
      var response = await http.post(
          Uri.parse('http://localhost:3000/manifestacao/'),
          body: manifestacao.toMap());
      if (response.statusCode == 200) {
        Envolvido envolvido;

        for (int i = 0; i < nome.length; i++) {
          if (nome[i].isNotEmpty) {
            envolvido = Envolvido(
                nomeEnvolvido: nome[i],
                cargoEnvolvido: funcao[i],
                idManifestacao: manifestacao.protocolo);

            await http.post(Uri.parse('http://localhost:3000/envolvido/'),
                body: envolvido.toMap());
          }
        }
      }

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) =>
                  FormManifestacao5View(manifestacaoController: this)));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void consultarManifestacao(BuildContext context) async {
    try {
      var response = await http.get(Uri.parse(
          'http://localhost:3000/manifestacao/${controllerProtocolo.text}/${controllerCodigo.text}'));
      if (response.statusCode == 200) {
        Manifestacao paciente = Manifestacao.fromJson(response.body);
      } else {
        //ComponentsUtils.Mensagem(true, 'Usúario inexiste!', '', context);
        ComponentsUtils.Mensagem(
            false,
            'Erro de Consulta',
            'Os dados fornecidos para a consulta estão inválido.',
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
