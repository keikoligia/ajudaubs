// ignore_for_file: non_constant_identifier_names
import 'package:ajuda_ubs/app/controllers/manifestacao_controller.dart';
import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:table_calendar/table_calendar.dart';

// ignore: must_be_immutable
class FormManifestacao3View extends StatefulWidget {
  ManifestacaoController manifestacaoController;

  FormManifestacao3View({Key? key, required this.manifestacaoController})
      : super(key: key);

  @override
  _FormManifestacao3ViewState createState() => _FormManifestacao3ViewState();
}

class _FormManifestacao3ViewState extends State<FormManifestacao3View> {
  late final TextEditingController controllerNome;
  late final TextEditingController controllerFuncao;

  @override
  void initState() {
    super.initState();
    controllerNome = TextEditingController();
    controllerFuncao = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
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
                                return const Text('3 de 4');
                              },
                            )),
                        const SizedBox(width: 20),
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text("Manifestação Pública",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      //color: Color.fromARGB(255, 138, 161, 212),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              Text(
                                  "Terceira etapa - ${widget.manifestacaoController.manifestacao.tipo}",
                                  textAlign: TextAlign.left),
                            ],
                          ),
                        ),
                      ]),
                  const SizedBox(height: 20),
                  const Text(
                    'Quando foi o ocorrido?',
                    style: TextStyle(
                        color: Color.fromARGB(255, 138, 161, 212),
                        fontWeight: FontWeight.bold,
                        fontSize: 19),
                  ),
                  TableCalendar(
                    locale: Localizations.localeOf(context).languageCode,
                    firstDay:
                        DateTime.now().subtract(const Duration(days: 365)),
                    lastDay: DateTime.now(),
                    focusedDay: widget.manifestacaoController.focusedDay,
                    selectedDayPredicate: (day) {
                      return isSameDay(
                          widget.manifestacaoController.selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        debugPrint('SELECIONOU');
                        widget.manifestacaoController.selectedDay = selectedDay;
                        widget.manifestacaoController.focusedDay = focusedDay;

                        widget.manifestacaoController.data = selectedDay;
                        widget.manifestacaoController.isEscolheu = true;

                        setState(() {});
                      });
                    },
                    onPageChanged: (focusedDay) {
                      focusedDay = focusedDay;
                    },
                    enabledDayPredicate: (date) {
                      return (date.weekday != DateTime.sunday &&
                          date.weekday != DateTime.saturday);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ComponentsUtils.TextValueIcon(
                      context,
                      const Icon(Icons.medication),
                      widget.manifestacaoController.getDateDenuncia(context),
                      'Data do ocorrido'),

                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        onPrimary: Colors.white,
                        primary: const Color.fromARGB(255, 98, 127, 189),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 12),
                      ),
                      onPressed: () async {
                        //debugPrint('debug: ${widget.manifestacao}');
                        widget.manifestacaoController.verificacaoMan3(context);
                      },
                      child: const Icon(Icons.arrow_forward)),

                  //(file == null)? Container() : Image.file(File(file!.path.toString()), width: 100, height: 100)
                ],
              ),
            ))));
  }
}
