import 'package:flutter/material.dart';

enum SingingCharacter { Online, Cod }

// In the State of a stateful widget:
SingingCharacter _character = SingingCharacter.Cod;

class BuyNow extends StatefulWidget {
  @override
  _BuyNowState createState() => _BuyNowState();
}

class _BuyNowState extends State<BuyNow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buy now"),
      ),
      bottomNavigationBar: Container(
        height: 50.0,
        child: RaisedButton(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(0.0)),
          onPressed: () {
//          Application.router.navigateTo(context, Routes.dummyPage);
          },
          color: Colors.teal,
          child: Center(
            child: Text(
              "Proceed",
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Choose payment mode",
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
          SizedBox(height: 20.0),
          RadioListTile<SingingCharacter>(
            title: const Text('Cash on delievery'),
            selected: true,
            value: SingingCharacter.Cod,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
              });
            },
          ),
          RadioListTile<SingingCharacter>(
            title: const Text('Online'),
            value: SingingCharacter.Online,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
