import 'package:flutter/material.dart';
import 'package:jwelery_kart/bloc/base_provider.dart';
import 'package:jwelery_kart/bloc/product_detail_bloc.dart';
import 'package:jwelery_kart/config/application.dart';
import 'package:jwelery_kart/config/routes.dart';
import 'package:jwelery_kart/data/local/sharedpreference_helper.dart';
import 'package:jwelery_kart/utils/dialog_utils.dart';

class CustomBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              onPressed: () async {
                if (productDetailBloc.isProductSizeSelected()) {
                  DialogUtils.showProgressBar(context, "Please wait...");
                  await Future.delayed(Duration(seconds: 1));
                  await productDetailBloc
                      .addItemToCart(prefsHelper.userPhone)
                      .then((response) {
                    if (response != 'Fail') {
                      Navigator.pop(context);
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('Successfully Added'),
                        duration: Duration(seconds: 1),
                      ));
                    } else {
                      Navigator.pop(context);
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('Something went wrong...'),
                        duration: Duration(seconds: 1),
                      ));
                    }
                  });
                } else
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Please select size'),
                    duration: Duration(seconds: 1),
                  ));
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
              onPressed: () {
                Application.router.navigateTo(
                  context,
                  Routes.cartList,
                );
              },
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
