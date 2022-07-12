import 'package:airopedia/Screens/register_screen.dart';
import 'package:airopedia/Screens/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

Widget SignUpText(BuildContext context) =>    Align
(   alignment: Alignment.center,
    child: Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: RichText(
        text: TextSpan(
          children: [
            const TextSpan(
              text: 'Don’t have an account?  ',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 14,
                color: Color(0xfff7f3e8),
              ),
            ),
            TextSpan(
              text: 'SignUp',
              recognizer: TapGestureRecognizer()..onTap = () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()));
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