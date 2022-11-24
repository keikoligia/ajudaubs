// ignore_for_file: non_constant_identifier_names, duplicate_ignore

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

class ComponentsUtils {
  static Widget ButtonTextColor(BuildContext context, String text,
          VoidCallback onClicked, Color color) =>
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            onPrimary: Colors.white,
            primary: color,
            textStyle: const TextStyle(
                fontFamily: 'Merriweather',
                fontSize: 17,
                fontWeight: FontWeight.bold)),
        child: Text(text),
        onPressed: onClicked,
      );

  static Widget CardOption(
      BuildContext context,
      Color cor,
      String title,
      String subtitle,
      String text,
      String textButton,
      IconData icone,
      void Function() onClick) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 182, 182, 182),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ExpansionTileCard(
          leading: Icon(icone, size: 50, color: cor),
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Color.fromARGB(255, 138, 161, 212),
//  color: Color.fromARGB(255, 255, 0, 0),
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          subtitle: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Color.fromARGB(255, 138, 161, 212),
//  color: Color.fromARGB(255, 255, 0, 0),
                //fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
          //subtitle: Text('I expand!'),
          children: <Widget>[
            const Divider(
              thickness: 1.0,
              height: 1.0,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  // ignore: unnecessary_const
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        // color: Color.fromARGB(255, 138, 161, 212),
                        //fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                )),
            ComponentsUtils.ButtonTextColor(
              context,
              textButton,
              onClick,
              cor,
            ),
            const SizedBox(
              height: 20,
            ),
          ]),
    );
  }

  static Widget CardSuport(BuildContext context, String title, String subtitle,
      Widget widget, IconData icone) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 182, 182, 182),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ExpansionTileCard(
          leading: Icon(icone,
              size: 50, color: const Color.fromARGB(255, 138, 161, 212)),
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Color.fromARGB(255, 138, 161, 212),
//  color: Color.fromARGB(255, 255, 0, 0),
                fontWeight: FontWeight.bold,
                fontSize: 24),
          ),
          subtitle: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Color.fromARGB(255, 138, 161, 212),
