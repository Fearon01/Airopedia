import 'package:airopedia/Screens/login_screen.dart';
import 'package:airopedia/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPasswordButton extends StatelessWidget 
{
  final TextEditingController emailController;

  const ResetPasswordButton({Key? key,  required this.emailController}): super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
  padding: const EdgeInsets.only(left: 55.0, right: 55.0, top: 58.0),
  child: TextButton
  (
    onPressed: () {
      ResetPassword();
      Navigator.pop(context);
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
      'RESET PASSWORD',
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 12,
        color:Color(0xff0d67b5)
      ),
    ),
  ),
);

Future ResetPassword() async 
{
  await FirebaseAuth.instance.sendPasswordResetEmail
  (
    email: emailController.text.trim()
  );

}

}