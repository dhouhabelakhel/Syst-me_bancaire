
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF060606),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('Photos/home.jpeg'),
            Text(
              'With this application you can increase \n your money and spend it wisely',
              style: TextStyle(
                color: Color(0xFF76EEEE),
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center, // Pour centrer le texte
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'register');

                  },
                  child: Text(
                    "Create new Account",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFF0A6565)),
                    textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 20)),
                    overlayColor: MaterialStateProperty.all(Color(0x1F416A)),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(20)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.015),
                    )),
                    fixedSize: MaterialStateProperty.all(Size(250, 70)),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'login');
                  },
                  child: Text(
                    "Sign in",
                    style: TextStyle(color: Color(0xFF76EEEE)),
                  ),
                  style: ButtonStyle(
                    textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
