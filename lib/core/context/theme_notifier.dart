import 'package:flutter/material.dart';
import 'package:flutter_pokedex/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier(this._preferences) : super(ThemeMode.system);
  final Future<SharedPreferences> _preferences;

  void init() => _getTheme();

  ThemeMode get currentTheme => state;

  void _getTheme() async {
    SharedPreferences pref = await _preferences;
    String? themeMode = pref.getString('theme-mode');
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

  void _setTheme(ThemeMode mode) async {
    SharedPreferences pref = await _preferences;
    switch (mode) {
      case ThemeMode.light:
        pref.setString('theme-mode', 'light');
        state = ThemeMode.light;
        break;
      case ThemeMode.dark:
        pref.setString('theme-mode', 'dark');
        state = ThemeMode.dark;
        break;
      default:
        state = ThemeMode.system;
    }
  }

  void toggleTheme() {
    logger.fine("CHANGE");
    bool isDark = state == ThemeMode.dark;
    if (isDark) {
      _setTheme(ThemeMode.light);
      return;
    } else {
      _setTheme(ThemeMode.dark);
    }

    logger.fine(state);
  }
}
