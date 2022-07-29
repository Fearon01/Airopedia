import 'package:airopedia/Screens/home_screen.dart';
import 'package:airopedia/Screens/login_screen.dart';
import 'package:airopedia/Screens/no_connection_screen.dart';
import 'package:airopedia/Scripts/favourite_database.dart';
import 'package:airopedia/Widgets/navigation_bar.dart';
import 'package:airopedia/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Geolocator.requestPermission();

  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => GoogleLogin(),
      child:
          MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen())));
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key})
      : super(key: key);

  PageState createState() => PageState();
}

class PageState extends State<MainPage> {
  
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: const Color(0xff0d67b5),
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return ConnectionLostScreen(context: context);
            } else if (snapshot.hasData) {
              return screens[pageIndex] ?? const HomeScreen();
            } else {
              return LoginScreen();
            }
          }),
      bottomNavigationBar: CurvedNavigationBar(
        items: buttons,
        index: pageIndex,
        height: 60,
        key: navigationKey,
        backgroundColor: Colors.transparent,
        onTap: (int index) {
          // Change page when back button hit - I'm pretty proud of this feature. Hopefully it doesn't break 
          if (index == 4) {
            if (route.length == 1) {
              // Go to home if last route
              route.Pop();
              setState(() => pageIndex = 2);
              return;
            } else if (route.length < 1) {
              // Stop popping an empty stack
              return;
            }

            route.Pop();
            screens.last = route.Peek;
          } else {
            route.Push(screens[index]!);
          }

          setState(() => pageIndex = index);
        },
      ));
}
