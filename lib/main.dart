import 'package:flutter/material.dart';
import 'package:lumiere/screens/homepage.dart';
import 'package:lumiere/screens/bluetooth_connection.dart';
import 'package:lumiere/screens/about.dart';
import 'package:lumiere/screens/settings.dart';
import 'package:lumiere/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // remove banner
      initialRoute: '/homepage',
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/homepage': (context) => HomePage(),
        '/settingspage': (context) => Settings(),
        '/aboutpage': (context) => About(),
        '/connectionpage': (context) => BluetoothConnection(),
      },
    );
  }
}
