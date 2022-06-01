import 'package:flutter/material.dart';
import 'package:flutter_advanced/product/global/dark_theme.dart';
import 'package:flutter_advanced/product/global/light_theme.dart';


class ThemeNotifier extends ChangeNotifier{
  bool isLightTheme = true;

  void changeTheme(){
    isLightTheme = !isLightTheme;
    notifyListeners();
  }

  ThemeData get currentTheme => isLightTheme ? LightTheme().theme : DarkTheme().theme;
}