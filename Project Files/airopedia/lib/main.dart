
import 'package:airopedia/Widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const MainPage()));
}

class MainPage extends StatefulWidget 
{
  const MainPage({Key? key}) : super(key: key);

  PageState createState() => PageState();
}

class PageState extends State<MainPage> 
{
  final navigationKey = GlobalKey<CurvedNavigationBarState>();

   int pageIndex = 2;
  
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      backgroundColor: const Color(0xff0d67b5),
      body: screens[pageIndex],
      bottomNavigationBar: CurvedNavigationBar(
        items: buttons,
        index: pageIndex,
        height: 60,
        key: navigationKey,
        backgroundColor: Colors.transparent,
        onTap: (int index){ 

          if (index == 4) 
          {
            if (route.length == 1) 
            {
              route.Pop();
              setState(() => pageIndex = 2);
              return;
            }
            else if (route.length < 1) 
            {
              return;
            }

            route.Pop();
            screens.last = route.Peek;
          }
          else {route.Push(screens[index]!);}

          setState(() => pageIndex = index);
          },
      )

    );
  }
}