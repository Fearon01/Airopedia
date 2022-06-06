import 'package:flutter/material.dart';

Widget RecentlyVisitedButton() =>    Padding 
(
  padding: EdgeInsets.only(top:19.0, left: 20.0, right: 20.0),
  child: TextButton(
    onPressed: null,
    style: ButtonStyle(
      minimumSize: MaterialStateProperty.all<Size>(const Size(320.0, 50.0)),
      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xfff7f3e8)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35.0),
        side: const BorderSide(color: Color(0xfff7f3e8))
        ),
      ),
    ),
    child:
      const Padding(
      padding: EdgeInsets.only(right: 162.0),
      child: Text(
        'Recently Visited',
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 18,
          color:Color(0xff0d67b5)
        ),
      ),
    ),
  ),
);