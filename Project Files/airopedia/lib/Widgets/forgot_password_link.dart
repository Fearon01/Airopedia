import 'package:airopedia/Screens/forgot_password_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

Widget ForgotPasswordLink(BuildContext context) =>    Align
(   alignment: Alignment.center,
    child: Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: RichText(
        text: TextSpan(
          children: [ TextSpan(
              text: 'Forgotten Password?',
              recognizer: TapGestureRecognizer()..onTap = () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgotPasswordScreen())),
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