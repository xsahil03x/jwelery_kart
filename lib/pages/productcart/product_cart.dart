import 'package:flutter/material.dart';
import 'package:jwelery_kart/bloc/base_provider.dart';
import 'package:jwelery_kart/bloc/cart_list_bloc.dart';
import 'package:jwelery_kart/models/cart_response.dart';
import 'package:jwelery_kart/pages/productcart/cart_item.dart';
import 'package:jwelery_kart/utils/dialog_utils.dart';
import 'package:jwelery_kart/utils/jwelery_kart_api.dart';

class ProductKart extends StatelessWidget {
  final String customerContact="+918458944882";

//  const ProductKart(this.customerContact);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartListBloc>(
      builder: (_, bloc) =>
          bloc ?? CartListBloc(JweleryKartApi(), customerContact),
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
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Cart"),
      ),
      body: Container(
        child: StreamBuilder(
            stream: cartListBloc.cartItems,
            builder:
                (BuildContext context, AsyncSnapshot<List<Cart>> snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: Text("Cart List"),
                );
//                return ListView.builder(
//                  scrollDirection: Axis.vertical,
//                  shrinkWrap: true,
//                  padding: EdgeInsets.only(
//                      left: 6.0, right: 6.0, bottom: 4.0, top: 4.0),
//                  itemBuilder: (context, index) =>
//                      CartItem(snapshot.data.elementAt(index)),
//                  itemCount: snapshot.data.length,
//                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Some Error..."),
                );
              } else {
                return DialogUtils.showCircularProgressBar();
              }
            }),
      ),
    );
  }
}
