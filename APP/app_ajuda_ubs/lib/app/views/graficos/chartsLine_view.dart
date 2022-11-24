import 'package:ajuda_ubs/app/models/manifestacao_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class LineChartView extends StatefulWidget {
  const LineChartView({Key? key}) : super(key: key);

  @override
  _LineChartViewState createState() => _LineChartViewState();
}

class _LineChartViewState extends State<LineChartView> {
  Color cores = Color.fromRGBO(138, 162, 212, 1);
  List<Map<String, dynamic>> historico = [];
  List<FlSpot> dadosDenuncia = [];
  List<FlSpot> dadosElogio = [];
  List<FlSpot> dadosDuvida = [];
  List<FlSpot> dadosSugestao = [];
  List<List<int>> dadosCompletos = [
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ];
  List<Manifestacao> dadosManifestacao = [];
  double maxX = 0;
  double maxY = 0;
  double minY = 0;
  ValueNotifier<bool> loaded = ValueNotifier(false);
  var meses = {
    0: 'Jan',
    1: 'Fev',
    2: 'Mar',
    3: 'Abr',
    4: 'Mai',
    5: 'Jun',
    6: 'Jul',
    7: 'Ago',
    8: 'Set',
    9: 'Out',
    10: 'Nov',
    11: 'Dez'
  };
  int mes = 0;
  late List<int> qtdTipo = [0, 0, 0, 0]; // Denuncia Elogio Duvida Sugestao
  late List<Manifestacao> manifestacoes = [];
  bool carregou = false;
  int total = 0;
  List<bool> isAddTipo = [true, false, false, false];

  @override
  void initState() {
    getManifestacoes();
    super.initState();
  }

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

  addManTipo(var item, int tipo) {
    DateTime data =
        DateTime(2022, int.parse(item.dataManifestacao.substring(3, 5)));

    switch (data.month) {
      case 1:
        dadosCompletos[tipo][0]++;
        break;
      case 2:
        dadosCompletos[tipo][1]++;

        break;
      case 3:
        dadosCompletos[tipo][2]++;

        break;
      case 4:
        dadosCompletos[tipo][3]++;

        break;
      case 5:
        dadosCompletos[tipo][4]++;

        break;
      case 6:
        dadosCompletos[tipo][5]++;

        break;
      case 7:
        dadosCompletos[tipo][6]++;

        break;
      case 8:
        dadosCompletos[tipo][7]++;

        break;
      case 9:
        dadosCompletos[tipo][8]++;

        break;
      case 10:
        dadosCompletos[tipo][9]++;

        break;
      case 11:
        dadosCompletos[tipo][10]++;

        break;
      case 12:
        dadosCompletos[tipo][11]++;

        break;
    }
  }

