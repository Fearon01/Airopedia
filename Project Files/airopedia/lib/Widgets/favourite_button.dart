import 'package:airopedia/DataStructures/favourite_city.dart';
import 'package:airopedia/Scripts/favourite_database.dart';
import 'package:flutter/material.dart';

class FavouriteButton extends StatefulWidget {
  final Map<String, dynamic> locationData;

  FavouriteButton({Key? key, required this.locationData}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FavouriteButtonState();
}

class FavouriteButtonState extends State<FavouriteButton> {
  Color? favouriteForeground;
  Color? favoriteBackground;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    GetColour().whenComplete((){
          setState(() {});
       });
  }

   Future<void> GetColour() async {
    FavouriteCity? favCity = await FavouriteDatabase.instance.ReadUsingName(
        widget.locationData["city"],
        widget.locationData["state"],
        widget.locationData["country"]);

    if (favCity == null) {
      favouriteForeground = Color(0xff0d67b5);
      favoriteBackground = Color(0xfff7f3e8);
    } else {
      favouriteForeground = Color(0xfff7f3e8);
      favoriteBackground = Color(0xff50c878);
    }
  }

  @override
  Widget build(BuildContext context) => FloatingActionButton(
      onPressed: () async {
        FavouriteCity? favCity = await FavouriteDatabase.instance.ReadUsingName(
            widget.locationData["city"],
            widget.locationData["state"],
            widget.locationData["country"]);

        if (favCity == null) {
          FavouriteCity city = FavouriteCity(
              name: widget.locationData["city"],
              stateName: widget.locationData["state"],
              countryName: widget.locationData["country"]);
          FavouriteDatabase.instance.Create(city);

          setState(() {
            favouriteForeground = Color(0xfff7f3e8);
            favoriteBackground = Color(0xff50c878);
          });
        } else {
          FavouriteDatabase.instance.Delete(favCity.id!);

          setState(() {
            favouriteForeground = Color(0xff0d67b5);
            favoriteBackground = Color(0xfff7f3e8);
          });
        }
      },
      child: const Icon(Icons.favorite),
      heroTag: null,
      backgroundColor: favoriteBackground,
      foregroundColor: favouriteForeground);
}
