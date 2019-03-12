import 'package:flutter/material.dart';
import 'package:jwelery_kart/bloc/base_provider.dart';
import 'package:jwelery_kart/bloc/cart_list_bloc.dart';
import 'package:jwelery_kart/config/application.dart';
import 'package:jwelery_kart/config/routes.dart';
import 'package:jwelery_kart/data/models/cart_response.dart';

class CartItemCounter extends StatelessWidget {
  final String customerContact = "+918458944882";

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartListBloc>(
      builder: (_, bloc) => bloc ?? CartListBloc(customerContact),
      onDispose: (_, bloc) => bloc.dispose(),
      child: RootApp(),
    );
  }
}

class RootApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartListBloc = Provider.of<CartListBloc>(context);
    return Stack(
      children: <Widget>[
        IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            onPressed: () {
              Application.router.navigateTo(
                context,
                Routes.cartList,
              );
            }),
        Positioned(
            top: 6.0,
            right: 10.0,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: StreamBuilder(
                  stream: cartListBloc.cartResponse,
                  builder: (BuildContext context,
                      AsyncSnapshot<CartResponse> snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data.cart.length.toString(),
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
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber,
              ),
            )),
      ],
    );
  }
}
