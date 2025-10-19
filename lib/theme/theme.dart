import 'package:flutter/material.dart';
import 'package:lumiere/functions/switch_theme.dart';

// Light Theme - Blue
final ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  // Defining default colorscheme to have preconfigured colors
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF468df3), // Light blue
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
  cardTheme: CardThemeData(
    color: Colors.blue[50],
    shape: RoundedRectangleBorder(
      side: BorderSide(color: Color(0xFFd6e3ff), width: 1.0),
      borderRadius: BorderRadius.circular(15),
    ),
  ),
  sliderTheme: SliderThemeData(
    activeTrackColor: Color(0xFF468df3),
    inactiveTrackColor: Colors.grey,
  ),
  iconTheme: IconThemeData(color: Color(0xFF44474e)),
  // Theme for custom widget
  extensions: <ThemeExtension<dynamic>>[
    const ToggleSwitchThemeExtension(
      activeBgColor: Color(0xFF2c292f),
      activeFgColor: Color(0xFFd8bafa),
      inactiveBgColor: Colors.grey,
      inactiveFgColor: Colors.black,
      borderColor: Colors.blue,
      borderWidth: 2.0,
      cornerRadius: 8.0,
    ),
  ],
);

// Dark Theme - Purple
final ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFFBB86FC), // Purple
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
  cardTheme: CardThemeData(
    color: Color(0xFF58575a),
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: Colors.grey, width: 1.0),
      borderRadius: BorderRadius.circular(15),
    ),
  ),
  sliderTheme: SliderThemeData(
    activeTrackColor: const Color(0xFFBB86FC),
    inactiveTrackColor: Colors.white,
  ),
  iconTheme: IconThemeData(color: Color(0xFFccc4cf)),
  extensions: <ThemeExtension<dynamic>>[
    const ToggleSwitchThemeExtension(
      activeBgColor: Color(0xFF2c292f),
      activeFgColor: Color(0xFFd8bafa),
      inactiveBgColor: Colors.grey,
      inactiveFgColor: Colors.black,
      borderColor: Colors.blue,
      borderWidth: 2.0,
      cornerRadius: 8.0,
    ),
  ],
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
