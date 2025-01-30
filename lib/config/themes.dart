import 'package:flutter/material.dart';
import 'package:getx_news_app/config/colors.dart';

class ThemesColor {
  static final lightTheme = ThemeData(
      useMaterial3: true,
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: lightBgColor,
        filled: true,
        enabledBorder: InputBorder.none,
        prefixIconColor: lightLableColor,
        labelStyle: TextStyle(
          fontFamily: "Poppins",
          fontSize: 15,
          color: lightFontColor,
          fontWeight: FontWeight.w500,
        ), // TextStyle
        hintStyle: TextStyle(
          fontFamily: "Poppins",
          fontSize: 15,
          color: lightFontColor,
          fontWeight: FontWeight.w500,
        ), // TextStyle
      ), // InputDecoration Theme
      colorScheme: const ColorScheme.light(
        brightness: Brightness.light,
        background: Color.fromARGB(255, 176, 174, 188),
        onBackground: Color.fromARGB(255, 237, 237, 238),
        primaryContainer: Color.fromARGB(255, 124, 124, 124),
        onPrimaryContainer: lightFontColor,
        secondaryContainer: lightLableColor,
        primary: Color.fromARGB(255, 1, 1, 1),
      ), // ColorScheme.light
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontFamily: "Poppins",
          fontSize: 24,
          color: lightFontColor,
          fontWeight: FontWeight.w700,
        ), // TextStyle
        headlineMedium: TextStyle(
          fontFamily: "Poppins",
          fontSize: 20,
          color: lightFontColor,
          fontWeight: FontWeight.w600,
        ), // TextStyle
        headlineSmall: TextStyle(
          fontFamily: "Poppins",
          fontSize: 15,
          color: lightFontColor,
          fontWeight: FontWeight.w600,
        ), //
        bodyLarge: TextStyle(
          fontFamily: "Poppins",
          fontSize: 16,
          color: lightFontColor,
          fontWeight: FontWeight.bold,
        ), // TextStyle

        bodyMedium: TextStyle(
          fontFamily: "Poppins",
          fontSize: 15,
          color: lightFontColor,
          fontWeight: FontWeight.w400,
        ), // TextStyle

        bodySmall: TextStyle(
          fontFamily: "Poppins",
          fontSize: 13,
          color: lightFontColor,
          fontWeight: FontWeight.w500,
        ),
        labelSmall: TextStyle(
          fontFamily: "Poppins",
          fontSize: 13,
          color: Color.fromARGB(255, 13, 13, 13),
          fontWeight: FontWeight.w300,
        ), //
      ));

  static final darkTheme = ThemeData(
      useMaterial3: true,
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: darkBgColor,
        filled: true,
        enabledBorder: InputBorder.none,
        prefixIconColor: darkLableColor,
        labelStyle: TextStyle(
          fontFamily: "Poppins",
          fontSize: 15,
          color: darkFontColor,
          fontWeight: FontWeight.w500,
        ), // TextStyle
        hintStyle: TextStyle(
          fontFamily: "Poppins",
          fontSize: 15,
          color: darkFontColor,
          fontWeight: FontWeight.w500,
        ), // TextStyle
      ), // InputDecoration Theme
      colorScheme: ColorScheme.dark(
        brightness: Brightness.dark,
        background: darkBgColor,
        onBackground: darkFontColor,
        primaryContainer: darkDivColor,
        onPrimaryContainer: darkFontColor,
        secondaryContainer: darkLableColor,
        onSecondaryContainer: Colors.black,
        primary: darkPrimaryColor,
      ), // ColorScheme.light
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontFamily: "Poppins",
          fontSize: 24,
          color: darkFontColor,
          fontWeight: FontWeight.w700,
        ), // TextStyle
        headlineMedium: TextStyle(
          fontFamily: "Poppins",
          fontSize: 20,
          color: darkFontColor,
          fontWeight: FontWeight.w600,
        ), // TextStyle
        headlineSmall: TextStyle(
          fontFamily: "Poppins",
          fontSize: 15,
          color: darkFontColor,
          fontWeight: FontWeight.w600,
        ), //
        bodyLarge: TextStyle(
          fontFamily: "Poppins",
          fontSize: 16,
          color: darkFontColor,
          fontWeight: FontWeight.w500,
        ), // TextStyle

        bodyMedium: TextStyle(
          fontFamily: "Poppins",
          fontSize: 15,
          color: darkFontColor,
          fontWeight: FontWeight.w400,
        ), // TextStyle

        bodySmall: TextStyle(
          fontFamily: "Poppins",
          fontSize: 13,
          color: darkBgColor,
          fontWeight: FontWeight.w500,
        ),
        labelSmall: TextStyle(
          fontFamily: "Poppins",
          fontSize: 13,
          color: Color.fromARGB(255, 176, 174, 188),
          fontWeight: FontWeight.w300,
        ), //
      ));
}
