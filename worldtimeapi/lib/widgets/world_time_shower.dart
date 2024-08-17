import 'package:flutter/material.dart';
import 'package:worldtimeapi/services/world_time_service.dart';

// purpose of this widget is to display local datetime of a particular timezone

class WorldTimeShower extends StatefulWidget {
  const WorldTimeShower({super.key, required this.timezone, required this.location});

  // the timezone
  final String timezone;

  // location to be displayed
  final String location;

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
      WorldTimeService wts = WorldTimeService(timezone: widget.timezone);

      // get the date time in local
      DateTime currentLocal = await wts.getCurrentTime();

      // set
      setState(() {
        displayText = currentLocal.toString();
      });
    }
    catch (e)
    {
      print(e.toString());
      setState(() {
        displayText = "Error occurred. Please try again later.";
      });
    }

  }

  // override initState
  @override
  void initState() {
    super.initState();
    // don't put await here
    fetchTimeAndSet();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.location}'s Local Time"),
        centerTitle: true,
      ),
      body: Text(displayText),
    );
  }
}
