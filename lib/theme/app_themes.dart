import 'package:flutter/material.dart';

enum AppTheme {
  Light,
  Dark,
}

/// Returns enum value name without enum class name.
String enumName(AppTheme anyEnum) {
  return anyEnum.toString().split('.')[1];
}

final appThemeData = {

  AppTheme.Light: ThemeData.light().copyWith(
    primaryColor: Colors.black,
    accentColor: Colors.blue,
    primaryIconTheme: IconThemeData(color: Colors.black),

    brightness: Brightness.light,
    backgroundColor: Colors.grey[200],
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54
  ),

  AppTheme.Dark: ThemeData.dark().copyWith(
    primaryColor: Colors.white,
    accentColor: Colors.grey[200],
    primaryIconTheme: IconThemeData(color: Colors.white),

    brightness: Brightness.dark,
    backgroundColor: Colors.black12,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black54,
  )
};