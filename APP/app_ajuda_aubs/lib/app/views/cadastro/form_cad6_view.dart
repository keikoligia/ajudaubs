import 'package:ajuda_ubs/app/views/login_view.dart';
import 'package:flutter/material.dart';

class FormCad6View extends StatefulWidget {
  const FormCad6View({Key? key}) : super(key: key);

  @override
  State<FormCad6View> createState() => _FormCad6ViewState();
}

class _FormCad6ViewState extends State<FormCad6View> {
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
                const SizedBox(height: 70),

                const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      'Obrigado por se cadastrar no AjudaUBS ;)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 138, 161, 212),
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    )),
                SizedBox(
                    child: Image.asset(
                      'assets/imagens/fig_concluir_cad.png',
                      fit: BoxFit.cover,
                    ),
                    width: 400,
                    height: 350),
                const SizedBox(height: 10),
                const Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Text(
                      'Utilize o aplicativo para facilitar seu contato com a UBS. Também exerça sua cidade e se manifeste para a Ouvidoria Municipal.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 138, 161, 212),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )),
                const SizedBox(height: 10),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      onPrimary: Colors.white,
                      primary: const Color.fromARGB(255, 98, 127, 189),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 12),
                    ),
                    onPressed: () async {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const LoginView()));
                    },
                    child: const Text('CERTO')),

                //(file == null)? Container() : Image.file(File(file!.path.toString()), width: 100, height: 100)
              ],
            ))));
  }
}
