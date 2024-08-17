import 'package:flutter/material.dart';
import 'package:worldtimeapi/widgets/home.dart';
import 'package:worldtimeapi/widgets/world_time_shower.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: "/location",
        routes: {

          '/location': (context)=>const WorldTimeShower(
            timezone: "Asia/Kolkata",
            // location to be displayed
            location: "India"
            ),

          '/home': (context)=>const Home()

      }
    )
  );
}