import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'User.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // let's try to get a list of users from an api
  List<User> users = [];


  // overriding the init state method, will be called whenever the home widget is first created
  // point to note is that first creation can occur multiple times, like i pop this, then at some other time i display it again
  // also, initState must always return void, and must never itself be async
  // @override
  // void initState() async {
  //
  //   print("fetching users...");
  //
  //   // call the api to initialize the state
  //   final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
  //   final jsonStr = response.body;
  //   final Map<int, Map<String, Object?>> jsonMapOfUsers = jsonDecode(jsonStr);
  //   for (var jsonUser in jsonMapOfUsers.values) {
  //     users.add(User.fromJson(jsonUser));
  //   }
  //
  //   super.initState();
  //
  //   print("fetched users!");
  // }

  void getData() async
  {
    print("fetching users...");
    // call the api to initialize the state
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    final jsonStr = response.body;
    final jsonMapOfUsers = jsonDecode(jsonStr);
    for (var jsonUser in jsonMapOfUsers) {
      // set the state, since most likely, response will occur after build now
      setState(() {
        users.add(User.fromJson(jsonUser));
      });
    }
    print("fetched users!");
  }

  @override
  void initState() {

    print("init state started...");
    // calling an async function, not using await
    getData();
    super.initState();

    print("init state ending!");
  }

  @override
  Widget build(BuildContext context) {
    print("building...");
    return Scaffold(

      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
      ),

      body: Column(
        children: users.map((user){
          return Column(
            children: [
              Text("ID: ${user.id}"),
              Text("Name: ${user.name}"),
              Text("Email: ${user.email}"),
            ],
          );
        }).toList(),
      ),

    );
  }
}
