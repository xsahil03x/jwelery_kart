import 'package:flutter/material.dart';
import 'package:jwelery_kart/bloc/base_provider.dart';
import 'package:jwelery_kart/bloc/order_details_bloc.dart';
import 'package:jwelery_kart/data/local/sharedpreference_helper.dart';
import 'package:jwelery_kart/data/models/order.dart';
import 'package:jwelery_kart/pages/orderdetail/product_item.dart';
import 'package:jwelery_kart/utils/dialog_utils.dart';
import 'package:jwelery_kart/utils/app_utils.dart';

class OrderDetailScreen extends StatelessWidget {
  final String orderId;

  const OrderDetailScreen({this.orderId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderDetailsBloc>(
      builder: (_, bloc) => bloc ?? OrderDetailsBloc(orderId),
      onDispose: (_, bloc) => bloc.dispose(),
      child: RootApp(),
    );
  }
}

class RootApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderDetailBloc = Provider.of<OrderDetailsBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Detail'),
      ),
      bottomNavigationBar: Container(
        height: 50.0,
        child: RaisedButton(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(0.0)),
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      title: Text(
                        'Are you sure, you want to cancel ?',
                        style: TextStyle(),
                      ),
                      actions: <Widget>[
                        RaisedButton(
                            textColor: Colors.white,
                            child: Text('Yes'),
                            onPressed: () async {
                              var response = await orderDetailBloc
                                  .cancelOrder(prefsHelper.userPhone);
                              if (response != 'Fail') {
                                Navigator.pop(context);
                                orderDetailBloc.fetchOrderDetails();
                              } else {
                                print('NO');
                              }
                            })
                      ],
                    ));
          },
          color: Colors.red,
          child: Center(
            child: Text(
              "Cancel Order",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: StreamBuilder(
        stream: orderDetailBloc.order,
        builder: (BuildContext context, AsyncSnapshot<Order> snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(color: Colors.blue[100]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Order Id : ' + snapshot.data.orderId.toString(),
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Total Price : ₹ ' +
                                snapshot.data.orderPrice.toString(),
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Order Placed : ' + snapshot.data.orderDate,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Expected Delievery : ' +
                                snapshot.data.orderDeliveryDate,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Status : ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.0,
                                ),
                              ),
                              Text(
                                snapshot.data.orderStatus,
                                style: TextStyle(
                                  color: AppUtils.getStatusColor(
                                      snapshot.data.orderStatus),
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'List of items',
                      style: TextStyle(fontSize: 22.0, color: Colors.blue),
                    ),
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        ProductItem(snapshot.data.products.elementAt(index)),
                    itemCount: snapshot.data.products.length,
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Some Error..."),
            );
          } else
            return DialogUtils.showCircularProgressBar();
        },
      ),
    );
  }
}
