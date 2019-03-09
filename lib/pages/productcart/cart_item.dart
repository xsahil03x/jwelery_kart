import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jwelery_kart/bloc/base_provider.dart';
import 'package:jwelery_kart/bloc/cart_list_bloc.dart';
import 'package:jwelery_kart/data/models/cart_response.dart';

class CartItem extends StatelessWidget {
  final Cart cart;

  const CartItem(this.cart);

  @override
  Widget build(BuildContext context) {
    final cartListBloc = Provider.of<CartListBloc>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
        ),
        height: 200.0,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 150.0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            cart.productName,
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Size : ' + cart.productSize,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Color : ' + cart.productColor,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'Price : ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.0,
                                ),
                              ),
                              Text(
                                '₹ ${cart.productPrice}',
                                style: TextStyle(
                                  color: Colors.teal,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.0,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CachedNetworkImage(
                        imageUrl: cart.productImageURL,
                        fit: BoxFit.fitHeight,
                        height: 150.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.black12))),
              height: 48.0,
              child: FlatButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(0.0)),
                onPressed: () {
                  cartListBloc.removeItemFromCart(
                      "+918458944882", cart.productId.toString());
                  cartListBloc.removeItemResult.listen((result) {
                    if (result == 'Success') {
                      cartListBloc.fetchCartResponse();
                    } else {}
                  });
                },
                child: Center(
                  child: Text(
                    "REMOVE",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
