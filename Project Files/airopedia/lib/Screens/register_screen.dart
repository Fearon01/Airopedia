import 'package:airopedia/Widgets/login_link_text_widget.dart';
import 'package:airopedia/Widgets/register_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:airopedia/Widgets/email_widget.dart';
import 'package:airopedia/Widgets/password_field_widget.dart';


class RegisterScreen extends StatelessWidget 
{
  late EmailWidget emailWidget;
  late PasswordField passwordWidget;
  late PasswordField confirmPasswordWidget;
  late RegisterButton registerButton;

  RegisterScreen({Key? key}) : super(key: key) 
  {
    // Initialise widgets so they can access one another
    emailWidget = EmailWidget();
    passwordWidget = PasswordField(text: 'Password');
    confirmPasswordWidget = PasswordField(text: 'Confirm Password');
    registerButton = RegisterButton(emailController: emailWidget.controller, passwordController: passwordWidget.controller, confirmPasswordController: confirmPasswordWidget.controller);

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
        // Screen title
        child: Text(
        'Register', 
        style: TextStyle(
          fontFamily: 'HVD_Comic_Serif_Pro', 
          fontSize: 42,
          color: Color(0xfff7f3e8),
            ),
        
          ),
        ),
        emailWidget,
        passwordWidget,
        confirmPasswordWidget,
        registerButton,
        LoginText(context)
        ],
      ),
    ),
  ); 
}