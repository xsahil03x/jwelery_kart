import 'package:cached_network_image/cached_network_image.dart';
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

  static Widget displayNetworkImage(String url) {
    return url.isNotEmpty
        ? CachedNetworkImage(
            imageUrl: url,
            errorWidget: (context, url, error) => Image.asset(
                  'assets/images/ic_error_placeholder.png',
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          )
        : Image.asset(
            'assets/images/ic_error_placeholder.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          );
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