  setDados() async {
    //'25/10/2022'
    loaded.value = false;
    if (manifestacoes.isNotEmpty) {
      for (var item in manifestacoes) {
        switch (item.tipo) {
          case 'DENÚNCIA':
            dadosManifestacao.add(item);
            addManTipo(item, 0);
            break;
          case 'ELOGIO':
            dadosManifestacao.add(item);
            addManTipo(item, 1);

            break;
          case 'DÚVIDA':
            dadosManifestacao.add(item);
            addManTipo(item, 2);

            break;
          case 'SUGESTÃO':
            dadosManifestacao.add(item);
            addManTipo(item, 3);

            break;

          default:
        }
        total = manifestacoes.length;
        setState(() {
          carregou = true;
        });
      }

      for (var listMan in dadosCompletos) {
        for (var item in listMan) {
          double man = item.toDouble();
          maxY = man > maxY ? man : maxY;
          minY = man < minY ? man : minY;
        }
      }

      for (int i = 0; i < 12; i++) {
        dadosDenuncia.add(FlSpot(
          i.toDouble(),
          dadosCompletos[0][i].toDouble(),
        ));
        dadosElogio.add(FlSpot(
          i.toDouble(),
          dadosCompletos[1][i].toDouble(),
        ));
        dadosDuvida.add(FlSpot(
          i.toDouble(),
          dadosCompletos[2][i].toDouble(),
        ));
        dadosSugestao.add(FlSpot(
          i.toDouble(),
          dadosCompletos[3][i].toDouble(),
        ));
      }
      loaded.value = true;
    }
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff75729e),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );

    return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 5,
        child: RotationTransition(
          turns: AlwaysStoppedAnimation(45 / 360),
          child: Text(meses[value.toInt()]!,
              style: style, textAlign: TextAlign.center),
        ));
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff72719b),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );

    Widget text = Text(value.toString(), style: style);

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 5,
      child: text,
    );
  }

  List<Color> coresTipo = [
    Colors.red[900]!,
    Colors.green[900]!,
    Colors.yellow[800]!,
    Colors.blue[900]!,
  ];

  LineChartData getChartData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        horizontalInterval: 1,
        verticalInterval: 1,
      ),
      borderData: FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: Color(0xff4e4965), width: 2),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      ),
      titlesData: FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            getTitlesWidget: bottomTitleWidgets,
            showTitles: true,
            interval: 1,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 32,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
          ),
        ),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: maxY,
      lineBarsData: [
        (isAddTipo[0])
            ? LineChartBarData(
                isCurved: true,
                curveSmoothness: 0,
                color: coresTipo[0],
                barWidth: 2,
                isStrokeCapRound: true,
                dotData: FlDotData(show: true),
                belowBarData: BarAreaData(show: false),
                spots: dadosDenuncia,
              )
            : LineChartBarData(),
        (isAddTipo[1])
            ? LineChartBarData(
                spots: dadosElogio,
                isCurved: true,
                curveSmoothness: 0,
                barWidth: 2,
                color: coresTipo[1],
                dotData: FlDotData(show: true),
                belowBarData: BarAreaData(show: false),
              )
            : LineChartBarData(),
        (isAddTipo[2])
            ? LineChartBarData(
                spots: dadosDuvida,
                isCurved: true,
                curveSmoothness: 0,
                color: coresTipo[2],
                barWidth: 2,
                dotData: FlDotData(show: true),
                belowBarData: BarAreaData(show: false),
              )
            : LineChartBarData(),
        (isAddTipo[3])
            ? LineChartBarData(
                spots: dadosSugestao,
                isCurved: true,
                curveSmoothness: 0,
                barWidth: 2,
                color: coresTipo[3],
                dotData: FlDotData(show: true),
                belowBarData: BarAreaData(show: false),
              )
            : LineChartBarData(),
      ],
      lineTouchData: LineTouchData(
        getTouchedSpotIndicator:
            (LineChartBarData barData, List<int> spotIndexes) {
          return spotIndexes.map((spotIndex) {
            return TouchedSpotIndicatorData(
                FlLine(color: Colors.transparent, strokeWidth: 4),
                FlDotData(show: false));
          }).toList();
        },
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: const Color.fromARGB(255, 0, 0, 0),
          getTooltipItems: (data) {
            final man = data.last;
            String categoria = "";
            return data.map((item) {
              print(item.bar.color!.value.toString() + "ERRO");
              switch (item.bar.color!.value) {
                case 4279060385:
                  categoria = "SUGESTÕES";
                  break;
                case 4294551589:
                  categoria = "DÚVIDAS";

                  break;
                case 4290190364:
                  categoria = "DENÚNCIAS";

                  break;
                case 4279983648:
                  categoria = "ELOGIOS";
                  break;
              }

              return LineTooltipItem(
                item.y.toString() + " " + categoria,
                const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  (man == item)
                      ? TextSpan(
                          text: '\n ${meses[item.spotIndex]}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withOpacity(.5),
                          ),
                        )
                      : const TextSpan(),
                ],
              );
            }).toList();
          },
        ),
      ),
    );
  }

  chartButton(int tipo, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: OutlinedButton(
        onPressed: () => setState(() => isAddTipo[tipo] = !isAddTipo[tipo]),
        child: (isAddTipo[tipo])
            ? Text(label, style: TextStyle(color: coresTipo[tipo]))
            : Text(label),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!carregou) {
      setDados();
    }

    return Container(
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
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    chartButton(0, 'DENÚNCIA'),
                    chartButton(1, 'ELOGIO'),
                    chartButton(2, 'DÚVIDA'),
                    chartButton(3, 'SUGESTÃO'),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text('Manifestações por mês',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(138, 162, 212, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 25)),
                const SizedBox(
                  height: 25,
                ),
                Expanded(
                  child: ValueListenableBuilder(
                    valueListenable: loaded,
                    builder: (context, bool isLoaded, _) {
                      return (isLoaded)
                          ? LineChart(
                              getChartData(),
                            )
                          : Center(
                              child: CircularProgressIndicator(),
                            );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            )));
  }
}
