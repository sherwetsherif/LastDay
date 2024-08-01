import 'package:flutter/material.dart';

class ButtonProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  void selecteButtom(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
