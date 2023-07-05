import 'package:flutter/material.dart';
import 'package:proyecto_final/ui/colors.dart';

TextEditingController controllerCorreo = TextEditingController();

class input_email extends StatefulWidget {
  const input_email({super.key});

  @override
  State<input_email> createState() => _input_emailState();
}

class _input_emailState extends State<input_email> {
  late FocusNode pswdFocus;

  void initState() {
    super.initState();
    pswdFocus = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    double widthApp = MediaQuery.of(context).size.width;
    double heightApp = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(top: (heightApp * 0.02)),
      width: widthApp * 0.75,
      child: Column(children: <Widget>[
        TextFormField(
          controller: controllerCorreo,
          decoration: InputDecoration(
            filled: true,
            fillColor: colorThree.withOpacity(0.1),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.white, width: 2.0),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.white, width: 2.0),
            ),
            hintText: "Correo",
            labelStyle: const TextStyle(
              color: Color(0xFF000000),
              fontFamily: "OpenSans",
            ),
            hintStyle: const TextStyle(
                fontFamily: "OpenSans", color: Color(0xFF000000)),
            prefixIcon: const Icon(Icons.person_outline, color: Colors.black),
          ),
          onEditingComplete: () => requestFocus(context, pswdFocus),
        ),
      ]),
    );
  }
}

void requestFocus(BuildContext context, FocusNode node) {
  FocusScope.of(context).requestFocus(node);
}
