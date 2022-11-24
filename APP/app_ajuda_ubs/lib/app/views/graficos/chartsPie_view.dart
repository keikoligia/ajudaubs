// ignore_for_file: file_names

import 'package:ajuda_ubs/app/models/graficos/chartManifestacao.dart';
import 'package:ajuda_ubs/app/models/manifestacao_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'indicator.dart';

class PieChartView extends StatefulWidget {
  const PieChartView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChartViewState();
}

class PieChartViewState extends State {
  int touchedIndex = -1;
  late ChartManifestacao chartMan;

  @override
  void initState() {
    getManifestacoes();
    super.initState();
  }

  late List<int> qtdTipo = [0, 0, 0, 0]; // Denuncia Elogio Duvida Sugestao
  late List<Manifestacao> manifestacoes = [];

  getManifestacoes() async {
    try {
      var response =
          await http.get(Uri.parse('http://localhost:3000/manifestacao'));
      if (response.statusCode == 200) {
        manifestacoes = Manifestacao.fromJsons(response.body);

        setState(() {});
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  bool carregou = false;
  int total = 0;

  List<int> getQtdTipo() {
    for (var item in manifestacoes) {
      switch (item.tipo) {
        case 'DENÚNCIA':
          qtdTipo[0] = (qtdTipo.elementAt(0)) + 1;
          break;
        case 'ELOGIO':
          qtdTipo[1] = (qtdTipo.elementAt(1)) + 1;
          break;
        case 'DÚVIDA':
          qtdTipo[2] = (qtdTipo.elementAt(2)) + 1;
          break;
        case 'SUGESTÃO':
          qtdTipo[3] = (qtdTipo.elementAt(3)) + 1;
          break;

        default:
      }
      total = manifestacoes.length;
      setState(() {
        carregou = true;
      });
    }

    return qtdTipo;
  }

  @override
  Widget build(BuildContext context) {
    if (!carregou) {
      getQtdTipo();
    }
    return AspectRatio(
      aspectRatio: 1.3,
      child: Container(
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
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 28,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Indicator(
                  color: const Color.fromARGB(255, 255, 0, 0),
                  text: 'Denúncia',
                  isSquare: false,
                  size: touchedIndex == 0 ? 18 : 16,
                  textColor: touchedIndex == 0 ? Colors.black : Colors.grey,
                ),
                Indicator(
                  color: const Color.fromARGB(255, 255, 174, 59),
                  text: 'Elogio',
                  isSquare: false,
                  size: touchedIndex == 1 ? 18 : 16,
                  textColor: touchedIndex == 1 ? Colors.black : Colors.grey,
                ),
                Indicator(
                  color: const Color(0xff845bef),
                  text: 'Dúvida',
                  isSquare: false,
                  size: touchedIndex == 2 ? 18 : 16,
                  textColor: touchedIndex == 2 ? Colors.black : Colors.grey,
                ),
                Indicator(
                  color: const Color.fromARGB(146, 9, 113, 187),
                  text: 'Sugestão',
                  isSquare: false,
                  size: touchedIndex == 3 ? 18 : 16,
                  textColor: touchedIndex == 3 ? Colors.black : Colors.grey,
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                      pieTouchData: PieTouchData(touchCallback:
                          (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      }),
                      startDegreeOffset: 180,
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 50,
                      sections: showingSections()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(
      4,
      (i) {
        final isTouched = i == touchedIndex;
        final opacity = isTouched ? 1.0 : 0.6;
        final fontSize = isTouched ? 25.0 : 16.0;
        final radius = isTouched ? 60.0 : 50.0;

        const colorDenuncia = Color.fromARGB(255, 255, 0, 0);
        const colorElogio = Color.fromARGB(255, 255, 174, 59);
        const colorDuvida = Color(0xff845bef);
        const colorSugestao = Color.fromARGB(146, 9, 113, 187);

        switch (i) {
          case 0:
            return PieChartSectionData(
              color: colorDenuncia.withOpacity(opacity),
              value: qtdTipo[0].toDouble(),
              title: (qtdTipo[0] * 100 / total).toStringAsFixed(2).toString() +
                  "%",
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? const BorderSide(color: colorDenuncia, width: 15)
                  : BorderSide(color: colorDenuncia.withOpacity(0)),
            );
          case 1:
            return PieChartSectionData(
              color: colorElogio.withOpacity(opacity),
              value: qtdTipo[1].toDouble(),
              title: (qtdTipo[1] * 100 / total).toStringAsFixed(2).toString() +
                  "%",
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? const BorderSide(color: colorElogio, width: 15)
                  : BorderSide(color: colorElogio.withOpacity(0)),
            );
          case 2:
            return PieChartSectionData(
              color: colorDuvida.withOpacity(opacity),
              value: qtdTipo[2].toDouble(),
              title: (qtdTipo[2] * 100 / total).toStringAsFixed(2).toString() +
                  "%",
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? const BorderSide(color: colorDuvida, width: 15)
                  : BorderSide(color: colorDuvida.withOpacity(0)),
            );
          case 3:
            return PieChartSectionData(
              color: colorSugestao.withOpacity(opacity),
              value: qtdTipo[3].toDouble(),
              title: (qtdTipo[3] * 100 / total).toStringAsFixed(2).toString() +
                  "%",
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? const BorderSide(color: colorSugestao, width: 15)
                  : BorderSide(color: colorSugestao.withOpacity(0)),
            );
          default:
            throw Error();
        }
      },
    );
  }
}
