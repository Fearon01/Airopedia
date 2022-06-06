import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

final buttons = <Widget>[
      const Icon(Icons.remove_red_eye, size: 30, color: Color(0xff0d67b5)),
      const Icon(Icons.settings, size: 30, color: Color(0xff0d67b5)),
      const Icon(Icons.home, size: 30, color: Color(0xff0d67b5)),
      const Icon(Icons.favorite, size: 30, color: Color(0xff0d67b5)),
      const Icon(Icons.arrow_circle_left, size: 30, color: Color(0xff0d67b5))
    ];

Widget CustomNavigationBar(int pageIndex) => CurvedNavigationBar(
      items: buttons,
      index: pageIndex,
      height: 60,
      backgroundColor: Colors.transparent,
    );