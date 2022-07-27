import 'package:airopedia/Widgets/language_button.dart';
import 'package:flutter/material.dart';

class PersonalisationSettingsScreen extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color(0xff0d67b5),
      body: Center(
        child: ListView (
        padding: const EdgeInsets.only(top: 100.0),
        children:  [
          const Align(
        alignment: Alignment.topCenter,
        child: Text(
        'Personalisation', 
        style: TextStyle(
          fontFamily: 'HVD_Comic_Serif_Pro',
          fontSize: 42,
          color: Color(0xfff7f3e8),
            ),
                      ),
        ),
        LanguageButton(context)
        ],
      )
      )
  );

}