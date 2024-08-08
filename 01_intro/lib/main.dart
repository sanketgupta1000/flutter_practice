import 'package:flutter/material.dart';

// 1. Introduction to flutter

// in flutter, all ui components are widgets
// and a widget is nothing but an object that can be instantiated from its respective widget class

// void main()
// {
//   // runApp function takes an 'app' widget, which is like the root widget of our app
//   runApp(
//     // instantiating and passing the builtin app widget to runApp
//     const MaterialApp(
//       // properties/nested widgets can be passed to builtin widgets via named parameters
//       // similar to passing props to components in React
//       home: Text("Hey there") // Text is nothing but another widget
//     )
//   );
// }

// 2. Exploring builtin widgets

// now, we will try to create a specific layout with the builtin widgets

// void main()
// {
//   runApp(
//     MaterialApp(
//       // Scaffold is the widget to which we can pass many different types of children widget
//       home: Scaffold(
//         // appBar is the bar which displays at top
//         appBar: AppBar(
//           title: const Text("Lucky Cards"),
//           centerTitle: true,
//           backgroundColor: Colors.blue[400],
//         ),
//         // drawer is the thing which slides in from left of screen
//         drawer: Drawer(
//           backgroundColor: Colors.grey,
//           child: Column(
//             // everything in children of column will be displayed in one column
//             // so actually this displays row by row
//             children: <Widget>[
//               TextButton(
//                   onPressed: ()=>{},
//                   child: const Text("Tab 1")
//               ),
//               TextButton(
//                   onPressed: ()=>{},
//                   child: const Text("Tab 2")
//               ),
//               TextButton(
//                   onPressed: ()=>{},
//                   child: const Text("Tab 3")
//               ),
//             ],
//           ),
//         ),
//         // body of the layout
//         body: Center(
//           // want to center card
//           child: Card(
//             // again, want to have title, body, etc. in card
//             child: Scaffold(
//               appBar: AppBar(
//                 title: const Text("Card Title"),
//                 backgroundColor: Colors.blue[600],
//               ),
//               body: const Text("This is the content of the card. Hope you like this tutorial."),
//             ),
//           ),
//         ),
//         // button at the bottom, like in google notes app
//         floatingActionButton: FloatingActionButton(
//           onPressed: ()=>{},
//           child: const Icon(Icons.add),
//         ),
//       ),
//     )
//   );
// }


// 3. Creating custom widget (stateless)

// in react, a component is re-rendered by calling it whenever its state changes
// so, if a component will be re-rendered or not, is based on its properties
// in flutter, either a widget can be stateful, which means it will be re-rendered/built whenever state changes
// or it can be stateless, which means it will be rendered/built only once

// also, it is the widget's build() method that is responsible for rendering
// it is a mathematical function that takes the variables/state of the widget and returns its UI

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key, required this.greetMsg});
//
//   final String greetMsg;
//
//   @override
//   Widget build(BuildContext context) {
//     // rendering logic goes here
//     // this must be a pure function
//     // that is, for the same values of properties of the class
//     // this should return the same UI
//
//     print("This will be printed only once hopefully");
//
//     return MaterialApp(
//       home: Center(
//         child: Card(
//           child: Text(greetMsg),
//         ),
//       ),
//     );
//
//   }
// }
//
// void main()
// {
//   runApp(
//     const MyWidget(greetMsg: "Hey there, I am a custom stateless widget")
//   );
// }


// 4. Custom widget (stateful)

// this is how you create a stateful widget
// you inherit your widget from StatefulWidget
// override the method createState
// which returns an object whose class extends State<YourStatefulWidget>
// by extending, the private class, _MyStatefulHomeState in this case, we get a method to setState

class MyStatefulHome extends StatefulWidget {
  const MyStatefulHome({super.key});

  @override
  State<MyStatefulHome> createState() => _MyStatefulHomeState();
}

class _MyStatefulHomeState extends State<MyStatefulHome> {

  _MyStatefulHomeState()
  {
    print("This should be printed only once hopefully, since it is the build that runs whenever state is set, unlike React, which creates completely new components.");
  }

  // all state variables go here
  int counterA = 0;
  int counterB = 0;

  @override
  Widget build(BuildContext context) {
    // build runs whenever setState is called

    print("build called");

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("CounterA: $counterA"),
              Text("CounterB: $counterB"),
              // button to increment counterA through set state
              // notice how the value is updated in UI, and "build called" is printed in console too
              ElevatedButton(
                onPressed: ()=>setState(() {
                  counterA++;
                }),
                child: const Text("Increment A"),
              ),

              // button to increment counterB without using setState
              // notice how UI is not updated
              // click increment A or set the state button (defined below) to see the change
              ElevatedButton(
                onPressed: ()=>counterB++,
                child: const Text("Increment B"),
              ),

              // button to call setState simply
              ElevatedButton(
                onPressed: ()=>setState(()=>{}),
                child: const Text("Set the State"),
              )

            ],
          ),
        ),
      ),
    );

  }
}

void main()
{
  runApp(const MyStatefulHome());
}