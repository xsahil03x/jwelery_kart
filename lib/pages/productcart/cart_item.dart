import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jwelery_kart/models/cart_response.dart';

class CartItem extends StatelessWidget {
  final Cart cart;

  const CartItem(this.cart);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(cart.productName),
              Container(
                width: 100.0,
                height: 100.0,
                child: CachedNetworkImage(
                  imageUrl:
                      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(cart.productQuantity.toString()),
              Text(cart.productColor),
              Text(cart.productSize)
            ],
          )
        ],
      ),
    );
  }
}
