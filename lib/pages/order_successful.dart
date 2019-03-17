import 'package:flutter/material.dart';

class OrderSuccessfulScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 120.0),
            Center(
              child: Image.asset(
                'assets/images/ic_success.png',
                width: double.infinity,
              ),
            ),
            Text(
              'Thank you for your purchase',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 15.0),
            Text(
              "Your order is on it's way",
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
