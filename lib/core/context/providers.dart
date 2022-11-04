import 'package:flutter/material.dart';
import 'package:flutter_pokedex/core/context/theme_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final preferncesProvider = Provider<Future<SharedPreferences>>(
    (ref) => SharedPreferences.getInstance());

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>(
    (ref) => ThemeNotifier(ref.read(preferncesProvider))..init());
