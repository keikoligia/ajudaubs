import 'package:ajuda_ubs/app/models/cargoarea_model.dart';
import 'package:ajuda_ubs/app/models/consulta_model.dart';
import 'package:ajuda_ubs/app/models/funcionario_model.dart';
import 'package:ajuda_ubs/app/models/horario_model.dart';
import 'package:ajuda_ubs/app/models/medico_model.dart';
import 'package:ajuda_ubs/app/utils/app_controller.dart';
import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;

import 'form_agendamento3_view.dart';

// ignore: must_be_immutable
class FormAgendamento2View extends StatefulWidget {
  Consulta agendamentoController;
  CargoArea nomeCargo;

  FormAgendamento2View(
      {Key? key, required this.agendamentoController, required this.nomeCargo})
      : super(key: key);

  @override
  State<FormAgendamento2View> createState() => _FormAgendamento2ViewState();
}

class _FormAgendamento2ViewState extends State<FormAgendamento2View> {
  late DateTime _selectedDay = DateTime.now();
  late DateTime _focusedDay = DateTime.now();
  late DateTime data = DateTime.now();
  late List<Medico> listMedico = [];
  late List<Funcionario> listFuncionario = [];
  late List<Funcionario> listFuncionario2 = [];
  late List<Horario> listHorario = [];
  late int qtdMedicoDia = 1;
  late int indexMedico = 1;
  late Medico? medico;
  late List<List<Medico>> matrix = [];
  late List<Consulta> consultas = [];
  late List<List<DateTime>> medicosHora = [];
  late List<Medico> medicosDisp = [];
  var diasSemana = {
    1: 'Segunda-Feira',
    2: 'Terça-Feira',
    3: 'Quarta-Feira',
    4: 'Quinta-Feira',
    5: 'Sexta-Feira',
    6: 'Sábado',
    7: 'Domingo'
  };

  Future getManifestacoes() async {
    try {
      var response =
          await http.get(Uri.parse('http://localhost:3000/funcionario'));
      if (response.statusCode == 200) {
        listFuncionario = Funcionario.fromJsons(response.body);

        for (var item in listFuncionario) {
          if (item.crm.isNotEmpty && item.cargo == widget.nomeCargo.nomeCargo) {
            try {
              var response = await http
                  .get(Uri.parse('http://localhost:3000/horario/${item.cpf}'));
              if (response.statusCode == 200) {
                listHorario = Horario.fromJsons(response.body);

                for (Horario horaMedico in listHorario) {
                  late int diaCerto = 0;

                  diasSemana.forEach((key, value) {
                    if (horaMedico.dia == value) {
                      diaCerto = key;
                      return;
                    }
                  });

                  medico = Medico(
                      diaCerto,
                      horaMedico.inicioHorario,
                      horaMedico.fimHorario,
                      horaMedico.incioAlmoco,
                      horaMedico.fimAlmoco,
                      item);

                  listMedico.add(medico!);
                }
                List<Medico> list =
                    listMedico.map((e) => e.copyWith()).toList();
                if (list.isNotEmpty) {
                  matrix.add(list);
                }
                listMedico.clear();
              }
            } catch (e) {
              //debugPrint(e.toString());
            }
          }
        }
      }
      setState(() {});
    } catch (e) {
      //debugPrint(e.toString());
    }
  }

  TextStyle styleFont = const TextStyle(
      color: Color.fromARGB(255, 125, 149, 202),
      fontWeight: FontWeight.bold,
      fontSize: 15);