//  color: Color.fromARGB(255, 255, 0, 0),
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
          //subtitle: Text('I expand!'),
          children: <Widget>[
            Align(alignment: Alignment.centerLeft, child: widget),
            const SizedBox(
              height: 20,
            ),
          ]),
    );
  }

  static Future<void> Mensagem(bool isAcao, String title, String mensagemErro,
      String textoBotao, Function()? onClick, BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.error_outline),
                const SizedBox(width: 10),
                Text(title,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 125, 149, 202),
                        fontWeight: FontWeight.bold,
                        fontSize: 21))
              ]),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(mensagemErro, textAlign: TextAlign.justify),
                const Text('Por favor, tente novamente.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Voltar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            (isAcao)
                ? TextButton(child: Text(textoBotao), onPressed: onClick)
                : Container(),
          ],
        );
      },
    );
  }

  static Widget TextLabelValue(
          BuildContext context, String value, String text) =>
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: Text(
                text,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              )),
          SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Center(
                child: Text(value,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 15)),
              )),
        ],
      );

  static String fourDigits(int n) {
    int absN = n.abs();
    String sign = n < 0 ? "-" : "";
    if (absN >= 1000) return "$n";
    if (absN >= 100) return "${sign}0$absN";
    if (absN >= 10) return "${sign}00$absN";
    return "${sign}000$absN";
  }

  static String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  static String toStringDate(DateTime data, bool horas) {
    if (data.compareTo(DateTime.now()) != 0) {
      String y = fourDigits(data.year);
      String m = twoDigits(data.month);
      String d = twoDigits(data.day);
      String h = twoDigits(data.hour);
      String min = twoDigits(data.minute);

      if (horas) {
        return "$d/$m/$y às $h:$min";
      } else {
        return "$d-$m-$y";
      }
    } else {
      return " ";
    }
  }

  static Widget TextValueIcon(
          BuildContext context, Icon icone, String value, String text) =>
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 15),
          SizedBox(width: MediaQuery.of(context).size.width / 8, child: icone),
          const SizedBox(width: 15),
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(width: 15),
          Expanded(
              child: Center(
            child: Text(value,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 15)),
          )),
          const SizedBox(width: 15),
        ],
      );

  static Widget ImagePerson(BuildContext context, String imagePath, bool isEdit,
          VoidCallback onClicked) =>
      Center(
        child: Stack(
          children: [
            ClipOval(
              child: Material(
                color: Colors.transparent,
                child: Ink.image(
                  image: NetworkImage(imagePath),
                  fit: BoxFit.cover,
                  width: 128,
                  height: 128,
                  child: InkWell(onTap: onClicked),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 4,
              child: ClipOval(
                  child: Container(
                      padding: const EdgeInsets.all(3),
                      color: Colors.white,
                      child: ClipOval(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: const Color.fromRGBO(138, 162, 212, 1),
                          child: Icon(
                            isEdit ? Icons.add_a_photo : Icons.edit,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ))),
            ),
          ],
        ),
      );

  static Widget ImageRanking(
          BuildContext context, String imagePath, bool isEdit, Widget rank) =>
      Center(
        child: Stack(
          children: [
            ClipOval(
              child: Material(
                color: Colors.transparent,
                child: SizedBox(
                  child: Image.network(
                      'https://i0.wp.com/cartacampinas.com.br/wordpress/wp-content/uploads/foto-ubs-divulgacao-pref-de-maranguape.jpg?fit=650%2C396&ssl=1&w=640'),
                  //decoration: BoxDecoration(border: BoxFit.cover,
                  width: 80,
                  height: 80,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 4,
              child: ClipOval(
                  child: Container(
                      padding: const EdgeInsets.all(3),
                      color: Colors.white,
                      child: ClipOval(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: const Color.fromRGBO(138, 162, 212, 1),
                          child: rank,
                        ),
                      ))),
            ),
          ],
        ),
      );

  static Widget TextFieldEdit(
          BuildContext context,
          int maxLines,
          String label,
          TextInputType tipo,
          Icon icone,
          Function() ontap,
          TextEditingController controller,
          ValueChanged<String> onChanged,
          bool pega) =>
      TextField(
        cursorColor: const Color.fromRGBO(138, 162, 212, 1),
        enabled: pega,
        keyboardType: tipo,
        onChanged: onChanged,
        onTap: ontap, //set it true, so that user will not able to edit text
        controller: controller,

        decoration: InputDecoration(
          suffixIcon: icone,
          //hintText: hint,
          label: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
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
        maxLines: maxLines,
      );

  static MaterialColor colorBaseApp(Color color) {
    List strengths = <double>[0.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1, len = 9; i <= len; i++) {
      strengths.add(0.1 * i);
    }

    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
          r + ((ds < 0 ? r : (255 - r)) * ds).round(),
          g + ((ds < 0 ? g : (255 - g)) * ds).round(),
          b + ((ds < 0 ? b : (255 - b)) * ds).round(),
          1);
    }

    return MaterialColor(color.value, swatch);
  }

  static Widget TextValidation(BuildContext context, String label,
          Function() ontap, Icon icone, TextEditingController controller) =>
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                      enabled: true,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextValueIcon(
                                      context, icone, label, controller.text),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: const StadiumBorder(),
                                            onPrimary: Colors.white,
                                            primary: const Color.fromARGB(
                                                255, 125, 149, 202),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 12),
                                          ),
                                          onPressed: ontap,
                                          child: const Text('EDITAR')))
                                ],
                              )),
                        );
                      },
                      keyboardType: TextInputType.text,
                      controller: controller,
                      decoration: InputDecoration(
                          suffixIcon: icone,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          label: InkWell(
                            onTap: () {
                              // clickUbs(context, controller.text, ontap);
                            },
                            child: Text(
                              label,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ))))),
          SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        onPrimary: Colors.white,
                        primary: const Color.fromARGB(255, 125, 149, 202),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                      ),
                      onPressed: ontap,
                      child: const Text('EDITAR'))))
        ],
      );
}
