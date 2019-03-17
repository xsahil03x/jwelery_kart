import 'dart:async';

import 'package:jwelery_kart/bloc/base_bloc.dart';
import 'package:jwelery_kart/data/models/product.dart';
import 'package:jwelery_kart/data/remote/jwelery_kart_api.dart';
import 'package:rxdart/rxdart.dart';

class ProductDetailBloc extends BaseBloc {
  final String productId;

  String productSize;

  BehaviorSubject<Product> _product = BehaviorSubject<Product>();

  Stream<Product> get product => _product.stream;

  ProductDetailBloc(this.productId) {
    _product.sink.addStream(
      Observable.fromFuture(apiHelper.getProductDetail(productId))
          .asBroadcastStream(),
    );
  }

  Future<String> addItemToCart(String customerContact) async {
    return await apiHelper.addItemToCart(
      _product.value,
      customerContact,
      productSize,
    );
  }

  bool isProductSizeSelected() {
    return productSize == null ? false : true;
  }

  @override
  void dispose() {
    _product?.close();
  }
}
