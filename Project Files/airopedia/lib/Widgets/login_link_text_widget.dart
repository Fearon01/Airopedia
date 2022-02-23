import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:airopedia/Screens/login_screen.dart';

Widget LoginText(BuildContext context) =>    Align
(   alignment: Alignment.center,
    child: Padding(
      padding: const EdgeInsets.only(top: 33.0),
      child: RichText(
        text: TextSpan(
          children: [
            const TextSpan(
              text: 'Already have an account?',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 14,
                color: Color(0xfff7f3e8),
              ),
            ),
            TextSpan(
              text: 'Login',
              recognizer: TapGestureRecognizer()..onTap = () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
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