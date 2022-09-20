import 'package:flutter/material.dart';
import 'package:flutter_pokedex/core/context/providers.dart';
import 'package:flutter_pokedex/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier(this._preferences) : super(ThemeMode.system);
  final SharedPreferences? _preferences;

  void init() => _getTheme();

  void _getTheme() {
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

  void _setTheme(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        _preferences?.setString('theme-mode', 'light');
        state = ThemeMode.light;
        break;
      case ThemeMode.dark:
        _preferences?.setString('theme-mode', 'dark');
        state = ThemeMode.dark;
        break;
      default:
        state = ThemeMode.system;
    }
  }

  void toggleTheme() {
    bool isDark = state == ThemeMode.dark;
    if (isDark) {
      _setTheme(ThemeMode.light);
      return;
    } else {
      _setTheme(ThemeMode.dark);
    }
    logger.fine(_preferences?.getKeys());
    logger.fine(state);
  }
}
