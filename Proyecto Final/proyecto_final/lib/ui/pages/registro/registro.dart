import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proyecto_final/ui/global.dart';
import 'package:proyecto_final/ui/pages/registro/widgets/card_container.dart';
import 'package:proyecto_final/ui/svg_largo.dart';

class Registro extends StatefulWidget {
  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro>
    with SingleTickerProviderStateMixin {
  void _onBackPressed() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    double heightApp = MediaQuery.of(context).size.height;

    return Scaffold(
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
            Container(
                padding: const EdgeInsets.only(top: 28),
                child: Row(children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          _onBackPressed();
                        },
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 8,
                    child: Text(
                      "",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "OpenSans_SemiBold",
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ])),
            Row(
              children: <Widget>[
                Expanded(
                    child: Center(
                  child: Container(
                    margin: EdgeInsets.only(top: (heightApp * 0.07)),
                    alignment: Alignment.topCenter,
                    height: 140,
                    child: SvgPicture.asset(imageReferences.Logo),
                  ),
                ))
              ],
            ),
            Row(
              children: const <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 200),
                    child: CardRegistro(),
                  ),
                ),
              ],
            ),
          ],
        )));
  }
}
