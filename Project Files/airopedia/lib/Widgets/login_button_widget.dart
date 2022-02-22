import 'package:flutter/material.dart';

Widget LoginButton() => Padding(
  padding: EdgeInsets.only(left: 55.0, right: 55.0, top: 58.0),
  child: TextButton
  (
    onPressed: null,
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Color(0xfff7f3e8)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35.0),
        side: const BorderSide(color: Color(0xfff7f3e8))
        )
      )
    ),
    child: const Text(
      'LOGIN',
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 12,
        color:Color(0xff0d67b5)
      ),
    ),
  ),
);