import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation>{

  final countries = [
    {
      "name": "India",
      "timezone": "Asia/Kolkata",
      "flag": "india.png"
    },
    {
      "name": "Philippines",
      "timezone": "Asia/Manila",
      "flag": "philippines.png"
    },
    {
      "name": "Singapore",
      "timezone": "Asia/Singapore",
      "flag": "singapore.png"
    },
    {
      "name": "Australia",
      "timezone": "Australia/Brisbane",
      "flag": "australia.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {

                  // whenever an item in the list is clicked, will push its WorldTimeShower on stack
                  Navigator.of(context).pushNamed("/show-time", arguments: {
                    "location": countries[index]["name"]!,
                    "timezone": countries[index]["timezone"]!
                  });

                },
                title: Text(countries[index]["name"]!),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/flags/${countries[index]["flag"]}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
