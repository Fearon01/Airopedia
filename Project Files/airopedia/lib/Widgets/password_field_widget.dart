import 'package:flutter/material.dart';

Widget PasswordField(String text) =>    Column 
(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Padding (
    padding: const EdgeInsets.only(left:30.0, top: 75.0),
    child: Text(
      text,
      style: const TextStyle(
        fontFamily: 'Roboto',
        fontSize: 12,
        color: Color(0xfff7f3e8),
      ),
      ),
    ), 
    const Padding(
    padding: EdgeInsets.only(left: 30.0, right: 30.0),
    child: TextField(
      maxLength: 24,
    keyboardType: TextInputType.visiblePassword,
    obscureText: true,
    style: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 18,
      color: Color(0xfff7f3e8),
      ),
    textInputAction: TextInputAction.done,
    decoration: InputDecoration(
      counterText: '',
      // Normal border colour when input is enabled 
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xfff7f3e8)),
        ),
      // Border colour when TextField is selected
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xfff7f3e8)),
          ),
        ),
      ),
    ),
  ],
);