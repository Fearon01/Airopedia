import 'package:airopedia/Screens/change_language_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget LanguageButton(BuildContext context) => Padding(
      padding: const EdgeInsets.only(top: 48.0, left: 20.0, right: 20.0),
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
          color: const Color(0xfff7f3e8),
          child: ListTile(
              leading:
                  const Icon(CupertinoIcons.compass, color: Color(0xff0d67b5)),
              trailing: Icon(Icons.arrow_back_ios, color: Color(0xff0d67b5)),
              textColor: const Color(0xff0d67b5),
              title: const Text('Language', style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 18,
                          color: Color(0xff0d67b5))),
              subtitle: Text('English',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          color: Color(0xff0d67b5))),
              onTap: () => Navigator.push(context, MaterialPageRoute<dynamic>(
                builder: (BuildContext context) => LanguageScreen())))),
    );
