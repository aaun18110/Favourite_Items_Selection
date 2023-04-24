import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  var _thememode = ThemeMode.light;
  ThemeMode get thememode => _thememode;

  void setMode(thememode) {
    _thememode = thememode;
    notifyListeners();
  }
}
