import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // below displays underneath the status bar
      // the os area
      //body: Text("This is the loading page"),

      // let's try to display in safe area
      body: SafeArea(child: Text("Loading...")),
    );;
  }
}
