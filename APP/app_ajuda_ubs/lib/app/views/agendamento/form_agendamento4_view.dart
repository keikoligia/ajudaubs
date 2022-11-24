import 'package:ajuda_ubs/app/models/consulta_model.dart';
import 'package:ajuda_ubs/app/models/medico_model.dart';
import 'package:ajuda_ubs/app/models/ubs_model.dart';
import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'form_agendamento5_view.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class FormAgendamento4View extends StatefulWidget {
  Consulta consulta;
  Medico medico;
  DateTime data;

  FormAgendamento4View(
      {Key? key,
      required this.consulta,
      required this.medico,
      required this.data})
      : super(key: key);

  @override
  _FormAgendamento4ViewState createState() => _FormAgendamento4ViewState();
}

class _FormAgendamento4ViewState extends State<FormAgendamento4View> {
  late UBS ubs;
  late bool carregou = false;
  Future getManifestacoes() async {
    try {
      var response = await http
          .get(Uri.parse('http://localhost:3000/ubs/${widget.consulta.idUbs}'));
      if (response.statusCode == 200) {
        ubs = UBS.fromJson(response.body);
        setState(() {
          carregou = true;
        });
      }
    } catch (e) {
      //debugPrint(e.toString());
    }
  }

  Future postConsulta() async {
    try {
      var response = await http.post(
          Uri.parse('http://localhost:3000/consulta'),
          body: widget.consulta.toMap());
      if (response.statusCode == 200) {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => const FormAgendamento5View()));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
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
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
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
                                          animationDuration: 3,
                                          onGetText: (double value) {
                                            return const Text('4 de 4');
                                          },
                                        )),
                                    const SizedBox(width: 20),
                                    SizedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text("Agendamento de Consulta",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  //color: Color.fromARGB(255, 138, 161, 212),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20)),
                                          Text("Última etapa",
                                              textAlign: TextAlign.left),
                                        ],
                                      ),
                                    ),
                                  ]),
                              const SizedBox(height: 15),
                              const Text(
                                'Confira os dados do agendamento',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(138, 162, 212, 1),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 21),
                              ),
                              const SizedBox(height: 30),
                              ComponentsUtils.TextValueIcon(
                                  context,
                                  const Icon(Icons.home_work),
                                  (carregou) ? ubs.nome : '',
                                  'UBS'),
                              const Divider(
                                  height: 30,
                                  endIndent: 20,
                                  indent: 20,
                                  thickness: 0.5,
                                  color: Color.fromRGBO(138, 162, 212, 1)),
                              ComponentsUtils.TextValueIcon(
                                  context,
                                  const Icon(Icons.medical_services),
                                  widget.consulta.area,
                                  'Especialidade'),
                              const Divider(
                                  height: 30,
                                  endIndent: 20,
                                  indent: 20,
                                  thickness: 0.5,
                                  color: Color.fromRGBO(138, 162, 212, 1)),
                              ComponentsUtils.TextValueIcon(
                                  context,
                                  const Icon(Icons.date_range),
                                  ComponentsUtils.toStringDate(
                                      widget.data, true),
                                  'Data e Hora'),
                              const Divider(
                                  height: 30,
                                  endIndent: 20,
                                  indent: 20,
                                  thickness: 0.5,
                                  color: Color.fromRGBO(138, 162, 212, 1)),
                              ComponentsUtils.TextValueIcon(
                                  context,
                                  const Icon(Icons.local_hospital),
                                  'Dra. ' + widget.medico.medico.nome,
                                  'Médico(a)'),
                              const Divider(
                                  height: 30,
                                  endIndent: 20,
                                  indent: 20,
                                  thickness: 0.5,
                                  color: Color.fromRGBO(138, 162, 212, 1)),
                              ComponentsUtils.TextValueIcon(
                                  context,
                                  const Icon(Icons.tips_and_updates),
                                  'Chegue com uma antecedencia de 10 minutos.',
                                  'Orientações'),
                              const Divider(
                                  height: 30,
                                  endIndent: 20,
                                  indent: 20,
                                  thickness: 0.5,
                                  color: Color.fromRGBO(138, 162, 212, 1)),
                              ComponentsUtils.TextValueIcon(
                                  context,
                                  const Icon(Icons.description),
                                  widget.consulta.descricao,
                                  'Descrição'),
                              const SizedBox(height: 15),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                    onPrimary: Colors.white,
                                    primary: const Color.fromARGB(
                                        255, 125, 149, 202),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 32, vertical: 12),
                                  ),
                                  onPressed: () {
                                    postConsulta();
                                  },
                                  child: const Icon(Icons.arrow_forward)),
                              const SizedBox(height: 15)
                            ],
                          )
                        ])))));
  }
}
