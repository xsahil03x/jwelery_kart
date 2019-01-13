import 'package:jwelery_kart/bloc/base_bloc.dart';
import 'package:jwelery_kart/models/product_response.dart';
import 'package:jwelery_kart/utils/jwelery_kart_api.dart';
import 'package:rxdart/rxdart.dart';

class ProductListBloc extends BaseBloc {
  final JweleryKartApi kartApi;
  final String collectionId;

  Stream<List<ProductBrief>> _products = Stream.empty();

  Stream<List<ProductBrief>> get products => _products;

  ProductListBloc(this.kartApi, this.collectionId) {
    _products = Observable.defer(
      () => Observable.fromFuture(kartApi.getProductsByCollection(collectionId))
          .asBroadcastStream(),
      reusable: true,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
