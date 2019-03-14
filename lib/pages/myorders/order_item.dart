import 'package:flutter/material.dart';
import 'package:jwelery_kart/data/models/order_response.dart';

class OrderItem extends StatelessWidget {
  final Orders order;

  OrderItem(this.order);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(order.productDetails),
    );
  }
}
