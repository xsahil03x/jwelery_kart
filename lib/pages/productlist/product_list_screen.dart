import 'package:flutter/material.dart';
import 'package:jwelery_kart/bloc/base_provider.dart';
import 'package:jwelery_kart/bloc/product_list_bloc.dart';
import 'package:jwelery_kart/models/product_response.dart';
import 'package:jwelery_kart/pages/productlist/product_card.dart';
import 'package:jwelery_kart/utils/dialog_utils.dart';
import 'package:jwelery_kart/utils/jwelery_kart_api.dart';

class ProductListScreen extends StatelessWidget {
  final String collectionId;

  const ProductListScreen({this.collectionId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductListBloc>(
      builder: (_, bloc) =>
          bloc ?? ProductListBloc(JweleryKartApi(), collectionId),
      onDispose: (_, bloc) => bloc.dispose(),
      child: RootApp(),
    );
  }
}

class RootApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productListBloc = Provider.of<ProductListBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Products"),
      ),
      body: Container(
        child: StreamBuilder(
            stream: productListBloc.products,
            builder: (BuildContext context,
                AsyncSnapshot<List<ProductBrief>> snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  padding: EdgeInsets.only(
                      left: 6.0, right: 6.0, bottom: 4.0, top: 4.0),
                  itemBuilder: (context, index) =>
                      ProductCard(snapshot.data.elementAt(index)),
                  itemCount: snapshot.data.length,
                );
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
