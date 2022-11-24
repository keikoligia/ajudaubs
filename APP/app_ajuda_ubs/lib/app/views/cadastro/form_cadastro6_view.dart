// ignore_for_file: prefer_const_constructors

import 'package:ajuda_ubs/app/controllers/cadastro_controller.dart';
import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'form_cadastro1_view.dart';

// ignore: must_be_immutable
class FormCadastro6View extends StatefulWidget {
  CadastroController cadastroController;

  FormCadastro6View({Key? key, required this.cadastroController})
      : super(key: key);

  @override
  State<FormCadastro6View> createState() => _FormCadastro6ViewState();
}

class _FormCadastro6ViewState extends State<FormCadastro6View> {
  bool senhaVisivel = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                  const SizedBox(height: 15),
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
                                return const Text('Rever');
                              },
                            )),
                        const SizedBox(width: 20),
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text("Cadastro para Pacientes",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      //color: Color.fromARGB(255, 138, 161, 212),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              Text("Etapa de verificação",
                                  textAlign: TextAlign.left),
                            ],
                          ),
                        ),
                      ]),
                  const SizedBox(height: 20),
                  const SizedBox(height: 15),

                  const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        'Revise seus dados!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(138, 162, 212, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )),
                  const SizedBox(height: 30),
                  const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        'Informações pessoais',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            // color: Color.fromRGBO(138, 162, 212, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      )),
                  const SizedBox(height: 10),

                  // nome
                  ComponentsUtils.TextValidation(context, 'Nome', () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => FormCadastro1View(
                                  cadastroController: widget.cadastroController,
                                  inicio: false,
                                )));
                  }, const Icon(Icons.person),
                      widget.cadastroController.controllerNome),
                  const SizedBox(height: 15),
                  //Data
                  ComponentsUtils.TextValidation(context, 'Data de nascimento',
                      () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => FormCadastro1View(
                                  cadastroController: widget.cadastroController,
                                  inicio: false,
                                )));
                  }, const Icon(Icons.calendar_today),
                      widget.cadastroController.controllerData),
                  const SizedBox(height: 15),
                  //cARTÃO
                  ComponentsUtils.TextValidation(
                      context, 'Cartão Nacional de Saúde - CNS', () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => FormCadastro1View(
                                  cadastroController: widget.cadastroController,
                                  inicio: false,
                                )));
                  }, const Icon(Icons.add_card),
                      widget.cadastroController.controllerCns),
                  const SizedBox(height: 15),
                  const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        'Contato',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            // color: Color.fromRGBO(138, 162, 212, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      )),
                  const SizedBox(height: 10),
                  //Telefone
                  ComponentsUtils.TextValidation(context, 'Telefone', () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => FormCadastro1View(
                                  cadastroController: widget.cadastroController,
                                  inicio: false,
                                )));
                  }, const Icon(Icons.phone),
                      widget.cadastroController.controllerTelefone),
                  const SizedBox(height: 15),
                  //Email
                  ComponentsUtils.TextValidation(context, 'Email', () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => FormCadastro1View(
                                  cadastroController: widget.cadastroController,
                                  inicio: false,
                                )));
                  }, const Icon(Icons.email),
                      widget.cadastroController.controllerEmail),
                  const SizedBox(height: 15),
                  const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        'Endereço',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            // color: Color.fromRGBO(138, 162, 212, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      )),
                  const SizedBox(height: 10),
                  ComponentsUtils.TextValidation(context, 'CEP', () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => FormCadastro1View(
                                  cadastroController: widget.cadastroController,
                                  inicio: false,
                                )));
                  }, const Icon(Icons.location_pin),
                      widget.cadastroController.controllerCep),
                  const SizedBox(height: 15),
                  ComponentsUtils.TextValidation(context, 'Número', () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => FormCadastro1View(
                                  cadastroController: widget.cadastroController,
                                  inicio: false,
                                )));
                  }, const Icon(Icons.maps_home_work),
                      widget.cadastroController.controllerNum),
                  const SizedBox(height: 15),
                  ComponentsUtils.TextValidation(context, 'Complemento', () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => FormCadastro1View(
                                  cadastroController: widget.cadastroController,
                                  inicio: false,
                                )));
                  }, const Icon(Icons.edit),
                      widget.cadastroController.controllerComp),
                  const SizedBox(height: 15),
                  ComponentsUtils.TextValidation(context, 'Logradouro', () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => FormCadastro1View(
                                  cadastroController: widget.cadastroController,
                                  inicio: false,
                                )));
                  }, const Icon(Icons.edit_road),
                      widget.cadastroController.controllerRua),
                  const SizedBox(height: 15),
                  ComponentsUtils.TextValidation(
                      context, 'Bairro - Cidade - Estado', () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => FormCadastro1View(
                                  cadastroController: widget.cadastroController,
                                  inicio: false,
                                )));
                  }, const Icon(Icons.location_city),
                      widget.cadastroController.controllerBairro),
                  const SizedBox(height: 15),
                  const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        'Unidade Básica de Saúde',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            // color: Color.fromRGBO(138, 162, 212, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      )),
                  const SizedBox(height: 10),
                  ComponentsUtils.TextValidation(context, 'UBS', () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => FormCadastro1View(
                                  cadastroController: widget.cadastroController,
                                  inicio: false,
                                )));
                  },
                      const Icon(Icons.local_hospital),
                      TextEditingController(
                          text: widget.cadastroController.dropValue.value)),
                  const SizedBox(height: 15),
                  const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        'Proteção',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            // color: Color.fromRGBO(138, 162, 212, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      )),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: TextField(
                                obscureText: senhaVisivel,
                                keyboardType: TextInputType.visiblePassword,
                                controller:
                                    widget.cadastroController.controllerSen1,
                                decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                      child: (senhaVisivel == true)
                                          ? const Icon(Icons.visibility_off)
                                          : const Icon(Icons.visibility),
                                      onTap: () {
                                        setState(() {
                                          senhaVisivel = !senhaVisivel;
                                        });
                                      }),
                                  label: const Text(
                                    'Senha',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                        color: Color.fromRGBO(138, 162, 212, 1),
                                        width: 2,
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                        color: Color.fromRGBO(138, 162, 212, 1),
                                        width: 2,
                                      )),
                                ),
                              ))),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                    onPrimary: Colors.white,
                                    primary: const Color.fromARGB(
                                        255, 125, 149, 202),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 12),
                                  ),
                                  onPressed: () {
                                    MaterialPageRoute(
                                        builder: (_) => FormCadastro1View(
                                              cadastroController:
                                                  widget.cadastroController,
                                              inicio: false,
                                            ));
                                  },
                                  child: const Text('EDITAR'))))
                    ],
                  ),

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
                        widget.cadastroController.verificarCad6(context);
                      },
                      child: Text('CADASTRAR')),
                  const SizedBox(height: 15)
                ]))));
  }
}
