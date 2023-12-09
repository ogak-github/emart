import 'package:emart_v2/theme/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color PRIMARY_COLOR = HexColor.fromHex("#DB3022");
Color BACKGROUND_COLOR = HexColor.fromHex("#F9F9F9");
Color PURE_WHITE_COLOR = HexColor.fromHex("#FFFFFF");
Color GRAY_COLOR = HexColor.fromHex("#9B9B9B");
Color SUCCESS_COLOR = HexColor.fromHex("#2AA952");

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: PRIMARY_COLOR,
  textSelectionTheme: TextSelectionThemeData(
    selectionColor: GRAY_COLOR,
    cursorColor: GRAY_COLOR,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(
      color: PRIMARY_COLOR,
    ),
    selectedItemColor: PRIMARY_COLOR,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll<Color>(PRIMARY_COLOR),
      foregroundColor: MaterialStatePropertyAll<Color>(BACKGROUND_COLOR),
      iconColor: MaterialStatePropertyAll<Color>(BACKGROUND_COLOR),
      shape: MaterialStatePropertyAll<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStatePropertyAll<Color>(PRIMARY_COLOR),
      iconColor: MaterialStatePropertyAll<Color>(PRIMARY_COLOR),
      //backgroundColor: MaterialStatePropertyAll<Color>(PRIMARY_COLOR),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: GRAY_COLOR),
    suffixIconColor: PRIMARY_COLOR,
    prefixIconColor: PRIMARY_COLOR,
    iconColor: PRIMARY_COLOR,
    border: InputBorder.none,
    filled: true,
    fillColor: PURE_WHITE_COLOR,
    focusColor: SUCCESS_COLOR,
    hoverColor: SUCCESS_COLOR,
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStatePropertyAll<Color>(PRIMARY_COLOR),
      iconColor: MaterialStatePropertyAll<Color>(PRIMARY_COLOR),
    ),
  ),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.metrophobic(),
    displayMedium: GoogleFonts.metrophobic(),
    displaySmall: GoogleFonts.metrophobic(),
    titleLarge: GoogleFonts.metrophobic(),
    titleMedium: GoogleFonts.metrophobic(),
    titleSmall: GoogleFonts.metrophobic(),
    bodyLarge: GoogleFonts.metrophobic(),
    bodyMedium: GoogleFonts.metrophobic(),
    bodySmall: GoogleFonts.metrophobic(),
    labelLarge: GoogleFonts.metrophobic(),
    labelMedium: GoogleFonts.metrophobic(),
    labelSmall: GoogleFonts.metrophobic(),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
   textTheme: TextTheme(
    displayLarge: GoogleFonts.metrophobic(),
    displayMedium: GoogleFonts.metrophobic(),
    displaySmall: GoogleFonts.metrophobic(),
    titleLarge: GoogleFonts.metrophobic(),
    titleMedium: GoogleFonts.metrophobic(),
    titleSmall: GoogleFonts.metrophobic(),
    bodyLarge: GoogleFonts.metrophobic(),
    bodyMedium: GoogleFonts.metrophobic(),
    bodySmall: GoogleFonts.metrophobic(),
    labelLarge: GoogleFonts.metrophobic(),
    labelMedium: GoogleFonts.metrophobic(),
    labelSmall: GoogleFonts.metrophobic(),
  ),
);
