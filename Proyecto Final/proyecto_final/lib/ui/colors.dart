import 'dart:ui';
import 'package:flutter/material.dart';

Color colorOne = Color(0xFF009dae);
Color colorTwo = Color(0xFF71DFE7);
Color colorThree = Color(0xFFBDBEBE).withOpacity(0.40);
Color colorFour = Color(0xFFBDBEBE);
Color colorFive = Color(0xFFFFE652).withOpacity(0.86);

final appTheme = ThemeData(
  primaryColor: colorOne,
);

Map<int, Color> color = {
  50: Color.fromRGBO(99, 182, 233, .1),
  100: Color.fromRGBO(99, 182, 233, .2),
  200: Color.fromRGBO(99, 182, 233, .3),
  300: Color.fromRGBO(99, 182, 233, .4),
  400: Color.fromRGBO(99, 182, 233, .5),
  500: Color.fromRGBO(99, 182, 233, .6),
  600: Color.fromRGBO(99, 182, 233, .7),
  700: Color.fromRGBO(99, 182, 233, .8),
  800: Color.fromRGBO(99, 182, 233, .9),
  900: Color.fromRGBO(99, 182, 233, 1),
};

MaterialColor colorCustom = MaterialColor(0xffc41421, color);
