import 'package:flutter/material.dart';
import 'package:jwelery_kart/bloc/base_provider.dart';
import 'package:jwelery_kart/bloc/cart_list_bloc.dart';
import 'package:jwelery_kart/config/application.dart';
import 'package:jwelery_kart/config/routes.dart';
import 'package:jwelery_kart/data/models/cart_response.dart';

class CustomBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartListBloc = Provider.of<CartListBloc>(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: RaisedButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(0.0)),
              onPressed: () {},
              color: Colors.grey,
              child: Center(
                child: StreamBuilder(
                  stream: cartListBloc.cartResponse,
                  builder: (BuildContext context,
                      AsyncSnapshot<CartResponse> snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        "Total: ${snapshot.data.totalPrice} ₹",
                        style: TextStyle(color: Colors.white),
                      );
                    } else if (snapshot.hasError) {
                      return Text("Some Error...",
                          style: TextStyle(color: Colors.white));
                    } else
                      return Container();
                  },
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: RaisedButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(0.0)),
              onPressed: () {
                Application.router.navigateTo(context, Routes.dummyPage);
              },
              color: Colors.teal,
              child: Center(
                child: Text(
                  "Place Order",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
