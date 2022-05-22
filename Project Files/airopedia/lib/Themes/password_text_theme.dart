import 'package:flutter/material.dart';

ThemeData LightMode() => ThemeData(
  textTheme: const TextTheme (
    titleMedium: TextStyle (
      fontFamily: 'Roboto',
      fontSize: 12,
      color: Color(0xfff7f3e8)
    ),
    
    bodyMedium: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 18,
      color: Color(0xfff7f3e8)
    )
  ), 
);