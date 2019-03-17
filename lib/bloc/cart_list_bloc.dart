import 'dart:async';

import 'package:jwelery_kart/data/remote/jwelery_kart_api.dart';
import 'package:jwelery_kart/bloc/base_bloc.dart';
import 'package:jwelery_kart/data/models/cart_response.dart';
import 'package:rxdart/rxdart.dart';

class CartListBloc extends BaseBloc {
  final String customerContact;

  BehaviorSubject<String> _totalPrice = BehaviorSubject<String>();
  BehaviorSubject<CartResponse> _cartResponse = BehaviorSubject<CartResponse>();

  Stream<CartResponse> get cartResponse => _cartResponse.stream;

  Stream<String> get totalPrice => _totalPrice.stream;

  CartListBloc(this.customerContact) {
    fetchCartResponse();
  }

  void fetchCartResponse() {
    _cartResponse.sink.addStream(
      Observable.fromFuture(apiHelper.getCartResponse(customerContact))
          .asBroadcastStream(),
    );
  }

  Future<String> removeItemFromCart(
      String customerContact, String productId) async {
    return await apiHelper.removeItemFromCart(customerContact, productId);
  }

  @override
  void dispose() {
    _totalPrice?.close();
    _cartResponse?.close();
  }
}
