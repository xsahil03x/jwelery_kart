import 'dart:async';

import 'package:jwelery_kart/bloc/base_bloc.dart';
import 'package:jwelery_kart/data/models/product_response.dart';
import 'package:jwelery_kart/data/remote/jwelery_kart_api.dart';
import 'package:rxdart/rxdart.dart';

class ProductListBloc extends BaseBloc {
  final String collectionId;

  BehaviorSubject<List<ProductBrief>> _products =
      BehaviorSubject<List<ProductBrief>>();

  Stream<List<ProductBrief>> get products => _products.stream;

  ProductListBloc(this.collectionId) {
    _products.sink.addStream(
      Observable.fromFuture(apiHelper.getProductsByCollection(collectionId))
          .asBroadcastStream(),
    );
  }

  @override
  void dispose() {
    _products?.close();
  }
}
