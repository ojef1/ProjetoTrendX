import 'package:flutter/material.dart';

final ThemeData tema = ThemeData();

//classe responsável pelo design do app baseado no tema (claro/escuro)
class ThemeConfig {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    colorScheme: tema.colorScheme.copyWith(
      primary: const Color.fromRGBO(238, 238, 238, 1),
      secondary: const Color.fromARGB(166, 0, 0, 0),
    ),
    textTheme: tema.textTheme.copyWith(
      titleLarge: const TextStyle(
        fontFamily: 'Quicksand',
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        shadows: [Shadow(color: Colors.black, blurRadius: 2)],
      ),
      titleMedium: const TextStyle(
        fontFamily: 'Quicksand',
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        shadows: [Shadow(color: Colors.black, blurRadius: 2)],
      ),
      titleSmall: const TextStyle(
        fontFamily: 'Quicksand',
        color: Colors.black38,
        fontSize: 18,
        shadows: [Shadow(color: Colors.black, blurRadius: 2)],
      ),
      labelLarge: const TextStyle(
        fontFamily: 'Quicksand',
        color: Colors.white,
        fontSize: 18,
        shadows: [Shadow(color: Colors.black, blurRadius: 2)],
      ),
      labelMedium: const TextStyle(
        fontFamily: 'Quicksand',
        color: Colors.black38,
        fontSize: 18,
        shadows: [Shadow(color: Colors.black, blurRadius: 2)],
      ),
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontFamily: 'Quicksand',
        color: Colors.black,
        fontSize: 26,
        fontWeight: FontWeight.bold,
        shadows: [Shadow(color: Colors.black, blurRadius: 2)],
      ),
    ),
    useMaterial3: true,
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: tema.colorScheme.copyWith(
      primary: const Color.fromARGB(166, 0, 0, 0),
      secondary: const Color.fromRGBO(238, 238, 238, 1),
    ),
    textTheme: tema.textTheme.copyWith(
        titleLarge: const TextStyle(
          fontFamily: 'Quicksand',
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          shadows: [Shadow(color: Colors.black, blurRadius: 5)],
        ),
        titleMedium: const TextStyle(
          fontFamily: 'Quicksand',
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          shadows: [Shadow(color: Colors.black, blurRadius: 2)],
        ),
        titleSmall: const TextStyle(
          fontFamily: 'Quicksand',
          color: Colors.white,
          fontSize: 18,
          shadows: [Shadow(color: Colors.black, blurRadius: 2)],
        ),
        labelLarge: const TextStyle(
          fontFamily: 'Quicksand',
          color: Colors.black,
          fontSize: 18,
          shadows: [Shadow(color: Colors.black, blurRadius: 2)],
        ),
        labelMedium: const TextStyle(
          fontFamily: 'Quicksand',
          color: Colors.white54,
          fontSize: 18,
          shadows: [Shadow(color: Colors.black, blurRadius: 2)],
        )),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontFamily: 'Quicksand',
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        shadows: [Shadow(color: Colors.black, blurRadius: 2)],
      ),
    ),
    useMaterial3: true,
  );
}
