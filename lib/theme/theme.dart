import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
    textTheme: GoogleFonts.montserratTextTheme(),
    appBarTheme:
        const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
    primarySwatch: Colors.lightBlue,
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.zero,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
      fillColor: const Color.fromARGB(255, 234, 233, 233),
      filled: true,
      prefixIconColor: Colors.black87,
    ),
    chipTheme: ChipThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ));
ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme.dark(),
  fontFamily: GoogleFonts.montserrat().fontFamily,
  appBarTheme:
      const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
  cardTheme: CardTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
  inputDecorationTheme: InputDecorationTheme(
    prefixIconColor: Colors.white,
    contentPadding: EdgeInsets.zero,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    ),
    fillColor: Colors.grey,
  ),
);
