import 'package:airopedia/DataStructures/observation.dart';
import 'package:airopedia/Screens/observations_screen.dart';
import 'package:airopedia/Scripts/observations_database.dart';
import 'package:airopedia/Widgets/navigation_bar.dart';
import 'package:airopedia/main.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class ObservationEditScreen extends StatefulWidget {
  Observation? currentObservation;
  Map<String, dynamic>? locationData;

  ObservationEditScreen({Key? key, this.currentObservation, this.locationData})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => ObservationState();
}

class ObservationState extends State<ObservationEditScreen> {
  final TextEditingController observationTextController =
      TextEditingController();

  final TextEditingController observationTitleController =
      TextEditingController();

  late IconData actionIcon;
  late String originalObservation;
  bool undoVisible = true;
  late bool readOnly;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    GetObservationData().whenComplete(() {
      setState(() {});
    });
  }

  Future<void> GetObservationData() async {
    if (widget.currentObservation == null) {
      observationTextController.text = '';
      observationTitleController.text = 'Insert Title Here';
      originalObservation = '';
      actionIcon = Icons.save;
      readOnly = false;
    } else {
      originalObservation = widget.currentObservation!.observation;
      actionIcon = Icons.create_rounded;
      observationTextController.text = widget.currentObservation!.observation;
      observationTitleController.text =
          widget.currentObservation!.observationTitle;
      readOnly = true;
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xff0d67b5),
        body: Center(
          child: Container(
            height: 510,
            margin: const EdgeInsets.only(
                top: 10.0, bottom: 24.0, left: 20.0, right: 20.0),
            decoration: const BoxDecoration(
                color: Color(0xfff7f3e8),
                borderRadius: BorderRadius.all(Radius.circular(35.0))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 10.0),
                        child: TextField(
                                enabled: !readOnly,
                                maxLength: 20,
                                controller: observationTitleController,
                                style: const TextStyle(
                                  fontFamily: 'HVD_Comic_Serif_Pro',
                                  fontSize: 22,
                                  color: Color(0xff0d67b5),
                                ),
                                decoration: const InputDecoration(
                                  counterText: "",
                                  border: InputBorder.none
                                ),
                                ),
                      ),
                    ),
                    Visibility(
                      visible: undoVisible,
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: IconButton(
                            onPressed: () {
                              observationTextController.text =
                                  originalObservation;
                            },
                            icon: const Icon(Icons.close,
                                color: Color(0xff0d67b5), size: 30.0)),
                      ),
                    )
                  ],
                ),
                Container(
                  height: 430,
                  margin: const EdgeInsets.only(
                      top: 5.0, left: 9.0, right: 9.0, bottom: 15.0),
                  decoration: BoxDecoration(
                      color: const Color(0xfff7f3e8),
                      border: Border.all(color: const Color(0xff0d67b5)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(35.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                        enabled: !readOnly,
                        onChanged: (value) {
                          if (value == originalObservation) {
                            setState(() {
                              undoVisible = false;
                            });
                          } else {
                            setState(() {
                              undoVisible = true;
                            });
                          }
                        },
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: const InputDecoration(
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none),
                        controller: observationTextController,
                        style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            color: Color(0xff0d67b5))),
                  ),
                ),
              ],
            ),
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
                Navigator.pop(
                    context);
                    
                route.Pop();
                return;
              } else if (route.length < 1) {
                Navigator.pop(
                    context);
                    return; 
              }

              route.Pop();
              screens.last = route.Peek;
              Navigator.pop(context);
            } else {
              route.Push(screens[index]!);
            }

            pageIndex = index;
            Navigator.pop(
                context);
          },
        ),
        floatingActionButton: Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                      onPressed: () {
                        if (actionIcon == Icons.save) {
                          if (widget.currentObservation == null) {
                            widget.currentObservation = Observation(
                                name: widget.locationData!["city"],
                                stateName: widget.locationData!["state"],
                                countryName: widget.locationData!["country"],
                                observation: observationTextController.text,
                                observationTitle:
                                    observationTitleController.text,
                                observationTime: DateTime.now());
                            ObservationsDatabase.instance
                                .Create(widget.currentObservation!);
                          } else {
                            widget.currentObservation!.observation =
                                observationTextController.text;
                            widget.currentObservation!.observationTitle =
                                observationTitleController.text;
                            widget.currentObservation!.observationTime =
                                DateTime.now();
                            ObservationsDatabase.instance
                                .Update(widget.currentObservation!);
                          }
                          setState(() {
                            actionIcon = Icons.create_rounded;
                            readOnly = true;
                          });
                        } else {
                          setState(() {
                            actionIcon = Icons.save;
                            readOnly = false;
                          });
                        }
                      },
                      child: Icon(actionIcon),
                      heroTag: null,
                      backgroundColor: const Color(0xfff7f3e8),
                      foregroundColor: const Color(0xff0d67b5)),
                  FloatingActionButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.dangerous_rounded,
                      ),
                      heroTag: null,
                      backgroundColor: const Color(0xfff7f3e8),
                      foregroundColor: const Color(0xFFC41E3A))
                ])),
        resizeToAvoidBottomInset: false,
      );
}
