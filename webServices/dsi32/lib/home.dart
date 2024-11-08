import 'package:flutter/material.dart';

class home extends StatelessWidget {
  List<String> days;
   home(this.days, {super.key});

  @override
  Widget build(BuildContext context) {

      return Scaffold(
          appBar: AppBar(
          ),
          body: ListView.builder(
              itemBuilder:  (BuildContext context, int index) {
                return ListTile(
                  onTap: (){print(days[index]);},
                  title: Text(days[index]),
                );
              },
              itemCount: days.length)
      );
  }
}
