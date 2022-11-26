import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme_notifier.dart';

final preferncesProvider = Provider<Future<SharedPreferences>>(
    (ref) async => await SharedPreferences.getInstance());

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>(
    (ref) => ThemeNotifier(ref.read(preferncesProvider))..init());
