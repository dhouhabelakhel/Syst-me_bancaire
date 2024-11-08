import 'package:flutter/material.dart';
class registerCard extends StatefulWidget {
  const registerCard({super.key});

  @override
  State<registerCard> createState() => _registerCardState();
}

class _registerCardState extends State<registerCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF060606),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 50,right: 50,top: 80),
      ),
    );
  }
}
