import 'package:jwelery_kart/bloc/base_bloc.dart';
import 'package:jwelery_kart/models/collection_response.dart';
import 'package:jwelery_kart/models/offer_product_response.dart';
import 'package:jwelery_kart/models/product_response.dart';
import 'package:jwelery_kart/utils/jwelery_kart_api.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

class JweleryKartBloc extends BaseBloc {
  final JweleryKartApi kartApi;

  Stream<List<Collection>> _womenCollections = Stream.empty();
  Stream<List<OfferBrief>> _womenOffers = Stream.empty();
  Stream<List<ProductBrief>> _womenProducts = Stream.empty();

  Stream<List<Collection>> get womenCollections => _womenCollections;

  Stream<List<OfferBrief>> get womenOffers => _womenOffers;

  Stream<List<ProductBrief>> get womenProducts => _womenProducts;

  Stream<List<Collection>> _menCollections = Stream.empty();
  Stream<List<OfferBrief>> _menOffers = Stream.empty();
  Stream<List<ProductBrief>> _menProducts = Stream.empty();

  Stream<List<Collection>> get menCollections => _menCollections;

  Stream<List<OfferBrief>> get menOffers => _menOffers;

  Stream<List<ProductBrief>> get menProducts => _menProducts;

  JweleryKartBloc(this.kartApi) {
    _womenCollections = Observable.defer(
      () => Observable.fromFuture(kartApi.getWomenCollections())
          .asBroadcastStream(),
      reusable: true,
    );

    _womenOffers = Observable.defer(
      () => Observable.fromFuture(kartApi.getWomenOffers()).asBroadcastStream(),
      reusable: true,
    );

    _womenProducts = Observable.defer(
      () =>
          Observable.fromFuture(kartApi.getWomenProducts()).asBroadcastStream(),
      reusable: true,
    );

    _menCollections = Observable.defer(
      () => Observable.fromFuture(kartApi.getMenCollections())
          .asBroadcastStream(),
      reusable: true,
    );

    _menOffers = Observable.defer(
      () => Observable.fromFuture(kartApi.getMenOffers()).asBroadcastStream(),
      reusable: true,
    );

    _menProducts = Observable.defer(
      () => Observable.fromFuture(kartApi.getMenProducts()).asBroadcastStream(),
      reusable: true,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
