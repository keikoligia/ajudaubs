import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

class ComponentsUtils {
  // ignore: non_constant_identifier_names
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

  // ignore: non_constant_identifier_names
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
                        color: Color.fromARGB(255, 138, 161, 212),
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
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

  // ignore: non_constant_identifier_names
  static Future<void> Mensagem(
      bool erro, String sim, String nao, BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(Icons.error_outline),
                SizedBox(width: 10),
                Text('Algo deu errado!',
                    style: TextStyle(
                        color: Color.fromARGB(255, 125, 149, 202),
                        fontWeight: FontWeight.bold,
                        fontSize: 24))
              ]),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                (erro) ? Text(sim) : Text(nao),
                const Text('Por favor, tente novamente.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Certo'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // ignore: non_constant_identifier_names
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

  // ignore: non_constant_identifier_names
  static Widget TextValueIcon(
          BuildContext context, Icon icone, String value, String text) =>
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(width: 15),
          icone,
          const SizedBox(width: 15),
          SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              child: Text(
                text,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              )),
          const SizedBox(width: 15),
          SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Center(
                child: Text(value,
                    style: const TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 15)),
              )),
        ],
      );

  // ignore: non_constant_identifier_names
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

  // ignore: non_constant_identifier_names
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
        enabled: pega,
        keyboardType: tipo,
        onChanged: onChanged,
        onTap: ontap, //set it true, so that user will not able to edit text
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: icone,
          label: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        maxLines: maxLines,
      );

  // ignore: non_constant_identifier_names
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
                      enabled: false,
                      keyboardType: TextInputType.text,
                      controller: controller,
                      decoration: InputDecoration(
                        suffixIcon: icone,
                        label: Text(
                          label,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      )))),
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
