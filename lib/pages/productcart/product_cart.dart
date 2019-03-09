import 'package:flutter/material.dart';
import 'package:jwelery_kart/api/jwelery_kart_api.dart';
import 'package:jwelery_kart/bloc/base_provider.dart';
import 'package:jwelery_kart/bloc/cart_list_bloc.dart';
import 'package:jwelery_kart/models/cart_response.dart';
import 'package:jwelery_kart/pages/productcart/cart_item.dart';
import 'package:jwelery_kart/pages/productcart/custom_bottom_nav.dart';
import 'package:jwelery_kart/utils/dialog_utils.dart';

class ProductKart extends StatelessWidget {
  final String customerContact = "+918458944882";

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartListBloc>(
      builder: (_, bloc) =>
          bloc ?? CartListBloc(customerContact),
      onDispose: (_, bloc) => bloc.dispose(),
      child: RootApp(),
    );
  }
}

class RootApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartListBloc = Provider.of<CartListBloc>(context);
    return Scaffold(
      bottomNavigationBar: CustomBottomNav(),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Cart"),
      ),
      body: Container(
        child: StreamBuilder(
          stream: cartListBloc.cartResponse,
          builder:
              (BuildContext context, AsyncSnapshot<CartResponse> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.cart.length != 0)
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      CartItem(snapshot.data.cart.elementAt(index)),
                  itemCount: snapshot.data.cart.length,
                );
              else
                return Center(
                  child: Text("Oops empty list... Add some items"),
                );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Some Error..."),
              );
            } else {
              return DialogUtils.showCircularProgressBar();
            }
          },
        ),
      ),
    );
  }
}
