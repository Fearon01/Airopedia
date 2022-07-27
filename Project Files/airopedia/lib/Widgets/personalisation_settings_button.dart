import 'package:airopedia/Screens/personalisation_settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/cupertino.dart';

Widget PersonalisationSettingsButton(BuildContext context) => Padding 
(
  padding: const EdgeInsets.only(top: 19.0, left: 20.0, right: 20.0),
  child: TextButton(
    onPressed: () => Navigator.push(context, MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => PersonalisationSettingsScreen())),
    style: ButtonStyle(
      minimumSize: MaterialStateProperty.all<Size>(const Size(320.0, 100.0)),
      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xfff7f3e8)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35.0),
        side: const BorderSide(color: Color(0xfff7f3e8))
        )
      )
    ),
    child: const ListTile(
          leading: Icon(CupertinoIcons.pencil, size: 50.0, color: const Color(0xff0d67b5)),
          title:  Text('Personalisation', style: TextStyle(fontFamily: 'Roboto', fontSize: 18, color: const Color(0xff0d67b5))),
          subtitle:  Text('   Change Password, Log Out, Name, Notifications', style: TextStyle(fontFamily: 'Roboto', fontSize: 9, color: const Color(0xff0d67b5))),
        ),
    ),
);