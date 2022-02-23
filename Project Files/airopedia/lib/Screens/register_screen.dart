import 'package:airopedia/Widgets/confirm_password_widget.dart';
import 'package:airopedia/Widgets/login_link_text_widget.dart';
import 'package:airopedia/Widgets/register_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:airopedia/Widgets/email_widget.dart';
import 'package:airopedia/Widgets/password_widget.dart';

class RegisterScreen extends StatelessWidget 
{
  const RegisterScreen({Key? key}) : super(key: key);

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
        'Register', 
        style: TextStyle(
          fontFamily: 'HVD_Comic_Serif_Pro',
          fontSize: 42,
          color: Color(0xfff7f3e8),
            ),
        
          ),
        ),
        EmailField(),
        PasswordField(),
        ConfirmPasswordField(),
        RegisterButton(),
        LoginText(context)
        ],
      ),
    ),
  ); 
}