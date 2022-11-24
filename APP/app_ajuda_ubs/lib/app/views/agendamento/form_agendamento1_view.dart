import 'package:ajuda_ubs/app/models/cargoarea_model.dart';
import 'package:ajuda_ubs/app/models/consulta_model.dart';
import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import 'form_agendamento2_view.dart';

class FormAgendamento1View extends StatefulWidget {
  const FormAgendamento1View({Key? key}) : super(key: key);

  @override
  State<FormAgendamento1View> createState() => _FormAgendamento1ViewState();
}

class _FormAgendamento1ViewState extends State<FormAgendamento1View> {
  late String option = '';
  late List<CargoArea> cargos = [];

  late Consulta consulta = Consulta.construtor();

  void getManifestacoes() async {
    try {
      var response =
          await http.get(Uri.parse('http://localhost:3000/cargoarea'));
      if (response.statusCode == 200) {
        cargos = CargoArea.fromJsons(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    setState(() {});
  }

  @override
  void initState() {
    getManifestacoes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: SimpleCircularProgressBar(
                                      progressStrokeWidth: 5,
                                      backStrokeWidth: 5,
                                      progressColors: const [
                                        Color.fromARGB(255, 138, 161, 212)
                                      ],
                                      mergeMode: true,
                                      animationDuration: 1,
                                      onGetText: (double value) {
                                        return const Text('1 de 4');
                                      },
                                    )),
                                const SizedBox(width: 20),
                                SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text("Agendamento de Consulta",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              //color: Color.fromARGB(255, 138, 161, 212),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                      Text("Primeira etapa",
                                          textAlign: TextAlign.left),
                                    ],
                                  ),
                                ),
                              ]),
                          const SizedBox(height: 20),
                          const Text(
                            'Qual é a especialidade médica?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(138, 162, 212, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                              height: MediaQuery.of(context).size.height - 100,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: cargos.length,
                                  itemBuilder: (context, index) {
                                    final file = cargos[index];
                                    return Column(
                                      children: [
                                        ComponentsUtils.CardOption(
                                            context,
                                            const Color.fromARGB(
                                                255, 138, 161, 212),
                                            file.nomeArea,
                                            file.nomeCargo,
                                            file.descricaoArea,
                                            'MARCAR',
                                            Icons.error_outline, () {
                                          consulta.area = file.nomeCargo;
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      FormAgendamento2View(
                                                          agendamentoController:
                                                              consulta,
                                                          nomeCargo: file)));
                                        }),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    );
                                  })),
                        ])))));
  }
}
