import 'package:airopedia/Widgets/account_settings_button.dart';
import 'package:flutter/material.dart';
import 'package:airopedia/Widgets/personalisation_settings_button';

class SettingsScreen extends StatelessWidget 
{
  const SettingsScreen({Key? key}) : super(key: key);
  @override

  Widget build(BuildContext context) => Scaffold(
     backgroundColor: const Color(0xff0d67b5),
     body: Center(
      child: ListView(
        padding: const EdgeInsets.only(top: 100.0),
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: Text(
              'Settings',
              style: TextStyle(
                fontFamily: 'HVD_Comic_Serif_Pro',
                fontSize: 42,
                color: Color(0xfff7f3e8),
              ),
            ),
          ),
        AccountSettingsButton(),
        PersonalisationSettingsButton()
        ],
      ),
    ),
  ); 
}