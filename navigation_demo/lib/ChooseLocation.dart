import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        // back arrow will be displayed by default, if we come through navigation
        title: Text("Choose location Page"),
        centerTitle: true,
      ),

      body: Text("This is the choose location page"),

    );
  }
}
