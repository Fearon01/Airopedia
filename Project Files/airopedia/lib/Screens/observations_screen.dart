import 'package:airopedia/DataStructures/observation.dart';
import 'package:airopedia/Screens/observation_edit_screen.dart';
import 'package:airopedia/Scripts/observations_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ObservationsScreen extends StatelessWidget {
  late List<Observation> observations;

  ObservationsScreen({Key? key}) : super(key: key) {
    GetObservations();
  }

  Future<void> GetObservations() async {
    observations = await ObservationsDatabase.instance.ReadAll();
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
                  'Observations',
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
                  itemCount: observations.length,
                  itemBuilder: (context, index) {
                    return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35.0)),
                        color: const Color(0xfff7f3e8),
                        child: ListTile(
                            leading: Icon(Icons.remove_red_eye_rounded,
                                color: const Color(0xff0d67b5)),
                            trailing: Icon(Icons.arrow_back_ios,
                                color: const Color(0xff0d67b5)),
                            textColor: const Color(0xff0d67b5),
                            title: Text(observations[index].observationTitle),
                            subtitle: Text(
                                '${observations[index].name}, ${observations[index].countryName}\n${DateFormat('EEE, d/M/y H:mm a').format(DateTime.parse(observations[index].observationTime.toIso8601String()))}'),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute<dynamic>(
                                      builder: (BuildContext context) =>
                                          ObservationEditScreen(currentObservation: observations[index])));
                            }));
                  })
            ],
          ),
        ),
      );
}
