import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;
  SharedPreferences _prefs;
  static const String _themeField = 'theme';
  static const int _lightThemeInt = 0;
  static const int _darkThemeInt = 1;

  final _lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.black,
    accentColor: Colors.blue,
    primaryIconTheme: IconThemeData(color: Colors.black),

    brightness: Brightness.light,
    canvasColor: Colors.grey[200],
    backgroundColor: Colors.grey[200],
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
    indicatorColor: Colors.grey[600],
  );

  final _darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.white,
    accentColor: Colors.grey[200],
    primaryIconTheme: IconThemeData(color: Colors.white),

    brightness: Brightness.dark,
    canvasColor: Colors.grey[850],
    backgroundColor: Colors.black, //Colors.black12,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black54,
    indicatorColor: Colors.white,

  );

  ThemeChanger() {
    _themeData = _darkTheme;
    asyncInit();
  }

  Future<void> asyncInit() async {
    _prefs = await SharedPreferences.getInstance();
    int theme = (_prefs.getInt(_themeField) ?? 0);
    if (theme == _lightThemeInt) {
      _themeData = _lightTheme;
    } else {
      _themeData = _darkTheme;
    }
    notifyListeners();
  }

  ThemeData get theme => _themeData;

  void switchTheme() {
    if (_themeData == _lightTheme) {
      _themeData = _darkTheme;
      _prefs.setInt(_themeField, _darkThemeInt);
    } else {
      _themeData = _lightTheme;
      _prefs.setInt(_themeField, _lightThemeInt);
    }
    notifyListeners();
  }
}