import 'dart:ffi';

import 'package:flutter/material.dart';
import "package:intl/intl.dart";

class Home extends StatefulWidget {
  const Home({super.key, required this.location, required this.timezone, required this.isDayTime, required this.currentTime});

  final String location;
  final String timezone;
  final bool isDayTime;
  final DateTime currentTime;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {

    String bgImage = widget.isDayTime?"day.png":"night.png";

    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.location}'s Local Time"),
        backgroundColor: widget.isDayTime?Colors.blue:Colors.indigo[900],
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
            Text("Timezone: ${widget.timezone}"),
            // displaying it in a formatted manner, like 1:04 pm, 2:33 am, etc.
            Text("Current local time: ${DateFormat.jm().format(widget.currentTime)}"),

          ],
        ),
      ),
    );
  }
}
