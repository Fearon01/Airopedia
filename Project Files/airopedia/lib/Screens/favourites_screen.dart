import 'dart:convert';

import 'package:airopedia/DataStructures/favourite_city.dart';
import 'package:airopedia/Screens/location.dart';
import 'package:airopedia/Scripts/favourite_database.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class FavouritesScreen extends StatelessWidget {
  late List<FavouriteCity> favourites;

  FavouritesScreen({Key? key}) : super(key: key) {
    GetFavourites();
  }

  Future<void> GetFavourites() async {
    favourites = await FavouriteDatabase.instance.ReadAll();
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
                  'Favourites',
                  style: TextStyle(
                    fontFamily: 'HVD_Comic_Serif_Pro',
                    fontSize: 42,
                    color: Color(0xfff7f3e8),
                  ),
                ),
              ),
              ListView.builder(
                  padding: EdgeInsets.only(top: 15.0),
                  shrinkWrap: true,
                  itemCount: favourites.length,
                  itemBuilder: (context, index) {
                    return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35.0)),
                        color: const Color(0xfff7f3e8),
                        child: ListTile(
                            leading: Icon(Icons.favorite,
                                color: const Color(0xff0d67b5)),
                            trailing: Icon(Icons.arrow_back_ios,
                                color: const Color(0xff0d67b5)),
                            textColor: const Color(0xff0d67b5),
                            title: Text(favourites[index].name),
                            subtitle: Text(
                                '${favourites[index].stateName}, ${favourites[index].countryName}}'),
                            onTap: () async {
                              const String airAPIKey =
                                  'a6415f2a-afad-44e1-9205-409f56dee72f';

                              http.Response response = await http.get(Uri.parse(
                                  'http://api.airvisual.com/v2/city?city=${favourites[index].name}&state=${favourites[index].stateName}&country=${favourites[index].countryName}&key=$airAPIKey'));

                              Map<String, dynamic> data =
                                  jsonDecode(response.body);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute<dynamic>(
                                      builder: (BuildContext context) =>
                                          LocationScreen(locationData: data["data"])));
                            }));
                  })
            ],
          ),
        ),
      );
}
