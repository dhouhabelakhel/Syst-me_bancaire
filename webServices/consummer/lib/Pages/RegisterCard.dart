import 'package:flutter/material.dart';
import 'package:u_credit_card/u_credit_card.dart';

class registerCard extends StatefulWidget {
  const registerCard({super.key});

  @override
  State<registerCard> createState() => _registerCardState();
}

class _registerCardState extends State<registerCard> {
  String? _name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF060606),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 50, right: 50, top: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: Divider(
                  color: Color(0xFF0A6565),
                  thickness: 9,
                )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                ),
                Expanded(
                    child: Divider(
                  color: Color(0xFF0A6565),
                  thickness: 9,
                )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                ),
                Expanded(
                    child: Divider(
                  color: Colors.grey,
                  thickness: 9,
                ))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            CreditCardUi(
                cardHolderFullName: 'John Doe',
                cardNumber: '1234567812345678',
                validThru: '10/24',
                topLeftColor: Color(0xFF0A6565),
                bottomRightColor: Color(0x1F416A),
                placeNfcIconAtTheEnd: true,
                enableFlipping: true,
                cardProviderLogoPosition: CardProviderLogoPosition.right,
                showBalance: true,
                autoHideBalance: true,
                cvvNumber: '123'),
          ],
        ),
      ),
    );
  }
}
