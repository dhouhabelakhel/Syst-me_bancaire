import 'package:flutter/material.dart';
import 'package:dsi32/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> days = <String>['lundi', 'mardi', 'mercredi','jeudi','vendredi','samedi','dimanche'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,


      home: home(days),
    );

  }
}
