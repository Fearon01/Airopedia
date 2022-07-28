import 'package:airopedia/Screens/no_connection_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLogin extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _account;

  GoogleSignInAccount get user {
    return _account!;
  }

  Future Login(BuildContext context) async {
    try {
      final googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        Navigator.push(
          context,
          MaterialPageRoute<dynamic>(
              builder: (BuildContext context) =>
                  ConnectionLostScreen(context: context)));
        return;
      }

      _account = googleUser;

      final auth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: auth.accessToken,
        idToken: auth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } on PlatformException catch (error) {
      Navigator.push(
          context,
          MaterialPageRoute<dynamic>(
              builder: (BuildContext context) =>
                  ConnectionLostScreen(context: context)));
      return;
    }
    notifyListeners();
  }
}
