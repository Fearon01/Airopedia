//import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class ErrorNotification extends StatelessWidget
{

  final String errorTitle;
  final String errorDescription;

  ErrorNotification({Key? key, required this.errorTitle, required this.errorDescription}) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
      children: [
        Container(
    padding: EdgeInsets.all(16.0),
    height: 90,                  
    decoration: BoxDecoration(
      color: Color(0xFFC41E3A),
      borderRadius: BorderRadius.all(Radius.circular(35))
    ),
    child: Row(
      children: [
        const SizedBox(width: 48.0),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(errorTitle, style: TextStyle(fontSize: 16, color: Color(0xfff7f3e8), fontFamily: 'HVD_Comic_Serif_Pro')),
            Text(errorDescription, style: TextStyle(fontSize: 12, color: Color(0xfff7f3e8), fontFamily: 'HVD_Comic_Serif_Pro'), maxLines: 2, overflow: TextOverflow.ellipsis)
          ]
      ),
      ),
      ],
    ),
    ),
    Positioned(
      left: 10.0,
      bottom: 40.0,
      child: Icon(Icons.cancel_rounded, color: Color(0xfff7f3e8), size: 40.0)
      )
    ],
  );
}