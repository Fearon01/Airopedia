import 'package:airopedia/Widgets/navigation_bar.dart';
import 'package:airopedia/Widgets/sign_out_button.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountSettingsScreen extends StatelessWidget 
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
        'Account Settings', 
        style: TextStyle(
          fontFamily: 'HVD_Comic_Serif_Pro',
          fontSize: 42,
          color: Color(0xfff7f3e8),
            ),
        
          ),
        ),
        SignOutButton(context)
        ],
      )
      ),
    bottomNavigationBar: CurvedNavigationBar(
          items: buttons,
          index: pageIndex,
          height: 60,
          backgroundColor: Colors.transparent,
          onTap: (int index) {
            if (index == 4) {
              if (route.length == 1) {
                Navigator.pop(
                    context);
                    
                route.Pop();
                return;
              } else if (route.length < 1) {
                Navigator.pop(
                    context);
                    return; 
              }

              screens.last = route.Peek;
              Navigator.pop(context);
            } else {
              route.Push(screens[index]!);
            }

            pageIndex = index;
            Navigator.pop(
                context);
          },
        )
  );

}