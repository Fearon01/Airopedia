import 'dart:convert';

import 'package:airopedia/Screens/location.dart';
import 'package:airopedia/Screens/no_connection_screen.dart';
import 'package:airopedia/Scripts/favourite_database.dart';
import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

Widget CurrentLocationButton(BuildContext context) => Padding(
      padding: const EdgeInsets.only(top: 48.0, left: 20.0, right: 20.0),
      child: TextButton(
        onPressed: () async {
          const String airAPIKey = 'a6415f2a-afad-44e1-9205-409f56dee72f';

          LocationPermission permission = await Geolocator.checkPermission();

          if (permission == LocationPermission.denied ||
              permission == LocationPermission.deniedForever) {
            return;
          }

          Position currentPosition = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high);

          late http.Response response;

          try {
            response = await http.get(Uri.parse(
                'http://api.airvisual.com/v2/nearest_city?lat=' +
                    currentPosition.latitude.toString() +
                    '&lon=' +
                    currentPosition.longitude.toString() +
                    '&key=' +
                    airAPIKey));
          } catch (error) {
            Navigator.push(
                context,
                MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) =>
                        ConnectionLostScreen(context: context)));
            return;
          }

          Map<String, dynamic> data = jsonDecode(response.body);

          Navigator.push(
              context,
              MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) =>
                      LocationScreen(locationData: data["data"])));
        },
        style: ButtonStyle(
            minimumSize:
                MaterialStateProperty.all<Size>(const Size(320.0, 50.0)),
            backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0xfff7f3e8)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0),
                    side: const BorderSide(color: Color(0xfff7f3e8))))),
        child: const Padding(
          padding: EdgeInsets.only(right: 162.0),
          child: Text(
            'Current Location',
            style: TextStyle(
                fontFamily: 'Roboto', fontSize: 18, color: Color(0xff0d67b5)),
          ),
        ),
      ),
    );
