import 'package:ajuda_ubs/app/models/consulta_model.dart';
import 'package:ajuda_ubs/app/models/medico_model.dart';
import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:ajuda_ubs/app/views/agendamento/form_agendamento4_view.dart';
import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

// ignore: must_be_immutable
class FormAgendamento3View extends StatefulWidget {
  Consulta consulta;
  Medico medico;
  DateTime data;

  FormAgendamento3View(
      {Key? key,
      required this.consulta,
      required this.medico,
      required this.data})
      : super(key: key);
  @override
  _FormAgendamento3ViewState createState() => _FormAgendamento3ViewState();
}

class _FormAgendamento3ViewState extends State<FormAgendamento3View> {
  late TextEditingController controllerData;

  @override
  void initState() {
    super.initState();
    controllerData = TextEditingController();
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
                                    animationDuration: 2,
                                    onGetText: (double value) {
                                      return const Text('3 de 4');
                                    },
                                  )),
                              const SizedBox(width: 20),
                              SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text("Agendamento de Consulta",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            //color: Color.fromARGB(255, 138, 161, 212),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                    Text("Segunda etapa",
                                        textAlign: TextAlign.left),
                                  ],
                                ),
                              ),
                            ]),
                        const SizedBox(height: 15),
                        const Text(
                          'Descreva o objetivo do agendamento',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(138, 162, 212, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 21),
                        ),
                        const SizedBox(height: 15),
                        ComponentsUtils.TextFieldEdit(
                            context,
                            2,
                            'Descrição',
                            TextInputType.text,
                            const Icon(Icons.description),
                            () {},
                            controllerData, (email) {
                          controllerData.text = email;
                        }, true),
                        const SizedBox(height: 15),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              onPrimary: Colors.white,
                              primary: const Color.fromARGB(255, 125, 149, 202),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 12),
                            ),
                            onPressed: () {
                              widget.consulta.descricao = controllerData.text;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => FormAgendamento4View(
                                            consulta: widget.consulta,
                                            medico: widget.medico,
                                            data: widget.data,
                                          )));
                            },
                            child: const Icon(Icons.arrow_forward)),
                        const SizedBox(height: 15)
                      ],
                    )))));
  }
}
