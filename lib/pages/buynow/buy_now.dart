import 'package:flutter/material.dart';
import 'package:jwelery_kart/bloc/base_provider.dart';
import 'package:jwelery_kart/bloc/buy_now_bloc.dart';
import 'package:jwelery_kart/data/local/sharedpreference_helper.dart';
import 'package:jwelery_kart/utils/snackbar_utils.dart';

class BuyNow extends StatelessWidget {
  final String productId;
  final String orderPrice;

  const BuyNow({this.productId, this.orderPrice});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BuyNowBloc>(
      builder: (_, bloc) => bloc ?? BuyNowBloc(productId, orderPrice),
      onDispose: (_, bloc) => bloc.dispose(),
      child: RootApp(),
    );
  }
}

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final buyNowBloc = Provider.of<BuyNowBloc>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Buy now"),
      ),
      bottomNavigationBar: Container(
        height: 50.0,
        child: RaisedButton(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(0.0)),
          onPressed: () async {
            var response = await buyNowBloc.placeOrder(prefsHelper.userPhone);
            if (response != 'Fail') {
              if (buyNowBloc.mode == PaymentMode.Cod) {
                print("Order Successfully Placed");
                SnackbarUtils.show(_scaffoldKey, "Order Successfully Placed");
                var response =
                    await buyNowBloc.emptyCart(prefsHelper.userPhone);
                response != 'Fail'
                    ? print('Cart Is Empty')
                    : print("Oops some error");
              } else {
                print("Online payment is not yet implemented");
              }
            } else
              print(response);
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
          RadioListTile<PaymentMode>(
            title: const Text('Cash on delievery'),
            selected: true,
            value: PaymentMode.Cod,
            groupValue: buyNowBloc.mode,
            onChanged: (PaymentMode mode) {
              setState(() {
                buyNowBloc.mode = mode;
              });
            },
          ),
          RadioListTile<PaymentMode>(
            title: const Text('Online'),
            value: PaymentMode.Online,
            groupValue: buyNowBloc.mode,
            onChanged: (PaymentMode mode) {
              setState(() {
                buyNowBloc.mode = mode;
              });
            },
          ),
        ],
      ),
    );
  }
}
