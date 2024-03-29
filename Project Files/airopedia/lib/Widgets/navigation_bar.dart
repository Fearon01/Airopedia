import 'package:airopedia/DataStructures/route_stack.dart';
import 'package:airopedia/Screens/favourites_screen.dart';
import 'package:airopedia/Screens/home_screen.dart';
import 'package:airopedia/Screens/login_screen.dart';
import 'package:airopedia/Screens/observations_screen.dart';
import 'package:airopedia/Screens/settings_screen.dart';
import 'package:airopedia/main.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';


int pageIndex = 2;

final route = RouteStack();

final navigationKey = GlobalKey<CurvedNavigationBarState>();

final screens = [
  ObservationsScreen(),
  const SettingsScreen(),
  const HomeScreen(),
  FavouritesScreen(),
  null
];

final buttons = <Widget>[
      const Icon(Icons.remove_red_eye, size: 30, color: Color(0xff0d67b5)),
      const Icon(Icons.settings, size: 30, color: Color(0xff0d67b5)),
      const Icon(Icons.home, size: 30, color: Color(0xff0d67b5)),
      const Icon(Icons.favorite, size: 30, color: Color(0xff0d67b5)),
      const Icon(Icons.arrow_circle_left, size: 30, color: Color(0xff0d67b5))
    ];
