import 'package:ajuda_ubs/app/utils/components_widget.dart';
import 'package:ajuda_ubs/app/views/manifestacao/form_man2_view.dart';
import 'package:flutter/material.dart';

class FormMan1View extends StatefulWidget {
  const FormMan1View({Key? key}) : super(key: key);

  @override
  State<FormMan1View> createState() => _FormMan1ViewState();
}

class _FormMan1ViewState extends State<FormMan1View> {
  late String option = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          const Text(
                            'O QUE DESEJA MANIFESTAR?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromARGB(255, 70, 100, 165),
                                fontWeight: FontWeight.bold,
                                fontSize: 26),
                          ),
                          const SizedBox(
                            height: 70,
                          ),
                          ComponentsUtils.CardOption(
                              context,
                              const Color.fromARGB(255, 255, 0, 0),
                              'DENÚNCIA',
                              'Manifeste sua insatisfação com o serviço publico',
                              "Escolha essa opção para demonstrar a sua insatisfação com um serviço público. Você pode fazer críticas, relatar ineficiência e irregularidades. Também se aplica aos casos de omissão na prestação um serviço público.",
                              'DENUNCIAR',
                              Icons.error_outline, () {
                            setState(() {
                              option = 'DENUNCIAR';
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        FormMan2View(option: option)));
                          }),
                          const SizedBox(
                            height: 30,
                          ),
                          ComponentsUtils.CardOption(
                              context,
                              const Color.fromARGB(147, 0, 67, 0),
                              'DÚVIDA',
                              'Manifeste sua insatisfação com o serviço publico',
                              "Escolha essa opção para demonstrar a sua insatisfação com um serviço público. Você pode fazer críticas, relatar ineficiência e irregularidades. Também se aplica aos casos de omissão na prestação um serviço público.",
                              'DÚVIDAR',
                              Icons.help_outline, () {
                            setState(() {
                              option = 'DÚVIDAR';
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        FormMan2View(option: option)));
                          }),
                          const SizedBox(
                            height: 30,
                          ),
                          ComponentsUtils.CardOption(
                              context,
                              const Color.fromARGB(146, 152, 148, 21),
                              'ELOGIO',
                              'Expresse se você está satisfeito com um atendimento público',
                              "Escolha essa opção se você foi bem atendido ou está satisfeito com o atendimento recebido e deseja compartilhar com a administração pública.",
                              'ELOGIAR',
                              Icons.star_outline, () {
                            setState(() {
                              option = 'ELOGIAR';
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        FormMan2View(option: option)));
                          }),
                          const SizedBox(
                            height: 30,
                          ),
                          ComponentsUtils.CardOption(
                              context,
                              const Color.fromARGB(146, 9, 113, 187),
                              'SUGESTÃO',
                              'Envie uma ideia ou proposta de melhoria dos serviços públicos',
                              "Escolha essa opção para solicitar a simplificação da prestação de um serviço público. Você poderá apresentar uma proposta de melhoria por meio deste formulário próprio.",
                              'SUGERIR',
                              Icons.lightbulb_outlined, () {
                            setState(() {
                              option = 'SUGERIR';
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        FormMan2View(option: option)));
                          }),
                          const SizedBox(
                            height: 30,
                          ),
                        ])))));
  }
}
