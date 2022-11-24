import 'package:ajuda_ubs/app/controllers/manifestacao_controller.dart';
import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:flutter/material.dart';

class ConsultarManifestacaoView extends StatefulWidget {
  const ConsultarManifestacaoView({Key? key}) : super(key: key);

  @override
  _ConsultarManifestacaoViewState createState() =>
      _ConsultarManifestacaoViewState();
}

class _ConsultarManifestacaoViewState extends State<ConsultarManifestacaoView> {
  late ManifestacaoController manifestacaoController;

  @override
  void initState() {
    manifestacaoController = ManifestacaoController();
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),
                        const Text(
                          'Acompanhe sua manifestação',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromARGB(255, 138, 161, 212),
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        const SizedBox(height: 15),
                        const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Digite o número do seu protocolo para acompanhar sua manifestação.',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 138, 161, 212),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )),
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 300,
                            child: Image.asset(
                                'assets/imagens/acompanharMan.png')),
                        ComponentsUtils.TextFieldEdit(
                            context,
                            1,
                            'Protocolo',
                            TextInputType.text,
                            const Icon(Icons.login),
                            () {},
                            manifestacaoController.controllerProtocolo,
                            (function) {},
                            true),
                        const SizedBox(height: 10),
                        ComponentsUtils.TextFieldEdit(
                            context,
                            1,
                            'Código de Acesso',
                            TextInputType.text,
                            const Icon(Icons.password),
                            () {},
                            manifestacaoController.controllerCodigo,
                            (function) {},
                            true),
                        const SizedBox(height: 20),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              onPrimary: Colors.white,
                              primary: const Color.fromARGB(255, 98, 127, 189),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 12),
                            ),
                            onPressed: () async {
                              setState(() {
                                manifestacaoController
                                    .consultarManifestacao(context);
                              });
                            },
                            child: const Text(
                              'Acompanhar',
                              style: TextStyle(fontSize: 18),
                            )),
                        const SizedBox(height: 40),
                      ],
                    )))));
  }
}
