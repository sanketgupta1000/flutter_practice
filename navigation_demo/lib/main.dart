import 'package:flutter/material.dart';
import 'package:navigation_demo/ChooseLocation.dart';
import 'package:navigation_demo/Home.dart';
import 'package:navigation_demo/Loading.dart';

void main() {
  runApp(
    MaterialApp(

      // initial route
      initialRoute: "/home",

      // mapping the respective widgets/pages to their routes
      routes: {
        "/home": (BuildContext context) => Home(),
        "/loading": (BuildContext context) => Loading(),
        "/location": (BuildContext context) => ChooseLocation()

      },
    )
  );
}
