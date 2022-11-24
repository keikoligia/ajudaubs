import 'package:ajuda_ubs/app/models/paciente_model.dart';
import 'package:flutter/cupertino.dart';

class AppController extends ChangeNotifier {
  static AppController instance = AppController();
  late Paciente paciente;

  bool isDartTheme = false;

  bool isLogado = false;

  setTheme() {
    isDartTheme = !isDartTheme;
    notifyListeners();
  }
}
