import 'package:flutter/material.dart';
import 'package:proyecto_final/ui/global.dart';
import 'package:proyecto_final/ui/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

TextEditingController controllerNom = new TextEditingController();
TextEditingController controllerCorreo = new TextEditingController();
TextEditingController controllerCont = new TextEditingController();
TextEditingController controllerCont1 = new TextEditingController();
final firebase = FirebaseFirestore.instance;

class CardRegistro extends StatefulWidget {
  const CardRegistro({super.key});

  @override
  State<CardRegistro> createState() => _CardRegistroState();
}

class _CardRegistroState extends State<CardRegistro> {
  bool _isHidden = false;
  bool _submitted = false;

  _submit() {
    final _errorText = controllerCont.value.text;
    setState(() => _submitted = true);
    if (_errorText == null) {
      return 'Can\'t be empty';
    }
    return null;
  }

  String? get _errorText {
    // at any time, we can get the text from _controller.value.text
    final text = controllerCont.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }

    // return null if the text is valid
    return null;
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  registroUsuario() async {
    try {
      await firebase.collection('Users').doc().set({
        "selectIdUsers": dropdownvalueTipoID,
        "nameUsers": controllerNom.text,
        "correoUsers": controllerCorreo.text,
        "selectOcUsers": dropdownvalueTipoOC,
        "passUsers": controllerCont.text,
        "passConfUsers": controllerCont1.text
      });
    } catch (e) {
      print(e);
    }
  }

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
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButton(
                        dropdownColor: Colors.white,
                        value: dropdownvalueTipoID,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: itemsTipoID.map((String items) {
                          return DropdownMenuItem(
                              value: items, child: Text(items));
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalueTipoID = newValue!;
                          });
                        },
                        hint: const Text("Select item"),
                        elevation: 8,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: "OpenSans"),
                        iconDisabledColor: Colors.red,
                        iconEnabledColor: Colors.black,
                        isExpanded: true,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: (heightApp * 0.02)),
                width: widthApp * 0.8,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: controllerNom,
                      decoration: InputDecoration(
                          filled: true,
                          labelStyle: const TextStyle(
                            color: Color(0xFF000000),
                            fontFamily: "OpenSans",
                          ),
                          fillColor: colorThree.withOpacity(0.1),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0),
                          ),
                          hintText: "Full name",
                          hintStyle: const TextStyle(
                              fontFamily: "OpenSans", color: Color(0xFF000000)),
                          prefixIcon: const Icon(
                            Icons.person_outline,
                            color: Colors.black,
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: (heightApp * 0.02)),
                width: widthApp * 0.8,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: controllerCorreo,
                      decoration: InputDecoration(
                          filled: true,
                          labelStyle: const TextStyle(
                            color: Color(0xFF000000),
                            fontFamily: "OpenSans",
                          ),
                          fillColor: colorThree.withOpacity(0.1),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0),
                          ),
                          hintText: "Email",
                          hintStyle: const TextStyle(
                              fontFamily: "OpenSans", color: Color(0xFF000000)),
                          prefixIcon: const Icon(
                            Icons.attach_email_outlined,
                            color: Colors.black,
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButton(
                        dropdownColor: Colors.white,
                        value: dropdownvalueTipoOC,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: itemsTipoOC.map((String items) {
                          return DropdownMenuItem(
                              value: items, child: Text(items));
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalueTipoOC = newValue!;
                          });
                        },
                        hint: const Text("Select item"),
                        elevation: 8,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: "OpenSans"),
                        iconDisabledColor: Colors.red,
                        iconEnabledColor: Colors.black,
                        isExpanded: true,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: (heightApp * 0.02)),
                width: widthApp * 0.8,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      cursorColor: Colors.black,
                      controller: controllerCont,
                      obscureText: _isHidden,
                      decoration: InputDecoration(
                          errorText: _submitted ? _errorText : null,
                          suffix: InkWell(
                            onTap: _togglePasswordView,
                            child: Icon(
                              _isHidden
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          filled: true,
                          labelStyle: const TextStyle(
                            color: Color(0xFF000000),
                            fontFamily: "OpenSans",
                          ),
                          fillColor: colorThree.withOpacity(0.1),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0),
                          ),
                          hintText: "Password",
                          hintStyle: const TextStyle(
                              fontFamily: "OpenSans", color: Color(0xFF000000)),
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: Colors.black,
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: (heightApp * 0.02)),
                width: widthApp * 0.8,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      cursorColor: Colors.black,
                      controller: controllerCont1,
                      obscureText: _isHidden,
                      decoration: InputDecoration(
                          suffix: InkWell(
                            onTap: _togglePasswordView,
                            child: Icon(
                              _isHidden
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          filled: true,
                          labelStyle: const TextStyle(
                            color: Color(0xFF000000),
                            fontFamily: "OpenSans",
                          ),
                          fillColor: colorThree.withOpacity(0.1),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0),
                          ),
                          hintText: "Confirm password",
                          hintStyle: const TextStyle(
                              fontFamily: "OpenSans", color: Color(0xFF000000)),
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: Colors.black,
                          )),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: Center(
                          child: Container(
                              width: widthApp * 0.8,
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: MaterialButton(
                                onPressed: () {
                                  _submit();
                                  registroUsuario();
                                  var snackBar = const SnackBar(
                                      content: Text('Correct registration'));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                color: colorFive,
                                textColor: Colors.white,
                                splashColor: colorFour,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: const Text('Sign in',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "OpenSans_SemiBold",
                                        fontWeight: FontWeight.w600)),
                              )))),
                ],
              ),
            ],
          ),
        ));
  }
}
