// ignore_for_file: file_names

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartView extends StatefulWidget {
  const BarChartView({Key? key}) : super(key: key);

  static const shadowColor = Color(0xFFCCCCCC);
  static const dataList = [
    _BarData(Color(0xFFecb206), 18, 18),
    _BarData(Color(0xFFa8bd1a), 17, 8),
    _BarData(Color(0xFF17987b), 10, 15),
    _BarData(Color(0xFFb87d46), 2.5, 5),
  ];

  @override
  State<BarChartView> createState() => _BarChartViewState();
}

class _BarChartViewState extends State<BarChartView> {
  BarChartGroupData generateBarGroup(
    int x,
    Color color,
    double value,
    double shadowValue,
  ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: color,
          width: 6,
        ),
        BarChartRodData(
          toY: shadowValue,
          color: BarChartView.shadowColor,
          width: 6,
        ),
        BarChartRodData(
          toY: shadowValue,
          color: BarChartView.shadowColor,
          width: 6,
        ),
        BarChartRodData(
          toY: shadowValue,
          color: BarChartView.shadowColor,
          width: 6,
        ),
        BarChartRodData(
          toY: shadowValue,
          color: BarChartView.shadowColor,
          width: 6,
        ),
      ],
      showingTooltipIndicators: touchedGroupIndex == x ? [0] : [],
    );
  }

  int touchedGroupIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
                child: Card(
              color: Colors.white,
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.3,
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceBetween,
                          borderData: FlBorderData(
                            show: true,
                            border: const Border.symmetric(
                              horizontal: BorderSide(
                                color: Color(0xFFececec),
                              ),
                            ),
                          ),
                          titlesData: FlTitlesData(
                            show: true,
                            leftTitles: AxisTitles(
                              drawBehindEverything: true,
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 30,
                                getTitlesWidget: (value, meta) {
                                  return Text(
                                    value.toInt().toString(),
                                    style: const TextStyle(
                                      color: Color(0xFF606060),
                                    ),
                                    textAlign: TextAlign.left,
                                  );
                                },
                              ),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 36,
                              ),
                            ),
                            rightTitles: AxisTitles(),
                            topTitles: AxisTitles(),
                          ),
                          gridData: FlGridData(
                            show: true,
                            drawVerticalLine: false,
                            getDrawingHorizontalLine: (value) => FlLine(
                              color: const Color(0xFFececec),
                              dashArray: null,
                              strokeWidth: 1,
                            ),
                          ),
                          barGroups:
                              BarChartView.dataList.asMap().entries.map((e) {
                            final index = e.key;
                            final data = e.value;
                            return generateBarGroup(index, data.color,
                                data.value, data.shadowValue);
                          }).toList(),
                          maxY: 20,
                          barTouchData: BarTouchData(
                            enabled: true,
                            handleBuiltInTouches: false,
                            touchTooltipData: BarTouchTooltipData(
                                tooltipBgColor: Colors.transparent,
                                tooltipMargin: 0,
                                getTooltipItem: (
                                  BarChartGroupData group,
                                  int groupIndex,
                                  BarChartRodData rod,
                                  int rodIndex,
                                ) {
                                  return BarTooltipItem(
                                    rod.toY.toString(),
                                    TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: rod.color!,
                                        fontSize: 18,
                                        shadows: const [
                                          Shadow(
                                            color: Colors.black26,
                                            blurRadius: 12,
                                          )
                                        ]),
                                  );
                                }),
                            touchCallback: (event, response) {
                              if (event.isInterestedForInteractions &&
                                  response != null &&
                                  response.spot != null) {
                                setState(() {
                                  touchedGroupIndex =
                                      response.spot!.touchedBarGroupIndex;
                                });
                              } else {
                                setState(() {
                                  touchedGroupIndex = -1;
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ))));
  }
}

class _BarData {
  final Color color;
  final double value;
  final double shadowValue;

  const _BarData(this.color, this.value, this.shadowValue);
}
