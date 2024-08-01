import 'package:flutter/material.dart';

class ShowProvider extends ChangeNotifier {
  bool _isShowed = false;
  
  bool get isShowed => _isShowed;

  void isPasswordShowed() {
    _isShowed = !isShowed;
    notifyListeners();
  }
}
