import 'dart:async';
import 'dart:convert';

import 'package:airopedia/Screens/location.dart';
import 'package:airopedia/Widgets/recently_visited_button_widget.dart';
import 'package:airopedia/main.dart';
import 'package:flutter/material.dart';
import 'package:airopedia/Widgets/current_location_button_widget.dart';
import 'package:google_place/google_place.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }

  const HomeScreen({Key? key}) : super(key: key);
}

class HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();

  List<AutocompletePrediction> predictions = [];

  late GooglePlace googlePlace;

  bool buttonVisible = true;

  Timer? searchTimer;

  @override
  void initState() {
    super.initState();

    String apiKey = 'AIzaSyB8h9MT-CHqP-6ePaB6UPH0_JX3NRrgXMo';

    googlePlace = GooglePlace(apiKey);
  }

  void Search(String search) async {
    AutocompleteResponse? result =
        await googlePlace.autocomplete.get(search, types: '(cities)');

    if (result != null && result.predictions != null && mounted) {
      setState(() {
        predictions = result.predictions!;
      });
    }
  }

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
                'Home',
                style: TextStyle(
                  fontFamily: 'HVD_Comic_Serif_Pro',
                  fontSize: 42,
                  color: Color(0xfff7f3e8),
                ),
              ),
            ),
            Container(
                margin:
                    const EdgeInsets.only(top: 19.0, left: 36.0, right: 36.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 36.0,
                      width: 288.0,
                      child: TextField(
                        controller: searchController,
                        style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            color: Color(0xff0d67b5)),
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(top: 6.0, bottom: 6.0),
                            fillColor: const Color(0xfff7f3e8),
                            filled: true,
                            prefixIcon: const Icon(Icons.search,
                                color: Color(0xff0d67b5)),
                            hintText: 'Search here',
                            hintStyle: const TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                color: Color(0xff0d67b5)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: const BorderSide(
                                    color: Color(0xff0d67b5)))),
                        onChanged: (value) {
                          if (searchTimer?.isActive ?? false) {
                            searchTimer!.cancel();
                          }
                          searchTimer = Timer(const Duration(seconds: 1), () {
                            if (value.isNotEmpty) {
                              buttonVisible = false;
                              Search(value);
                            } else {
                              setState(() {
                                buttonVisible = true;
                                searchController.clear();
                                predictions = [];
                              });
                            }
                          });
                        },
                      ),
                    ),
                    Container(
                        child: ListView.builder(
                            padding: EdgeInsets.only(top: 15.0),
                            shrinkWrap: true,
                            itemCount: predictions.length,
                            itemBuilder: (context, index) {
                              return Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(35.0)),
                                  color: const Color(0xfff7f3e8),
                                  child: ListTile(
                                    leading: Icon(Icons.pin_drop,
                                        color: const Color(0xff0d67b5)),
                                    trailing: Icon(Icons.arrow_back_ios,
                                        color: const Color(0xff0d67b5)),
                                    textColor: const Color(0xff0d67b5),
                                    title: Text(predictions[index]
                                        .description
                                        .toString()),
                                    onTap: () async {
                                      final place = predictions[index].placeId!;
                                      final details =
                                          await googlePlace.details.get(place);

                                      if (details != null &&
                                          details.result != null &&
                                          mounted) {
                                        const String airAPIKey =
                                            'a6415f2a-afad-44e1-9205-409f56dee72f';

                                        final Location coords =
                                            details.result!.geometry!.location!;

                                        http.Response response = await http.get(
                                            Uri.parse(
                                                'http://api.airvisual.com/v2/nearest_city?lat=' +
                                                    coords.lat.toString() +
                                                    '&lon=' +
                                                    coords.lng.toString() +
                                                    '&key=' +
                                                    airAPIKey));

                                        Map<String, dynamic> data =
                                            jsonDecode(response.body);

                            

                                        Navigator.pushAndRemoveUntil<dynamic>(
                                            context,
                                            MaterialPageRoute<dynamic>(
                                                builder:
                                                    (BuildContext context) =>
                                                        LocationScreen(
                                                            locationData:
                                                                data["data"])),
                                            (route) => false);
                                      }
                                    },
                                  ));
                            }))
                  ],
                )),
            Visibility(child: CurrentLocationButton(), visible: buttonVisible),
            Visibility(child: RecentlyVisitedButton(), visible: buttonVisible)
          ],
        ),
      ));
}
