import 'package:flutter/material.dart';
import 'package:worldtimeapi/widgets/choose_location.dart';
void main() {
  runApp(
    const MaterialApp(

      // will try without named routes, bu just manual push pop on navigator stack

      home: ChooseLocation(),

    )
  );
}