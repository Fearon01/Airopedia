import 'package:flutter/material.dart';

Widget SearchBar() => Container 
(
  margin: const EdgeInsets.only(top: 19.0, left: 36.0, right: 36.0),
  child: SizedBox(
    height: 36.0,
    width: 288.0,
    child: TextField(
      style: const TextStyle(
          fontFamily: 'Roboto',
          fontSize: 14,
          color:Color(0xff0d67b5)
        ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
        fillColor: const Color(0xfff7f3e8),
        filled: true,
        prefixIcon: const Icon(Icons.search, color: Color(0xff0d67b5)),
        hintText: 'Search here',
        hintStyle: const TextStyle(
          fontFamily: 'Roboto',
          fontSize: 14,
          color:Color(0xff0d67b5)
        ),
        border: OutlineInputBorder
        (
          borderRadius: BorderRadius.circular(35),
          borderSide: const BorderSide(color: Color(0xff0d67b5))
        )
      ),
    ),
  ),
);