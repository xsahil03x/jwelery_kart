import 'package:flutter/material.dart';
import 'package:jwelery_kart/bloc/base_provider.dart';
import 'package:jwelery_kart/bloc/product_detail_bloc.dart';

class CustomBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final snackBar = SnackBar(content: Text('Successfully Added'));
    final productDetailBloc = Provider.of<ProductDetailBloc>(context);
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
              onPressed: () {
                productDetailBloc.addItemToCart("+918458944882");
                productDetailBloc.addItemResult.listen((result) {
                  if (result == 'Success') {
                    Scaffold.of(context).showSnackBar(snackBar);
                  }
                });
              },
              color: Colors.grey,
              child: Center(
                child: Text(
                  "ADD TO CART",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: RaisedButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(0.0)),
              onPressed: () {},
              color: Colors.teal,
              child: Center(
                child: Text(
                  "BUY NOW",
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
