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
}
