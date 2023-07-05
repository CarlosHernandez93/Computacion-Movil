import 'package:flutter/material.dart';

class ProviderLogin with ChangeNotifier {
  String _field1 = '';
  String _field2 = '';

  String get field1 => _field1;
  String get field2 => _field2;

  void setField1(String value) {
    _field1 = value;
    notifyListeners();
  }

  void setField2(String value) {
    _field2 = value;
    notifyListeners();
  }
}
