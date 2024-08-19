import 'package:flutter/material.dart';
import 'package:worldtimeapi/services/world_time_service.dart';

// importing spinners
import 'package:flutter_spinkit/flutter_spinkit.dart';

// purpose of this widget is to display local datetime of a particular timezone

class WorldTimeShower extends StatefulWidget {
  WorldTimeShower({super.key, required this.timezone, required this.location});

  // the timezone
  String timezone;

  // location to be displayed
  String location;

  @override
  State<WorldTimeShower> createState() => _WorldTimeShowerState();
}

class _WorldTimeShowerState extends State<WorldTimeShower> {

  // the text to be displayed
  String displayText = "Loading...";

  // method to fetch the local time and set in display text
  void fetchTimeAndSet() async
  {

    try
    {
      WorldTimeService wts = WorldTimeService(timezone: widget.timezone, location: widget.location);

      // set the current time in obj
      await wts.getCurrentTime();

      // will not display it directly here
      // will redirect to another page with the data

      // but, now, this code below will be executed after the response arrives.
      // Till then, it may happen so that this widget isn't even there in the tree

      // so, first check if widget is mounted
      if(mounted)
      {
        // need to pass data to home too
        Navigator.of(context).pushReplacementNamed("/home", arguments: {
          "location": wts.location,
          "timezone": wts.timezone,
          "current_time": wts.currentTime,
          "is_day_time": wts.isDayTime
        });
      }

    }
    catch (e)
    {
      print(e.toString());
      setState(() {
        displayText = "Error occurred. Please try again later.";
      });
    }

  }

  @override
  Widget build(BuildContext context)
  {

    // get the data from route args
    final data = ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    if((data["location"]!=null)&&(data["timezone"]!=null))
    {
      widget.location = data["location"]!;
      widget.timezone = data["timezone"]!;
    }

    // fetch the time
    fetchTimeAndSet();

    return const Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 90.0,
        ),
      ),
    );
  }
}
