import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  textTheme: GoogleFonts.notoSansOsageTextTheme(),
  appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
  primarySwatch: Colors.lightBlue,
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color.fromARGB(255, 234, 233, 233)),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.zero,
    border: OutlineInputBorder(
        borderSide: BorderSide.none, borderRadius: BorderRadius.circular(20)),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none, borderRadius: BorderRadius.circular(20)),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none, borderRadius: BorderRadius.circular(20)),
    fillColor: const Color.fromARGB(255, 234, 233, 233),
    filled: true,
    prefixIconColor: Colors.black87,
  ),
);
ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme.dark(),
  fontFamily: GoogleFonts.notoSans().fontFamily,
  appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
  cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  )),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.zero,
    border: OutlineInputBorder(
        borderSide: BorderSide.none, borderRadius: BorderRadius.circular(20)),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none, borderRadius: BorderRadius.circular(20)),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none, borderRadius: BorderRadius.circular(20)),
    fillColor: Colors.white38,
  ),
);
