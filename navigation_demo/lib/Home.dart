import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
      ),

      body: Column(
        // let's display a button that will help us navigate to choose location page
        children: [
          ElevatedButton(
            onPressed: ()
            {
              // push the route on Navigator
              Navigator.pushNamed(context, "/location");
            },
            child: Text("Go to choose location"),
          )
        ],
      ),

    );
  }
}
