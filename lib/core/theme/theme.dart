import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  textTheme: GoogleFonts.notoSansOsageTextTheme(),
  appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.zero,
    border: OutlineInputBorder(
        borderSide: const BorderSide(width: 2),
        borderRadius: BorderRadius.circular(20)),
    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 0),
        borderRadius: BorderRadius.circular(20)),
    enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 0),
        borderRadius: BorderRadius.circular(20)),
    fillColor: Colors.grey,
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
        borderSide: const BorderSide(width: 2),
        borderRadius: BorderRadius.circular(20)),
    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 0),
        borderRadius: BorderRadius.circular(20)),
    enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 0),
        borderRadius: BorderRadius.circular(20)),
    fillColor: Colors.white38,
  ),
);
