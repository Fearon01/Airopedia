import 'package:airopedia/Widgets/reset_password_button.dart';
import 'package:flutter/material.dart';
import 'package:airopedia/Widgets/email_widget.dart';

class ForgotPasswordScreen extends StatelessWidget 
{
  late EmailWidget emailWidget;
  late ResetPasswordButton resetButton;

  ForgotPasswordScreen({Key? key}) : super(key: key) 
  {
    emailWidget = EmailWidget();
    resetButton = ResetPasswordButton(emailController: emailWidget.controller);
  }


  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color(0xff0d67b5),
    body: Center(
      child: ListView (
        padding: const EdgeInsets.only(top: 100.0),
        children: [
          const Align(
        alignment: Alignment.topCenter,
        child: Text(
        'Forgot Password', 
        style: TextStyle(
          fontFamily: 'HVD_Comic_Serif_Pro',
          fontSize: 42,
          color: Color(0xfff7f3e8),
            ),
        
          ),
        ),
        emailWidget,
        resetButton,
        ],
      ),
    ),
  ); 
}