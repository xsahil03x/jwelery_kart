import 'package:jwelery_kart/pages/buynow/buy_now.dart';
import 'package:jwelery_kart/pages/home/home_screen.dart';
import 'package:jwelery_kart/pages/myorders/my_orders_screen.dart';
import 'package:jwelery_kart/pages/orderdetail/order_detail_screen.dart';
import 'package:jwelery_kart/pages/productcart/product_cart_screen.dart';
import 'package:jwelery_kart/pages/productdetail/product_detail_screen.dart';
import 'package:jwelery_kart/pages/productlist/product_list_screen.dart';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:jwelery_kart/pages/registration/user_info_screen.dart';

var rootHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new HomeScreen();
});

var mainHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new HomeScreen();
});

var productListHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String collectionId = params["collectionId"]?.first;
  return new ProductListScreen(
    collectionId: collectionId,
  );
});

var productDetailHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String productId = params["productId"]?.first;
  return new ProductDetailScreen(
    productId: productId,
  );
});

var cartListHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new ProductCartScreen();
});

var buyNowHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String productId = params["productId"]?.first;
  String orderPrice = params["orderPrice"]?.first;
  return new BuyNow(
    productId: productId,
    orderPrice: orderPrice,
  );
});

var userDetailHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new UserInfoScreen();
});

var myOrdersHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new MyOrdersScreen();
});

var orderDetailHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String orderId = params["orderId"]?.first;
  return new OrderDetailScreen(
    orderId: orderId,
  );
});
