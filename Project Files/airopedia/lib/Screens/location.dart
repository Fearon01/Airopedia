import 'package:airopedia/DataStructures/favourite_city.dart';
import 'package:airopedia/Screens/home_screen.dart';
import 'package:airopedia/Screens/observation_edit_screen.dart';
import 'package:airopedia/Scripts/favourite_database.dart';
import 'package:airopedia/Widgets/favourite_button.dart';
import 'package:airopedia/Widgets/navigation_bar.dart';
import 'package:airopedia/main.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import 'package:intl/intl.dart';

class LocationScreen extends StatelessWidget {
  final Map<String, dynamic> locationData;
  late Color favouriteForeground;
  late Color favoriteBackground;

  LocationScreen({Key? key, required this.locationData}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xff0d67b5),
        body: Center(
          child: ListView(
            padding: const EdgeInsets.only(top: 100.0),
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  locationData["city"],
                  style: const TextStyle(
                    fontFamily: 'HVD_Comic_Serif_Pro',
                    fontSize: 42,
                    color: Color(0xfff7f3e8),
                  ),
                ),
              ),
              Container(
                height: 68.0,
                margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text("Time",
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                color: Color(0xff0d67b5))),
                        Text(
                          DateFormat('HH:mm:ss').format(
                            DateTime.parse(
                                locationData["current"]["weather"]["ts"]),
                          ),
                          style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              color: Color(0xff0d67b5)),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text("State",
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                color: Color(0xff0d67b5))),
                        Text(locationData["state"],
                            style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                color: Color(0xff0d67b5)))
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text("Country",
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                color: Color(0xff0d67b5))),
                        Text(locationData["country"],
                            style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                color: Color(0xff0d67b5)))
                      ],
                    )
                  ],
                ),
                decoration: const BoxDecoration(
                    color: Color(0xfff7f3e8),
                    borderRadius: BorderRadius.all(Radius.circular(35.0))),
              ),
              Container(
                  height: 160.0,
                  margin:
                      const EdgeInsets.only(top: 39.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.only(top: 15.0, left: 15.0, bottom: 5.0),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text("Weather",
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 14,
                                    color: Color(0xff0d67b5)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Text("Weather",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 12,
                                          color: Color(0xff0d67b5))),
                                  Text("Temperature",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 12,
                                          color: Color(0xff0d67b5))),
                                  Text("Humidity",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 12,
                                          color: Color(0xff0d67b5))),
                                  Text("Wind",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 12,
                                          color: Color(0xff0d67b5))),
                                  Text("Pressure",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 12,
                                          color: Color(0xff0d67b5)))
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(locationData["current"]["weather"]["ic"],
                                      style: const TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 12,
                                          color: Color(0xff0d67b5))),
                                  Text(
                                      locationData["current"]["weather"]["tp"]
                                          .toString(),
                                      style: const TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 12,
                                          color: Color(0xff0d67b5))),
                                  Text(
                                      locationData["current"]["weather"]["hu"]
                                          .toString(),
                                      style: const TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 12,
                                          color: Color(0xff0d67b5))),
                                  Text(
                                      locationData["current"]["weather"]["ws"]
                                          .toString(),
                                      style: const TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 12,
                                          color: Color(0xff0d67b5))),
                                  Text(
                                      locationData["current"]["weather"]["pr"]
                                          .toString(),
                                      style: const TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 12,
                                          color: Color(0xff0d67b5))),
                                ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                  decoration: const BoxDecoration(
                      color: Color(0xfff7f3e8),
                      borderRadius: BorderRadius.all(Radius.circular(35.0)))),
              Container(
                  height: 160.0,
                  margin:
                      const EdgeInsets.only(top: 39.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.only(top: 15.0, left: 15.0, bottom: 5.0),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text("Pollution",
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 14,
                                    color: Color(0xff0d67b5)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Text("AQI Value",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 12,
                                          color: Color(0xff0d67b5))),
                                  Text("Main Pollutant - US",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 12,
                                          color: Color(0xff0d67b5))),
                                  Text("Main Pollutant - China",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 12,
                                          color: Color(0xff0d67b5)))
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                      locationData["current"]["pollution"]
                                              ["aqius"]
                                          .toString(),
                                      style: const TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 12,
                                          color: Color(0xff0d67b5))),
                                  Text(
                                      locationData["current"]["pollution"]
                                              ["mainus"]
                                          .toString(),
                                      style: const TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 12,
                                          color: Color(0xff0d67b5))),
                                  Text(
                                      locationData["current"]["pollution"]
                                              ["maincn"]
                                          .toString(),
                                      style: const TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 12,
                                          color: Color(0xff0d67b5)))
                                ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                  decoration: const BoxDecoration(
                      color: Color(0xfff7f3e8),
                      borderRadius: BorderRadius.all(Radius.circular(35.0))))
            ],
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          items: buttons,
          index: pageIndex,
          height: 60,
          backgroundColor: Colors.transparent,
          onTap: (int index) {
            if (index == 4) {
              if (route.length == 1) {
                route.Pop();
                Navigator.pushAndRemoveUntil<dynamic>(
                    context,
                    MaterialPageRoute<dynamic>(
                        builder: (BuildContext context) =>
                            screens[4] ?? const HomeScreen()),
                    (route) => false);
                return;
              } else if (route.length < 1) {
                return;
              }

              route.Pop();
              screens.last = route.Peek;
            } else {
              route.Push(screens[index]!);
            }

            pageIndex = index;
            Navigator.pushAndRemoveUntil<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => const MainPage()),
                (route) => false);
          },
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FavouriteButton(locationData: locationData),
              FloatingActionButton(
                  onPressed: () {Navigator.push(context, MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => ObservationEditScreen(locationData: locationData)));},
                  child: const Icon(Icons.remove_red_eye),
                  heroTag: null,
                  backgroundColor: const Color(0xfff7f3e8),
                  foregroundColor: const Color(0xff0d67b5))
            ],
          ),
        ),
      );
}
