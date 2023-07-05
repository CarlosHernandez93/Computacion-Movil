import 'package:flutter/material.dart';
import 'package:proyecto_final/ui/pages/login/widgets/btn_logIn.dart';
import 'package:proyecto_final/ui/pages/login/widgets/input_email.dart';
import 'package:proyecto_final/ui/pages/login/widgets/input_password.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:proyecto_final/ui/colors.dart';

late SharedPreferences sharedPreferences;
TextEditingController controllerCorreo = TextEditingController();
TextEditingController controllerCont = TextEditingController();
bool checkValue = false;

class Card_container extends StatelessWidget {
  const Card_container({super.key});

  @override
  Widget build(BuildContext context) {
    double widthApp = MediaQuery.of(context).size.width;
    double heightApp = MediaQuery.of(context).size.height;
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 10.0,
      child: Form(
        child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: (heightApp * 0.05), bottom: (heightApp * 0.05)),
            child: Column(children: <Widget>[
              const input_email(),
              const input_password(),
              Row(
                children: const [Expanded(child: Center(child: Boton_logIn()))],
              ),

            ]),
          ),
        ]),
      ),
    );
  }
}
