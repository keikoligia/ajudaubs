import 'package:ajuda_ubs/app/controllers/manifestacao_controller.dart';
import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class FormManifestacao1View extends StatefulWidget {
  const FormManifestacao1View({Key? key}) : super(key: key);

  @override
  State<FormManifestacao1View> createState() => _FormManifestacao1ViewState();
}

class _FormManifestacao1ViewState extends State<FormManifestacao1View> {
  late ManifestacaoController manifestacaoController;

  @override
  void initState() {
    super.initState();
    manifestacaoController = ManifestacaoController();
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
                                      Text("Manifestação Pública",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              //color: Color.fromARGB(255, 138, 161, 212),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                      Text("Etapa inicial",
                                          textAlign: TextAlign.left),
                                    ],
                                  ),
                                ),
                              ]),
                          const SizedBox(height: 20),
                          const Text(
                            'O que deseja deseja manifestar?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(138, 162, 212, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          ComponentsUtils.CardOption(
                              context,
                              Colors.red[900]!,
                              'DENÚNCIA',
                              'Manifeste sua insatisfação com o serviço publico',
                              "Escolha essa opção para demonstrar a sua insatisfação com um serviço público. Você pode fazer críticas, relatar ineficiência e irregularidades. Também se aplica aos casos de omissão na prestação um serviço público.",
                              'DENUNCIAR',
                              Icons.error_outline, () {
                            manifestacaoController.verificacaoMan1(
                                context,
                                'DENÚNCIA',
                                'Manifeste sua insatisfação com o serviço publico');
                          }),
                          const SizedBox(
                            height: 30,
                          ),
                          ComponentsUtils.CardOption(
                              context,
                              Colors.green[900]!,
                              'DÚVIDA',
                              'Manifeste sua insatisfação com o serviço publico',
                              "Escolha essa opção para demonstrar a sua insatisfação com um serviço público. Você pode fazer críticas, relatar ineficiência e irregularidades. Também se aplica aos casos de omissão na prestação um serviço público.",
                              'DÚVIDAR',
                              Icons.help_outline, () {
                            manifestacaoController.verificacaoMan1(
                                context,
                                'DÚVIDA',
                                'Manifeste sua insatisfação com o serviço publico');
                          }),
                          const SizedBox(
                            height: 30,
                          ),
                          ComponentsUtils.CardOption(
                              context,
                              Colors.yellow[600]!,
                              'ELOGIO',
                              'Expresse se você está satisfeito com um atendimento público',
                              "Escolha essa opção se você foi bem atendido ou está satisfeito com o atendimento recebido e deseja compartilhar com a administração pública.",
                              'ELOGIAR',
                              Icons.star_outline, () {
                            manifestacaoController.verificacaoMan1(
                                context,
                                'ELOGIO',
                                'Expresse se você está satisfeito com um atendimento público');
                          }),
                          const SizedBox(
                            height: 30,
                          ),
                          ComponentsUtils.CardOption(
                              context,
                              Colors.blue[900]!,
                              'SUGESTÃO',
                              'Envie uma ideia ou proposta de melhoria dos serviços públicos',
                              "Escolha essa opção para solicitar a simplificação da prestação de um serviço público. Você poderá apresentar uma proposta de melhoria por meio deste formulário próprio.",
                              'SUGERIR',
                              Icons.lightbulb_outlined, () {
                            manifestacaoController.verificacaoMan1(
                                context,
                                'SUGESTÃO',
                                'Envie uma ideia ou proposta de melhoria dos serviços públicos');
                          }),
                          const SizedBox(
                            height: 50,
                          ),
                        ])))));
  }
}
