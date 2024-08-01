import 'package:flutter/material.dart';

class CheckboxProvider extends ChangeNotifier {
  bool _isChecked = false;

  bool get isChecked => _isChecked;

  void changeCheck(value) {
    _isChecked = value ?? false;
    notifyListeners();
  }
}
