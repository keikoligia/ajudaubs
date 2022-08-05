import 'package:ajuda_ubs/app/controllers/cadastro_controller.dart';
import 'package:ajuda_ubs/app/models/endereco_model.dart';
import 'package:ajuda_ubs/app/models/paciente_model.dart';
import 'package:ajuda_ubs/app/models/ubs_model.dart';
import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:intl/intl.dart';

class FormCad1View extends StatefulWidget {
  CadastroController? cadastroController;
  bool inicio;
  FormCad1View(
      {Key? key, required this.cadastroController, required this.inicio})
      : super(key: key);

  @override
  State<FormCad1View> createState() => _FormCad1ViewState();
}

class _FormCad1ViewState extends State<FormCad1View> {
  late String dataNascimento = '';
  late DateTime dateTime = DateTime.now();
  late String nome = '';
  late String cns = '';

  late TextEditingController controllerNome;
  late TextEditingController controllerCns;
  late TextEditingController controllerData;

  late Paciente paciente = Paciente
      .constructor1(); // = Paciente(cns: 'cns', dataNascimento: 'dataNascimento', nome: 'nome', endereco: 1, senha: 'senha', telefone: 'telefone', email: 'email', idUbs: 'idUbs');
  late CadastroController cadastroController;
  late Endereco endereco = Endereco
      .constructor1(); // = Endereco(idEndereco: 1, cep: 'cep', rua: 'rua', numero: 1, bairro: 'bairro', municipio: 'municipio', estado: 'estado');

  late TextEditingController controllerTelefone;
  late TextEditingController controllerEmail;

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment,
                children: [
                  const SizedBox(height: 30),
                  /*const Text(
                    'CADASTRO',
                    style: TextStyle(
                        color: Color.fromARGB(255, 138, 161, 212),
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  const SizedBox(height: 5),*/

                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width / 5,
                          child: const LinearProgressIndicator(
                              value: 0.2,
                              color: Color.fromRGBO(138, 162, 212, 1)))),
                  const SizedBox(height: 60),
                  const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        'Boas-vindas ao AjudaUBS!',
                        style: TextStyle(
                            color: Color.fromARGB(255, 79, 103, 155),
                            fontWeight: FontWeight.bold,
                            fontSize: 27),
                      )),
                  const SizedBox(height: 60),
                  const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        'Fale um pouco sobre você :)',
                        style: TextStyle(
                            color: Color.fromRGBO(138, 162, 212, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      )),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: ComponentsUtils.TextFieldEdit(
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
                  ),
                  const SizedBox(height: 15),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: ComponentsUtils.TextFieldEdit(
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
                                  DateFormat('dd/MM/yyyy').format(pickedDate);

                              cns = widget
                                  .cadastroController!.controllerData.text;
                            } else {
                              controllerData.text =
                                  DateFormat('dd/MM/yyyy').format(pickedDate);
                              cns = controllerData.text;

                              dataNascimento =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                            }
                          }); //formatted date output using intl package =>  2021-03-16
                        }
                      },
                          (!widget.inicio)
                              ? widget.cadastroController!.controllerData
                              : controllerData,
                          (email) {},
                          true)),
                  const SizedBox(height: 15),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: ComponentsUtils.TextFieldEdit(
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
                          true)),
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
                        if (!widget.inicio) {
                          widget.cadastroController!.verificarCad1(context,
                              widget.cadastroController!.dataNascimento);
                        } else {
                          cadastroController.dataNascimento = dataNascimento;

                          cadastroController.verificarCad1(
                              context, dataNascimento);
                        }
                      },
                      child: const Icon(Icons.arrow_forward)),
                  const SizedBox(height: 15)
                ],
              ),
            )));
  }
}
