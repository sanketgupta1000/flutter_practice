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
    return Scaffold(
      appBar: AppBar(
        title: Text("${data["location"]}'s Local Time"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text("Timezone: ${data["timezone"]}"),
          // displaying it in a formatted manner, like 1:04 pm, 2:33 am, etc.
          Text("Current local time: ${DateFormat.jm().format(data["current_time"])}"),

        ],
      ),
    );
  }
}
