import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:ajuda_ubs/app/controllers/cadastro_controller.dart';
import 'package:ajuda_ubs/app/models/endereco_model.dart';
import 'package:ajuda_ubs/app/models/paciente_model.dart';
import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class FormCadastro1View extends StatefulWidget {
  CadastroController? cadastroController;
  bool inicio;
  FormCadastro1View(
      {Key? key, required this.cadastroController, required this.inicio})
      : super(key: key);

  @override
  State<FormCadastro1View> createState() => _FormCadastro1ViewState();
}

class _FormCadastro1ViewState extends State<FormCadastro1View> {
  late DateTime dateTime = DateTime.now();
  late String nome = '';
  late String cns = '';
  late String dataNascimento = '';

  late Paciente paciente = Paciente.constructor1();
  late CadastroController cadastroController;
  late Endereco endereco = Endereco.constructor1();

  late TextEditingController controllerTelefone;
  late TextEditingController controllerEmail;
  late TextEditingController controllerNome;
  late TextEditingController controllerCns;
  late TextEditingController controllerData;
  late TextEditingController controllerCep;
  late TextEditingController controllerNum;
  late TextEditingController controllerComp;
  late TextEditingController controllerRua;
  late TextEditingController controllerBairro;
  late TextEditingController controllerSen2;
  late TextEditingController controllerSen1;

  @override
  void initState() {
    super.initState();
    controllerNome = TextEditingController();
    controllerCns = TextEditingController();
    controllerData = TextEditingController();

    controllerTelefone = TextEditingController();
    controllerEmail = TextEditingController();

    controllerCep = TextEditingController();
    controllerNum = TextEditingController();
    controllerComp = TextEditingController();
    controllerRua = TextEditingController();
    controllerBairro = TextEditingController();

    late List<String> dropOpcoes = ['UBS 1', 'UBS 2', 'UBS 3', 'UBS 4'];
    late ValueNotifier<String> dropValue = ValueNotifier('');

    controllerSen2 = TextEditingController();
    controllerSen1 = TextEditingController();

    cadastroController = CadastroController(
        paciente,
        endereco,
        controllerNome,
        controllerData,
        controllerCns,
        controllerTelefone,
        controllerEmail,
        controllerCep,
        controllerNum,
        controllerBairro,
        controllerRua,
        controllerComp,
        controllerSen2,
        controllerSen1,
        dropOpcoes,
        dropValue);

    cadastroController.loadingUBS();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
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
                                      Text("Cadastro para Pacientes",
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
                          const SizedBox(height: 60),
                          const Text(
                            'Boas-vindas ao AjudaUBS!',
                            style: TextStyle(
                                //color: Color.fromARGB(255, 79, 103, 155),
                                fontWeight: FontWeight.bold,
                                fontSize: 27),
                          ),
                          const SizedBox(height: 60),
                          const Text(
                            'Fale um pouco sobre você   :)',
                            style: TextStyle(
                                color: Color.fromRGBO(138, 162, 212, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          const SizedBox(height: 15),
                          ComponentsUtils.TextFieldEdit(
                              context,
                              1,
                              'Nome completo',
                              TextInputType.text,
                              const Icon(Icons.person),
                              () {},
                              (!widget.inicio)
                                  ? widget.cadastroController!.controllerNome
                                  : controllerNome, (email) {
                            nome = email;
                          }, true),
                          const SizedBox(height: 15),
                          ComponentsUtils.TextFieldEdit(
                              context,
                              1,
                              'Data de nascimento',
                              TextInputType.datetime,
                              const Icon(Icons.calendar_today), () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(DateTime.now().year -
                                    120), //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime.now());

                            if (pickedDate != null) {
                              setState(() {
                                if (!widget.inicio) {
                                  widget.cadastroController!.dataNascimento =
                                      DateFormat('dd/MM/yyyy')
                                          .format(pickedDate);

                                  cns = widget
                                      .cadastroController!.controllerData.text;
                                } else {
                                  controllerData.text = DateFormat('dd/MM/yyyy')
                                      .format(pickedDate);
                                  cns = controllerData.text;

                                  dataNascimento = DateFormat('yyyy-MM-dd')
                                      .format(pickedDate);
                                }
                              }); //formatted date output using intl package =>  2021-03-16
                            }
                          },
                              (!widget.inicio)
                                  ? widget.cadastroController!.controllerData
                                  : controllerData,
                              (email) {},
                              true),
                          const SizedBox(height: 15),
                          ComponentsUtils.TextFieldEdit(
                              context,
                              1,
                              'Cartão Nacional de Saúde - CNS',
                              TextInputType.number,
                              const Icon(Icons.add_card),
                              () {},
                              (!widget.inicio)
                                  ? widget.cadastroController!.controllerCns
                                  : controllerCns,
                              (email) {},
                              true),
                          const SizedBox(height: 15),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                onPrimary: Colors.white,
                                primary:
                                    const Color.fromARGB(255, 125, 149, 202),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 12),
                              ),
                              onPressed: () {
                                if (!widget.inicio) {
                                  widget.cadastroController!.verificarCad1(
                                      context,
                                      widget
                                          .cadastroController!.dataNascimento);
                                } else {
                                  if (dataNascimento == "" &&
                                      controllerData.text != '') {
                                    String date = controllerData.text;
                                    dataNascimento =
                                        '${date.substring(6)}-${date.substring(3, 5)}-${date.substring(0, 2)}';
                                  }
                                  cadastroController.dataNascimento =
                                      dataNascimento;

                                  cadastroController.verificarCad1(
                                      context, dataNascimento);
                                }
                              },
                              child: const Icon(Icons.arrow_forward)),
                          const SizedBox(height: 15)
                        ],
                      ),
                    )))));
  }
}

String formatDate(DateTime dateTime, List list) {
  String result = "";

  return result;
}
