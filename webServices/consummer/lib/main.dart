import 'package:flutter/material.dart';
import 'package:consummer/Pages/HomePage.dart';
import 'package:consummer/Pages/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
              errorStyle: TextStyle(color: Color(0xFF84a5f1)),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF84a5f1)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF84a5f1))),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF84a5f1))))),
      routes: {
        'home': (context) => MyHomePage(),
        'login': (context) => Login() // Define the route for the new page
// Define the route for the new page
      },
      initialRoute: 'home',
    );
  }
}
