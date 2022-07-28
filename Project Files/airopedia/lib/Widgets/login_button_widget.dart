import 'package:airopedia/Screens/no_connection_screen.dart';
import 'package:airopedia/Widgets/error_notification.dart';
import 'package:airopedia/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginButton(
      {Key? key,
      required this.emailController,
      required this.passwordController})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 55.0, right: 55.0, top: 58.0),
        child: TextButton(
          onPressed: () {
            Login(context);
          },
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xfff7f3e8)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.0),
                      side: const BorderSide(color: Color(0xfff7f3e8))))),
          child: const Text(
            'LOGIN',
            style: TextStyle(
                fontFamily: 'Roboto', fontSize: 12, color: Color(0xff0d67b5)),
          ),
        ),
      );

  Future Login(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (error) {
      String errorCode = error.code;

      switch (errorCode) {
        case 'wrong-password':
          {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: ErrorNotification(
                  errorTitle: 'Incorrect Password',
                  errorDescription: 'The password you entered is incorrect!'),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ));
          }
          return;

        case 'user-not-found':
          {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: ErrorNotification(
                  errorTitle: 'User Not Found',
                  errorDescription: 'There are no users with this email!'),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ));
          }
          return;

        case 'invalid-email':
          {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: ErrorNotification(
                  errorTitle: 'Invalid Email',
                  errorDescription:
                      'The email you entered is not a valid email!'),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ));
          }
          return;

        case 'too-many-requests':
          {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: ErrorNotification(
                  errorTitle: 'Too Many Requests',
                  errorDescription:
                      'Account locked after too many login attempts, try again later!'),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ));
          }
          return;

        default:
          Navigator.push(
              context,
              MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) =>
                      ConnectionLostScreen(context: context)));
          return;
      }
    }

    Navigator.pushAndRemoveUntil<dynamic>(
        context,
        MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => const MainPage()),
        (route) => false);
  }
}
