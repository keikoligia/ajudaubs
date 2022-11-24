import 'dart:convert';
import 'package:ajuda_ubs/app/models/manifestacao_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class ChartManifestacao extends ChangeNotifier {
  late List<int> qtdTipo = [0, 0, 0, 0]; // Denuncia Elogio Duvida Sugestao
  late List<Manifestacao> manifestacoes = [];

  ChartManifestacao() {
    getManifestacoes();
  }

  getManifestacoes() async {
    try {
      var response =
          await http.get(Uri.parse('http://localhost:3000/manifestacao'));
      if (response.statusCode == 200) {
        manifestacoes = Manifestacao.fromJsons(response.body);
        notifyListeners();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  List<int> getQtdTipo() {
    qtdTipo.clear();
    int qtd = 0;

    for (var item in manifestacoes) {
      switch (item.tipo) {
        case 'DENÚNCIA':
          qtd = qtdTipo.elementAt(0);
          qtdTipo.insert(0, qtd++);
          break;
        case 'ELOGIO':
          qtd = qtdTipo.elementAt(1);
          qtdTipo.insert(1, qtd++);
          break;
        case 'DÚVIDA':
          qtd = qtdTipo.elementAt(2);
          qtdTipo.insert(2, qtd++);
          break;
        case 'SUGESTÃO':
          qtd = qtdTipo.elementAt(3);
          qtdTipo.insert(3, qtd++);
          break;

        default:
      }
    }

    return qtdTipo;
  }
}
