import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_final/providers/provider_login.dart';
import 'package:proyecto_final/ui/pages/login/widgets/btn_singUp.dart';
import 'package:proyecto_final/ui/svg_largo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:proyecto_final/ui/global.dart';
import 'package:proyecto_final/ui/pages/login/widgets/card_container.dart';

TextEditingController controllerCorreo = TextEditingController();
TextEditingController controllerCont = TextEditingController();
late SharedPreferences sharedPreferences;
bool checkValue = false;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  late FocusNode pswdFocus;

  @override
  void initState() {
    super.initState();
    pswdFocus = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    double heightApp = MediaQuery.of(context).size.height;
    ProviderLogin watch = context.watch<ProviderLogin>();

    return WillPopScope(
        onWillPop: () => _willPopCallback(),
        child: Scaffold(
            backgroundColor: const Color(0xFFFCF6F6),
            body: SingleChildScrollView(
                child: Stack(
              fit: StackFit.loose,
              children: <Widget>[
                CustomPaint(
                    size: const Size(double.infinity, double.infinity),
                    isComplex: false,
                    painter: CurvePainter1(),
                    child: Container(height: heightApp * 0.8)),
                Column(
                  children: [
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Center(
                          child: Container(
                            margin: EdgeInsets.only(top: (heightApp * 0.08)),
                            alignment: Alignment.topCenter,
                            height: 160,
                            child: SvgPicture.asset(imageReferences.Logo),
                          ),
                        ))
                      ],
                    ),
                    Row(children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: (heightApp * 0.03)),
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: const Card_container(),
                        ),
                      ),
                    ]),
                    Row(children: const <Widget>[Boton_registro()])
                  ],
                )
              ],
            ))));
  }

  void requestFocus(BuildContext context, FocusNode node) {
    FocusScope.of(context).requestFocus(node);
  }
}

Future<bool> _willPopCallback() async {
  return Future.value(false);
}
