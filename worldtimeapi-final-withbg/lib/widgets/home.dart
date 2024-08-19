import 'dart:ffi';

import 'package:flutter/material.dart';
import "package:intl/intl.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // map to keep the data in
  Map<String, dynamic> data = {};

  @override
  Widget build(BuildContext context) {

    // get the data
    data = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    String location = data["location"];
    String timezone = data["timezone"];
    bool isDayTime = data["is_day_time"];
    DateTime currentTime = data["current_time"];

    String bgImage = isDayTime?"day.png":"night.png";

    return Scaffold(
      appBar: AppBar(
        title: Text("$location's Local Time"),
        backgroundColor: isDayTime?Colors.blue:Colors.indigo[900],
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/$bgImage"),
            fit: BoxFit.cover
          )
        ),
        width: double.infinity,
        child: Column(
          children: [
            Text("Timezone: $timezone"),
            // displaying it in a formatted manner, like 1:04 pm, 2:33 am, etc.
            Text("Current local time: ${DateFormat.jm().format(currentTime)}"),

          ],
        ),
      ),
    );
  }
}
