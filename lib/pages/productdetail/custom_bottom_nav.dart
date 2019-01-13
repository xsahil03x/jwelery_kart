import 'package:flutter/material.dart';
import 'package:jwelery_kart/bloc/base_provider.dart';
import 'package:jwelery_kart/bloc/product_detail_bloc.dart';
import 'package:jwelery_kart/models/product.dart';
import 'package:jwelery_kart/utils/dialog_utils.dart';
import 'package:jwelery_kart/utils/snackbar_utils.dart';

class CustomBottomNav extends StatelessWidget {
  final Product product;

  const CustomBottomNav(this.product);

  @override
  Widget build(BuildContext context) {
    final snackBar = SnackBar(content: Text('Successfully Added'));
    final productDetailBloc = Provider.of<ProductDetailBloc>(context);
    final Map<String, String> addBody = new Map();
    addBody['customerContact'] = '+917987036365';
    addBody['productId'] = product.productId.toString();
    addBody['productName'] = product.productName;
    addBody['productSize'] = product.productSize[0];
    addBody['productColor'] = product.productColor;
    addBody['productQuantity'] = '1';
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
                Scaffold.of(context).showSnackBar(snackBar);
//                productDetailBloc.addItemToCart(addBody);
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
