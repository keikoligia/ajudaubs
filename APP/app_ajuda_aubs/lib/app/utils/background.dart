import 'package:flutter/material.dart';


class Background extends StatelessWidget {
  const Background({ Key? key, required this.child }) : super(key: key);
  final Widget child;
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Stack(alignment: Alignment.center, children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/imagens/up_fig_welcome.png',
                width: MediaQuery.of(context).size.width * 1,
              )),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/imagens/bottom_fig_welcome.png',
                width: MediaQuery.of(context).size.width * 1,
              )),
              child,
        ]));
  }
}
