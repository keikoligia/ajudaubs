import 'package:ajuda_ubs/app/controllers/manifestacao_controller.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormManifestacao5View extends StatefulWidget {
  ManifestacaoController manifestacaoController;

  FormManifestacao5View({Key? key, required this.manifestacaoController})
      : super(key: key);

  @override
  _FormManifestacao5ViewState createState() => _FormManifestacao5ViewState();
}

class _FormManifestacao5ViewState extends State<FormManifestacao5View> {
/*
  void makeCall() async {
    String phone = "tel:19994974618";

    if (await canLaunch(phone)) {
      launch(phone);
    } else {
      throw 'ERRO AO LIGAR';
    }
  }

  void sendMessage() async {
    String message = "sms:19994974618?body=ola";

    if (await canLaunch(message)) {
      launch(message);
    } else {
      throw 'ERRO NO SMS';
    }
  }

  void sendEmail() async {
    String email =
        "mailto:cc20130@g.unicamp.br??subject=qualquer assunto&body=ola mundo";

    if (await canLaunch(email)) {
      launch(email);
    } else {
      throw 'ERRO NO EMAIL';
    }
  }

  void acessUrl() async {
    String url = "https://ajudaubsapi.herokuapp.com/";

    if (await canLaunch(url)) {
      launch(url);
    } else {
      throw 'ERRO NO EMAIL';
    }
  }
*/

  dados(String titulo, String conteudo) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
            child: Text(
          titulo,
          textAlign: TextAlign.left,
          style: const TextStyle(
              color: Color.fromARGB(255, 97, 132, 206),
              fontWeight: FontWeight.bold,
              fontSize: 20),
        )),
        Expanded(
          child: SelectableText(
            conteudo,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Color.fromARGB(255, 71, 116, 212),
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ),
      ],
    );
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
            child:  SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),
                        const Text(
                          'Obrigado por utilizar os serviços do AjudaUBS ;) ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromARGB(255, 138, 161, 212),
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        SizedBox(
                            child: Image.asset(
                              'assets/imagens/fig_concluir_man.png',
                              fit: BoxFit.cover,
                            ),
                            width: 400,
                            height: 350),
                        dados(
                            'Protocolo:',
                            widget
                                .manifestacaoController.manifestacao.protocolo),
                        dados(
                            'Código de acesso:',
                            widget.manifestacaoController.manifestacao
                                .codigoAcesso),
                        const SizedBox(height: 10),
                        const Divider(
                            height: 15,
                            endIndent: 20,
                            indent: 20,
                            thickness: 1,
                            color: Color.fromRGBO(138, 162, 212, 1)),
                        const SizedBox(height: 10),
                        const Text(
                          'OBS: Utilize o protocolo e o código de acesso para acompanhar o andamento de sua manifestação',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: Color.fromARGB(255, 138, 161, 212),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
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
                              Navigator.of(context)
                                  .pushReplacementNamed('/home');
                            },
                            child: const Text('CONCLUIR')),
                      ],
                    )))));
  }
}
