import 'package:flutter/material.dart';
import 'package:serag/core/theme/app_theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _currentTheme = AppTheme.lightTheme;
  bool _isDarkTheme = false;
  ThemeData get currentTheme => _currentTheme;
  bool get isDarkTheme => _isDarkTheme;

  void updateThemeBaseOnTime() {
    final hour = DateTime.now().hour;
    if (hour >= 6 && hour < 20) {
      _currentTheme = AppTheme.lightTheme;
      _isDarkTheme = false;
    } else {
      _currentTheme = AppTheme.darkTheme;
      _isDarkTheme = true;
    }
    notifyListeners();
  }

// switch between light and dark :
  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    _currentTheme = _isDarkTheme ? AppTheme.darkTheme : AppTheme.lightTheme;
    notifyListeners();
  }
}
