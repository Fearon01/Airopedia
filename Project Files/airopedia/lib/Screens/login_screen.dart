import 'package:airopedia/Widgets/forgot_password_link.dart';
import 'package:airopedia/Widgets/login_button_google_widget.dart';
import 'package:airopedia/google_sign_in.dart';
import 'package:airopedia/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:airopedia/Widgets/email_widget.dart';
import 'package:airopedia/Widgets/login_button_widget.dart';
import 'package:airopedia/Widgets/login_button_facebook_widget.dart';
import 'package:airopedia/Widgets/signup_link_text_widget.dart';
import 'package:airopedia/Widgets/password_field_widget.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  late EmailWidget emailWidget;
  late PasswordField passwordWidget;
  late LoginButton loginButton;

  LoginScreen({Key? key}) : super(key: key) {
    // Initialise widgets so they can access one another
    emailWidget = EmailWidget();
    passwordWidget = PasswordField(text: 'Password');
    loginButton = LoginButton(
        emailController: emailWidget.controller,
        passwordController: passwordWidget.controller);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
          backgroundColor: const Color(0xff0d67b5),
          // Check if login changes
          body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('ERROR!'));
              } else if (snapshot.hasData) {
                return const MainPage();
              } else {
                return Center(
                  child: ListView(
                    padding: const EdgeInsets.only(top: 100.0),
                    children: [
                      const Align(
                        alignment: Alignment.topCenter,
                        // Screen title
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontFamily: 'HVD_Comic_Serif_Pro',
                            fontSize: 42,
                            color: Color(0xfff7f3e8),
                          ),
                        ),
                      ),
                      emailWidget,
                      passwordWidget,
                      loginButton,
                      LoginButtonGoogle(context),
                      // Implementing Facebook login at later date as it's not a priority
                      //LoginButtonFacebook(),
                      ForgotPasswordLink(context),
                      SignUpText(context)
                    ],
                  ),
                );
                ;
              }
            },
          ),
      );
}
