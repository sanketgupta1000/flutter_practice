import 'package:flutter/material.dart';
import 'package:worldtimeapi/widgets/world_time_shower.dart';

void main() {
  runApp(
    const MaterialApp(
      home: WorldTimeShower(
        timezone: "Asia/Kolkata",
        // location to be displayed
        location: "India"
      )
    )
  );
}