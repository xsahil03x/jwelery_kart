import 'dart:async';

import 'package:jwelery_kart/bloc/base_bloc.dart';
import 'package:jwelery_kart/data/models/product.dart';
import 'package:jwelery_kart/data/remote/jwelery_kart_api.dart';
import 'package:rxdart/rxdart.dart';

class ProductDetailBloc extends BaseBloc {
  final String productId;

  String productSize;

  BehaviorSubject<Product> _product = BehaviorSubject<Product>();
  BehaviorSubject<String> _addItemResult = BehaviorSubject<String>();

  Stream<String> get addItemResult => _addItemResult.stream;

  Stream<Product> get product => _product.stream;

  ProductDetailBloc(this.productId) {
    _product.sink.addStream(
      Observable.fromFuture(apiHelper.getProductDetail(productId))
          .asBroadcastStream(),
    );
  }

  void addItemToCart(String customerContact) {
    _addItemResult.sink.addStream(
      Observable.fromFuture(apiHelper.addItemToCart(
        _product.value,
        customerContact,
        productSize,
      )).asBroadcastStream(),
    );
  }

  @override
  void dispose() {
    _product?.close();
    _addItemResult?.close();
  }
}
