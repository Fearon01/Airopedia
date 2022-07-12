import 'package:airopedia/Screens/login_screen.dart';
import 'package:airopedia/Widgets/error_notification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget 
{
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const RegisterButton({Key? key,  required this.emailController, required this.passwordController, required this.confirmPasswordController}): super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
  padding: EdgeInsets.only(left: 55.0, right: 55.0, top: 85.0),
  child: TextButton
  (
    onPressed: () 
    {
      if (passwordController.text != confirmPasswordController.text) 
      {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: ErrorNotification(errorTitle: 'ERROR', errorDescription: 'Passwords Must Match!'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          )
        );
      }
      else if (passwordController.text == '' || confirmPasswordController.text == '' || emailController.text == '') 
      {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: ErrorNotification(errorTitle: 'ERROR', errorDescription: 'All Fields Must Be Filled!'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          )
        );
      }
      else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailController.text)) 
      {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: ErrorNotification(errorTitle: 'ERROR', errorDescription: 'Please Enter Valid Email!'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          )
        );
      }
      else 
      {
        SignUp(context);
      }
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
      'Register',
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 12,
        color:Color(0xff0d67b5)
        ),
      ),
    ),
  );

  Future SignUp(BuildContext context) async 
  {
    showDialog(context: context, barrierDismissible: false, builder: (context) => Center(child: CircularProgressIndicator()));

    await FirebaseAuth.instance.createUserWithEmailAndPassword
    (email: emailController.text.trim(), 
    password: passwordController.text.trim());

    Navigator.pushAndRemoveUntil<dynamic>(
        context,
        MaterialPageRoute<dynamic>(builder: (BuildContext context) => LoginScreen()),
        (route) => false);
  }
}