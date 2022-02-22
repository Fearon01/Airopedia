import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

Widget SignUpText() =>    Align
(   alignment: Alignment.center,
    child: Padding(
      padding: const EdgeInsets.only(top: 33.0),
      child: RichText(
        text: TextSpan(
          children: [
            const TextSpan(
              text: 'Don’t have an account?',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 14,
                color: Color(0xfff7f3e8),
              ),
            ),
            TextSpan(
              text: 'SignUp',
              recognizer: TapGestureRecognizer()..onTap = () {// Put code to register screen in here
              },
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 14,
                color: Color(0xfff7f3e8),
                decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    ),
  ),
); 