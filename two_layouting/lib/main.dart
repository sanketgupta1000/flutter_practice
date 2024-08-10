import 'package:flutter/material.dart';

// here, we will how to do layouting like adding margin, padding, etc

// 1. Padding

// void main()
// {
//   runApp(
//     const MaterialApp(
//       home: Scaffold(
//         body: Padding(
//           // here, we need to pass two things: padding value and what to apply padding to

//           // applies padding to all sides
//           // padding: EdgeInsets.all(50),
//           // padding from left, top, right, bottom respectively
//           // padding: EdgeInsets.fromLTRB(200, 150, 100, 50),
//           // only: as the name suggests, we specify from where we need to do padding
//           padding: EdgeInsets.only(top: 50, left: 50),
//           child: Text("Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!"),
//         ),
//       ),
//     )
//   );
// }

// 2. Container

// void main()
// {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         body: Container(
//           // can specify many things here, like margin, padding, height, width, etc
//           padding: const EdgeInsets.all(50),
//           margin: const EdgeInsets.all(50),
//           // 50+50, text should be 100 pixels from device border
//           child: const Text("Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!Hey there, this should be padded!"),
//         ),
//       ),
//     )
//   );
// }

// 3. Column

// void main()
// {
//   runApp(MaterialApp(
//     home: Scaffold(
//       // will actually display row by row
//       body: Column(

//         // main axis for column is y axis, and x axis is cross axis

//         mainAxisAlignment: MainAxisAlignment.center,
        
//         // crossAxisAlignment: CrossAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.center,

//         // what is happening?
//         // we see the children in left, centered vertically, and also on their own axis

//         // in flutter, every element, specifically containers have properties related to directions. More on this later
//         // for now, understand that by default, Scaffold displays everything in body from top to bottom and left to right

//         // so our column is like at the leftmost part of screen, occupying complete height, width equal to width of content
//         // there, it is centering content vertically as well as horizontally

//         // wrap the column in center and have main axis alignment as center to really center things

//         children: <Widget>[
//           const Text('HELLO ROW'),
//           TextButton(
//             onPressed: () {},
//             child: const Text('press me'),
//           ),
//           Container(
//             color: Colors.cyanAccent,
//             // padding: const EdgeInsets.all(30.0),
//             child: const Text('inside container'),
//           )
//         ],

//       ),
//     ),
//   ));
// }

// similarly we have row

// 4. Expanded
// In Flutter, an Expanded widget is used within a Row, Column, or Flex layout to allow a child widget to expand and fill the available space along the main axis (horizontal for Row and vertical for Column). The Expanded widget is particularly useful when you want to distribute space among children proportionally.
// flex Property: The flex property (an integer) allows you to control how much of the remaining space each Expanded widget should take. By default, flex is set to 1, meaning equal distribution. If one Expanded has flex: 2 and another has flex: 1, the first will take up twice as much space as the second.

void main()
{
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text("Product Name"),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.green),
                      foregroundColor: WidgetStatePropertyAll(Colors.white)
                    ),
                    onPressed: ()=>{},
                    child: const Text("Accept")
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.red),
                      foregroundColor: WidgetStatePropertyAll(Colors.white)
                    ),
                    onPressed: ()=>{},
                    child: const Text("Reject")
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}