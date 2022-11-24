import 'package:ajuda_ubs/app/views/graficos/rankingUbs_view.dart';
import 'package:flutter/material.dart';
import 'chartsBar_view.dart';
import 'chartsLine_view.dart';
import 'chartsPie_view.dart';

class GraficosView extends StatefulWidget {
  const GraficosView({Key? key}) : super(key: key);

  @override
  _GraficosViewState createState() => _GraficosViewState();
}

class _GraficosViewState extends State<GraficosView> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                title: const TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.pie_chart)),
                    Tab(icon: Icon(Icons.bar_chart)),
                    Tab(icon: Icon(Icons.stacked_line_chart)),
                    Tab(icon: Icon(Icons.chat_sharp)),
                  ],
                ),
              ),
              body: const TabBarView(
                children: [
                  PieChartView(),
                  BarChartView(),
                  LineChartView(),
                  RankingUbsView(),
                ],
              ),
            )));
  }
}