  Widget textMedico(Funcionario medico) =>
      Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Text('Dr(a).' + medico.nome,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: styleFont),
        Text('CRM: ' + medico.crm, style: styleFont),
        Text('UBS: ' + medico.idUbs, style: styleFont),
        const SizedBox(
          height: 10,
        )
      ]);

  Future mensagem(List<Medico> medios) async {
    String dataConsulta = ComponentsUtils.toStringDate(data, false);
    medicosDisp.clear();
    medicosHora.clear();
    for (int index = 0; index < matrix.length; index++) {
      medico = null;
      for (Medico medic in matrix[index]) {
        if (medic.dia == data.weekday) {
          medicosDisp.add(medic);
          try {
            String url =
                'http://localhost:3000/consulta/2040670/${medic.medico.crm}/$dataConsulta';
            var response = await http.get(Uri.parse(url));
            if (response.statusCode == 200) {
              consultas = Consulta.fromJsons(response.body);

              medicosHora.add(medic.getHorarios(consultas));
            } else {
              consultas = [];
              medicosHora.add(medic.getHorarios(consultas));
            }
          } catch (e) {
            debugPrint(e.toString() + "AQUI");
          }
          break;
        }
      }
    }

    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Médicos e horários disponíveis para agendamento',
              textAlign: TextAlign.center,
              style: TextStyle(
                  // color: Color.fromARGB(255, 125, 149, 202),
                  fontWeight: FontWeight.bold,
                  fontSize: 17)),
          actions: <Widget>[
            TextButton(
              child: const Text('Retornar para o calendário'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          content: SingleChildScrollView(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height / 1.3,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: medicosDisp.length,
                            itemBuilder: (context, index) {
                              // Pegar horario dos médicos do dia clicado

                              return ListBody(children: <Widget>[
                                const SizedBox(
                                  height: 20,
                                ),
                                ListBody(children: <Widget>[
                                  textMedico(medicosDisp[index].medico),
                                  SizedBox(
                                    height: 200,
                                    width: MediaQuery.of(context).size.width,
                                    child: GridView.builder(
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                mainAxisSpacing: 5,
                                                childAspectRatio: 3,
                                                crossAxisSpacing: 5),
                                        itemCount: medicosHora[index].length,
                                        itemBuilder:
                                            (BuildContext context, int index2) {
                                          return InkWell(
                                              onTap: () {
                                                setState(() {
                                                  data = DateTime(
                                                      data.year,
                                                      data.month,
                                                      data.day,
                                                      medicosHora[index][index2]
                                                          .hour,
                                                      medicosHora[index][index2]
                                                          .minute);
                                                });

                                                medico = medicosDisp[index];

                                                int bloco = medicosDisp[index]
                                                    .horarios
                                                    .indexWhere((element) {
                                                  return element.hour ==
                                                          data.hour &&
                                                      element.minute ==
                                                          data.minute;
                                                });
                                                widget.agendamentoController
                                                    .bloco = bloco;
                                                widget.agendamentoController
                                                        .idMedico =
                                                    medicosDisp[index]
                                                        .medico
                                                        .crm;
                                                widget.agendamentoController
                                                        .idUbs =
                                                    medicosDisp[index]
                                                        .medico
                                                        .idUbs;
                                                indexMedico = index;
                                                Navigator.of(context).pop();
                                              },
                                              child: Container(
                                                height: 50,
                                                color: const Color.fromARGB(
                                                    255, 171, 192, 238),
                                                child: Center(
                                                    child: Text(
                                                        '${ComponentsUtils.twoDigits(medicosHora[index][index2].hour)}'
                                                        ':${ComponentsUtils.twoDigits(medicosHora[index][index2].minute)}')),
                                              ));
                                        }),
                                  )
                                ])
                              ]);
                            }))
                  ]))),
        );
      },
    );
  }

  late TextEditingController controllerData;

  @override
  void initState() {
    super.initState();
    controllerData = TextEditingController();
    getManifestacoes();
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
                child:SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment,
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
                                return const Text('2 de 4');
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
                              Text("Segunda etapa", textAlign: TextAlign.left),
                            ],
                          ),
                        ),
                      ]),
                  const SizedBox(height: 15),
                  const Text(
                    'Datas disponíveis para agendamento',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(138, 162, 212, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 21),
                  ),
                  //const SizedBox(height: 10),
                  TableCalendar(
                    locale: Localizations.localeOf(context).languageCode,
                    firstDay: DateTime.now(),
                    lastDay: DateTime.now().add(const Duration(days: 90)),
                    enabledDayPredicate: (date) {
                      return (date.weekday != DateTime.sunday &&
                          date.weekday != DateTime.saturday &&
                          date != DateTime(2022, 11, 10));
                    },
                    focusedDay: _focusedDay,
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;

                        data = selectedDay;
                      });
                      mensagem(listMedico);
                    },
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                  ),
                  const SizedBox(height: 15),
                  ComponentsUtils.TextValueIcon(
                      context,
                      const Icon(Icons.medication),
                      ComponentsUtils.toStringDate(data, true),
                      'Data e Hora'),
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
                        widget.agendamentoController.idConsulta = 0;
                        widget.agendamentoController.descricao = "";
                        widget.agendamentoController.dataMarcada =
                            ComponentsUtils.toStringDate(data, false);
                        widget.agendamentoController.idPaciente =
                            AppController.instance.paciente.cns;
                        widget.agendamentoController.idUbs =
                            AppController.instance.paciente.idUbs;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => FormAgendamento3View(
                                    consulta: widget.agendamentoController,
                                    medico: medico!, data: data)));
                      },
                      child: const Icon(Icons.arrow_forward)),
                  const SizedBox(height: 15)
                ],
              ),
            ))));
  }
}
