import 'package:airopedia/google_sign_in.dart';
import 'package:airopedia/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget LoginButtonGoogle(BuildContext context) => Padding(
  padding: EdgeInsets.only(left: 55.0, right: 55.0, top: 29.0),
  child: TextButton
  (
    onPressed: () {
      final provider = Provider.of<GoogleLogin>(context, listen: false);
      provider.Login(context);
    },
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
      'LOGIN WITH GOOGLE',
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 12,
        color:Color(0xff0d67b5)
      ),
    ),
  ),
);