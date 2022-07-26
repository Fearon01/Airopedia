import 'package:airopedia/Screens/account_settings_screen.dart';
import 'package:flutter/material.dart';

Widget AccountSettingsButton(BuildContext context) =>    Padding 
(
  padding: const EdgeInsets.only(top: 19.0, left: 20.0, right: 20.0),
  child: TextButton(
    onPressed: null,
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
    child: ListTile(
          leading: const Icon(Icons.account_box, size: 50.0, color: Color(0xff0d67b5)),
          title:  const Text('Account Settings', style: TextStyle(fontFamily: 'Roboto', fontSize: 18, color: Color(0xff0d67b5))),
          subtitle:  const Text('   Notifications, Sign Out', style: TextStyle(fontFamily: 'Roboto', fontSize: 9, color: Color(0xff0d67b5))),
          onTap: () {Navigator.push(context, MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => AccountSettingsScreen()));},
        ),
    ),
);