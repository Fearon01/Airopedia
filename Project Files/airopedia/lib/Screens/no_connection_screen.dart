import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionLostScreen extends StatelessWidget 
{
  ConnectivityResult connectionResult = ConnectivityResult.none;
  final connectionState = Connectivity();
  final BuildContext context;
  late StreamSubscription<ConnectivityResult> connectivity;


  ConnectionLostScreen({Key? key, required this.context}) : super(key: key) 
  {
    connectivity = connectionState.onConnectivityChanged.listen((event) { 
      Navigator.pop(context);
    });
  } 

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color(0xff0d67b5),
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Center(
          child: Column(
            children: const [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Connection Lost',
                  style: TextStyle(
                    fontFamily: 'HVD_Comic_Serif_Pro',
                    fontSize: 42,
                    color: Color(0xfff7f3e8),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Image(image: AssetImage('assets/images/NoConnection.png')),
              )
            ],
          ),
        ),
      )
    );
}