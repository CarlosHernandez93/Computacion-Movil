import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proyecto_final/device/device_size.dart';
import 'package:proyecto_final/ui/pages/login/login_page.dart';
import 'package:proyecto_final/ui/global.dart';
import 'package:proyecto_final/ui/colors.dart';

class Splash extends StatefulWidget {
  @override
  VideoState createState() => VideoState();
}

DeviceSize? deviceSize;

class VideoState extends State<Splash> with SingleTickerProviderStateMixin {
  var _visible = true;
  late AnimationController animationController;
  late Animation<double> animation;

  startTime() async {
    var _duration = const Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    deviceSize = DeviceSize(
        size: MediaQuery.of(context).size,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        aspectRatio: MediaQuery.of(context).size.aspectRatio);
    return Scaffold(
      backgroundColor: colorOne,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: animation.value * 250,
                height: animation.value * 250,
                child: SvgPicture.asset(imageReferences.Logo),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
