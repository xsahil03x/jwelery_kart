import 'package:flutter/material.dart';
import 'package:jwelery_kart/data/models/cart_response.dart';

class AppUtils {
  static String generateProductId(List<Cart> cartItem) {
    String productId = '';
    cartItem.forEach((carItem) => productId += carItem.productName +
        "-" +
        carItem.productId.toString() +
        '-' +
        carItem.productPrice.toString() +
        '-' +
        carItem.productSize.toString() +
        '-1|');

    return productId;
  }

  static Color getStatusColor(String orderStatus) {
    if (orderStatus == 'Processing')
      return Colors.blueAccent;
    else if (orderStatus == 'Confirmed')
      return Colors.amber;
    else if (orderStatus == 'Prepared')
      return Colors.blueGrey;
    else if (orderStatus == 'Dispatched')
      return Colors.deepOrange;
    else if (orderStatus == 'Delivered')
      return Colors.green;
    else if (orderStatus == 'Failed')
      return Colors.red;
    else
      return Colors.black;
  }
}
