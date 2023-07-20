import 'package:flutter/material.dart';
import 'package:flutter_shop_app/theme/theme_constants.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider({required bool isDarkTheme}) {
    _selectedTheme = isDarkTheme ? darkTheme : lightTheme;
  }

  late ThemeData _selectedTheme;
  ThemeData lightTheme = light;
ThemeData darkTheme = dark;

  ThemeData get getTheme => _selectedTheme;

  void swapTheme() {
    _selectedTheme = _selectedTheme == lightTheme ? darkTheme : lightTheme;
    notifyListeners();
  }
}
