import 'package:flutter/cupertino.dart';

class AppController extends ChangeNotifier {
  static AppController instance = AppController();

  bool isDartTheme = false;

  bool isLogado = true;



  setTheme() {
    isDartTheme = !isDartTheme;
    notifyListeners();
  }
}
