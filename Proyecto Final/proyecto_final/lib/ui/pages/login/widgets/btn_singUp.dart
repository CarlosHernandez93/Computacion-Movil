import 'package:flutter/material.dart';
import 'package:proyecto_final/ui/colors.dart';
import 'package:proyecto_final/ui/pages/registro/registro.dart';

class Boton_registro extends StatefulWidget {
  const Boton_registro({super.key});

  @override
  State<Boton_registro> createState() => _Boton_registroState();
}

class _Boton_registroState extends State<Boton_registro> {
  @override
  Widget build(BuildContext context) {
    double heightApp = MediaQuery.of(context).size.height;

    return Expanded(
        child: Container(
      child: Column(children: <Widget>[
        Container(
            margin: EdgeInsets.only(top: (heightApp * 0.07)),
            child: RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Registro()));
              },
              color: colorFive,
              textColor: Colors.white,
              splashColor: colorFour,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Text(
                "Resgistrate",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "OpenSans_SemiBold",
                    fontWeight: FontWeight.w600),
              ),
            ))
      ]),
    ));
  }
}
