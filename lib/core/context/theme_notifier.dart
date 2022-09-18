import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier(this._preferences) : super(ThemeMode.system);
  final SharedPreferences? _preferences;

  void getTheme() {
    String? themeMode = _preferences?.getString('theme-mode');
    switch (themeMode) {
      case 'light':
        state = ThemeMode.light;
        break;
      case 'dark':
        state = ThemeMode.dark;
        break;
      default:
        state = ThemeMode.system;
    }
  }

  void setTheme(ThemeMode mode) {}
}
