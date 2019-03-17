import 'package:flutter/material.dart';

class TermsAndConditionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms & Conditions'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text('Terms & Condition here',style: TextStyle(
              fontSize: 24.0
            ),)],
          ),
        ),
      ),
    );
  }
}
