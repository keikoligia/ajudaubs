// ignore_for_file: file_names

import 'package:ajuda_ubs/app/views/graficos/chartsBar_view.dart';
import 'package:ajuda_ubs/app/views/graficos/chartsLine_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart' show HtmlWidget, WidgetFactory;
import 'package:fwfh_webview/fwfh_webview.dart';

class AreaUbsView extends StatefulWidget {
  const AreaUbsView({Key? key}) : super(key: key);

  @override
  _AreaUbsViewState createState() => _AreaUbsViewState();
}

class _AreaUbsViewState extends State<AreaUbsView> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                title: const TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.pie_chart)),
                    Tab(icon: Icon(Icons.bar_chart)),
                    Tab(icon: Icon(Icons.stacked_line_chart)),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  HtmlWidget(
                    '<iframe src="https://www.google.com/maps/d/embed?mid=11U2n30QS_KOEHqSsx58CbI-l7Vk&ehbc=2E312F" width="640" height="480"></iframe>',
                    factoryBuilder: () => MyWidgetFactory(),
                  ),
                  const BarChartView(),
                  const LineChartView(),
                ],
              ),
            )));
  }
}

class MyWidgetFactory extends WidgetFactory with WebViewFactory {}
