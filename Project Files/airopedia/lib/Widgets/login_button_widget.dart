import 'package:airopedia/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginButton extends StatelessWidget 
{
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginButton({Key? key,  required this.emailController, required this.passwordController}): super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
  padding: const EdgeInsets.only(left: 55.0, right: 55.0, top: 58.0),
  child: TextButton
  (
    onPressed: () {
      Login(context);
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
      'LOGIN',
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 12,
        color:Color(0xff0d67b5)
      ),
    ),
  ),
);

Future Login(BuildContext context) async 
{
  await FirebaseAuth.instance.signInWithEmailAndPassword
  (
    email: emailController.text.trim(),
    password: passwordController.text.trim()
  );

  Navigator.pushAndRemoveUntil<dynamic>(
        context,
        MaterialPageRoute<dynamic>(builder: (BuildContext context) => const MainPage()),
        (route) => false);

}

}

