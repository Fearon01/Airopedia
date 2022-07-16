import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLogin extends ChangeNotifier 
{
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _account;

  GoogleSignInAccount get user 
  {
    return _account!;
  }

  Future Login() async 
  {
    final googleUser = await googleSignIn.signIn();

    if (googleUser == null) {return;}

    _account = googleUser;

    final auth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: auth.accessToken,
      idToken: auth.idToken,

    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    notifyListeners();
  }


}