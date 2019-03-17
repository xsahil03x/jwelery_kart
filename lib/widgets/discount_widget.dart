import 'package:flutter/material.dart';

class DiscountWidget extends StatelessWidget {
  final String productBasePrice, productPrice;

  DiscountWidget({this.productBasePrice, this.productPrice});

  @override
  Widget build(BuildContext context) {
    assert(productBasePrice != null && productBasePrice.isNotEmpty);
    return Container(
      height: 20.0,
      padding: EdgeInsets.only(left: 6.0, right: 6.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(4.0),
          topRight: Radius.circular(4.0),
        ),
        color: Colors.black.withOpacity(0.75),
      ),
      child: Text(
        (((int.parse(productBasePrice) - int.parse(productPrice)) /
                        int.parse(productBasePrice)) *
                    100)
                .toStringAsFixed(0)
                .replaceAll(r'-d', "")
                .toUpperCase() +
            '%',
        style: TextStyle(
            color: Colors.white.withOpacity(1.0),
            letterSpacing: 1.0,
            fontSize: 9.0,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
