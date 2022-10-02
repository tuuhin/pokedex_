import 'package:flutter/material.dart';
import 'package:flutter_pokedex/core/context/theme_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final preferncesProvider = FutureProvider<SharedPreferences>(
    (ref) async => await SharedPreferences.getInstance());

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  SharedPreferences? preferences = ref.read(preferncesProvider).value;
  return ThemeNotifier(preferences)..init();
});
