import 'package:airopedia/Screens/login_screen.dart';
import 'package:airopedia/Screens/home_screen.dart';
import 'package:airopedia/Screens/settings_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: SettingsScreen(),
    );
  }
}