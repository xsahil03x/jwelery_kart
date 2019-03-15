import 'package:flutter/material.dart';
import 'package:jwelery_kart/bloc/base_provider.dart';
import 'package:jwelery_kart/bloc/my_orders_bloc.dart';
import 'package:jwelery_kart/data/local/sharedpreference_helper.dart';
import 'package:jwelery_kart/data/models/order_response.dart';
import 'package:jwelery_kart/pages/myorders/order_item.dart';
import 'package:jwelery_kart/utils/dialog_utils.dart';

class MyOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyOrdersBloc>(
      builder: (_, bloc) => bloc ?? MyOrdersBloc(prefsHelper.userPhone),
      onDispose: (_, bloc) => bloc.dispose(),
      child: RootApp(),
    );
  }
}

class RootApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myOrdersBloc = Provider.of<MyOrdersBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("My Orders"),
      ),
      body: Container(
        child: StreamBuilder(
          stream: myOrdersBloc.orders,
          builder:
              (BuildContext context, AsyncSnapshot<List<Orders>> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.length != 0)
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      OrderItem(snapshot.data.elementAt(index)),
                  itemCount: snapshot.data.length,
                );
              else
                return Center(
                  child: Text("No orders yet, Do some shopping"),
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
