import 'package:flutter/material.dart';
import 'package:consummer/Pages/HomePage.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'home':(context)=>MyHomePage()// Define the route for the new page
// Define the route for the new page
      },
      initialRoute: 'home',

    );

  }

}