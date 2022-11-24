import 'package:ajuda_ubs/app/controllers/cadastro_controller.dart';
import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

// ignore: must_be_immutable
class FormCadastro5View extends StatefulWidget {
  CadastroController cadastroController;

  FormCadastro5View({Key? key, required this.cadastroController}) : super(key: key);

  @override
  State<FormCadastro5View> createState() => _FormCadastro5ViewState();
}

class _FormCadastro5ViewState extends State<FormCadastro5View> {
  bool senhaVisivel = false;

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
                    child:  Column(
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
                          return const Text('4 de 4');
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
                        Text("Última etapa", textAlign: TextAlign.left),
                      ],
                    ),
                  ),
                ]),
            const SizedBox(height: 60),
            const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  'Sua senha, sua segurança!',
                  style: TextStyle(
                      color: Color.fromRGBO(138, 162, 212, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),
            const SizedBox(height: 15),
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  obscureText: senhaVisivel,
                  keyboardType: TextInputType.visiblePassword,
                  controller: widget.cadastroController.controllerSen1,
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                )),
            const SizedBox(height: 15),
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  obscureText: senhaVisivel,
                  keyboardType: TextInputType.visiblePassword,
                  controller: widget.cadastroController.controllerSen2,
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
                      'Digite a senha novamente',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                )),
            const SizedBox(height: 15),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  onPrimary: Colors.white,
                  primary: const Color.fromARGB(255, 125, 149, 202),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                onPressed: () {
                  widget.cadastroController.verificarCad5(context);
                },
                child: const Text('CADASTRAR')),
            const SizedBox(height: 15)
          ],
        ),
      ),
    );
  }
}
