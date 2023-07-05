import 'package:flutter/material.dart';
import 'package:proyecto_final/ui/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_final/ui/pages/home/home.dart';

TextEditingController controllerCorreo = TextEditingController();
TextEditingController controllerCont = TextEditingController();

class Boton_logIn extends StatefulWidget {
  const Boton_logIn({super.key});

  @override
  State<Boton_logIn> createState() => _Boton_logInState();
}

class _Boton_logInState extends State<Boton_logIn> {
  bool _validate = false;

  validarDatos() async {
    try {
      print(controllerCorreo.text);
      print(controllerCont.text);
      CollectionReference ref = FirebaseFirestore.instance.collection('Users');
      QuerySnapshot usuarios = await ref.get();
      if (usuarios.docs.length != 0) {
        var existe = false;
        for (var cursor in usuarios.docs) {
          if (cursor.get("correoUsers") == controllerCorreo.text) {
            if (cursor.get("passUsers") == controllerCont.text) {
              existe = true;
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const Home()));
            }
          }
        }
        if (!existe) {
          setState(() {
            _validate = false;
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      title: const Text('Error',
                          style: TextStyle(
                              color: Color(0xffc41421),
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              fontFamily: "OpenSans_SemiBold")),
                      content: const Text(
                          'Al ingresar correo electrónico o contraseña',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontFamily: "OpenSans",
                          )),
                      actions: <Widget>[
                        MaterialButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          color: colorOne,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: const Text(
                            "Cerrar",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "OpenSans_SemiBold"),
                          ),
                        )
                      ],
                    ));
          });
        }
      } else {
        print("error");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double widthApp = MediaQuery.of(context).size.width;
    double heightApp = MediaQuery.of(context).size.height;

    return Container(
        width: widthApp * 0.75,
        padding: const EdgeInsets.only(top: 10),
        child: MaterialButton(
          onPressed: () {
            validarDatos();
          },
          color: colorFive,
          textColor: Colors.white,
          splashColor: colorFour,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: const Text(
            'Ingresar',
            style: TextStyle(
                fontSize: 20,
                fontFamily: "OpenSans_SemiBold",
                fontWeight: FontWeight.w600),
          ),
        ));
  }
}
