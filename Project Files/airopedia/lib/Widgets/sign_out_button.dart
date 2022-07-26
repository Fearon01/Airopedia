import 'package:airopedia/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Widget SignOutButton(BuildContext context) => Padding(padding: EdgeInsets.only(top: 32.0, left: 20.0, right: 20.0), 
child: TextButton(style: ButtonStyle(
      minimumSize: MaterialStateProperty.all<Size>(const Size(320.0, 50.0)),
      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xfff7f3e8)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35.0),
        side: const BorderSide(color: Color(0xfff7f3e8))
        )
      )
    ),
    onPressed: () {  
      FirebaseAuth.instance.signOut();

      Navigator.pushAndRemoveUntil<dynamic>(
        context,
        MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => const MainPage()),
        (route) => false);
      
    },
    child: Padding(padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 126.0, right: 126.0), child: Text('Sign Out', style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 18,
          color:Color(0xff0d67b5)
        ))),
    )
);