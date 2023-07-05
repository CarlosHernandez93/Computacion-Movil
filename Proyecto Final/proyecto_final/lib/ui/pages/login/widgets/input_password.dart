import 'package:flutter/material.dart';
import 'package:proyecto_final/ui/colors.dart';

TextEditingController controllerCont = TextEditingController();

class input_password extends StatefulWidget {
  const input_password({super.key});

  @override
  State<input_password> createState() => _input_passwordState();
}

class _input_passwordState extends State<input_password> {
  bool _isHidden = false;

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }


  @override
  Widget build(BuildContext context) {
    double widthApp = MediaQuery.of(context).size.width;
    double heightApp = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(top: (heightApp * 0.02)),
      width: widthApp * 0.75,
      child: Column(
        children: <Widget>[
          TextFormField(
            cursorColor: Colors.black,
            controller: controllerCont,
            obscureText: _isHidden,
            decoration: InputDecoration(
                suffix: InkWell(
                  onTap: _togglePasswordView,
                  child: Icon(
                    _isHidden ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                filled: true,
                labelStyle: const TextStyle(
                  color: Color(0xFF000000),
                  fontFamily: "OpenSans",
                ),
                fillColor: colorThree.withOpacity(0.1),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.white, width: 2.0),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.white, width: 2.0),
                ),
                hintText: "Contraseña",
                hintStyle: const TextStyle(
                    fontFamily: "OpenSans", color: Color(0xFF000000)),
                prefixIcon: const Icon(
                  Icons.lock_outline,
                  color: Colors.black,
                )),
          ),
        ],
      ),
    );
  }
}
