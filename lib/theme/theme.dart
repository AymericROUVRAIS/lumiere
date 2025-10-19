import 'package:flutter/material.dart';

// Light Theme - Blue
final ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  // Defining default colorscheme to cover all ground automatically
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color(0xFF468df3), // Light blue
    brightness: Brightness.light,
  ),
  scaffoldBackgroundColor: const Color(0xFFEAF3FA), // Soft blue
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFEAF3FA), // Blue Color(0xFF458cf2)
    foregroundColor: Colors.black,
    elevation: 0,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: Colors.white),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color: Color(0xFF1E1E2E)),
    bodySmall: TextStyle(color: Colors.black),
  ),
  cardTheme: CardThemeData(color: Colors.blue[50]),
  sliderTheme: SliderThemeData(
    activeTrackColor: Color(0xFF468df3),
    inactiveTrackColor: Colors.grey,
  ),
  iconTheme: IconThemeData(color: Color(0xFF44474e)),
);

// Dark Theme - Purple
final ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color(0xFFBB86FC), // Purple
    brightness: Brightness.dark,
  ),
  scaffoldBackgroundColor: const Color(0xFF121C2B), // Deep navy
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1C2B3A),
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: Color(0xFFEAEAEA)),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Color(0xFFEAEAEA)),
    bodySmall: TextStyle(),
  ),
  cardTheme: CardThemeData(color: Color(0xFF58575a)),
  sliderTheme: SliderThemeData(
    activeTrackColor: Color(0xFF468df3),
    inactiveTrackColor: Colors.blue[50],
    inactiveTickMarkColor: Colors.grey,
  ),
  iconTheme: IconThemeData(color: Color(0xFFccc4cf)),
);

// Custom theme for widgets
TextStyle leadingTextStyle(BuildContext context) {
  return TextStyle(
    color: Theme.of(context).textTheme.bodyLarge?.color,
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
}

TextStyle subTextStyle(BuildContext context) {
  return TextStyle(color: Theme.of(context).textTheme.bodySmall?.color);
}
