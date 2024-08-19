import 'package:flutter/material.dart';
import 'package:worldtimeapi/widgets/choose_location.dart';
import 'package:worldtimeapi/widgets/home.dart';
import 'package:worldtimeapi/widgets/world_time_shower.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: "/choose-location",
        routes: {

          '/choose-location': (context)=>const ChooseLocation(),

          '/show-time': (context)=>WorldTimeShower(timezone: "Asia/Kolkata", location: "India"),
          
          '/home': (context)=>const Home()

      }
    )
  );
}