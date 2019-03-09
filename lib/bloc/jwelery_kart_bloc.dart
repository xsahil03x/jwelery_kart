import 'package:jwelery_kart/bloc/base_bloc.dart';
import 'package:jwelery_kart/models/collection_response.dart';
import 'package:jwelery_kart/models/offer_product_response.dart';
import 'package:jwelery_kart/models/product_response.dart';
import 'package:jwelery_kart/api/jwelery_kart_api.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

class JweleryKartBloc extends BaseBloc {
  BehaviorSubject<List<Collection>> _womenCollections =
      BehaviorSubject<List<Collection>>();
  BehaviorSubject<List<OfferBrief>> _womenOffers =
      BehaviorSubject<List<OfferBrief>>();
  BehaviorSubject<List<ProductBrief>> _womenProducts =
      BehaviorSubject<List<ProductBrief>>();

  Stream<List<Collection>> get womenCollections => _womenCollections.stream;

  Stream<List<OfferBrief>> get womenOffers => _womenOffers.stream;

  Stream<List<ProductBrief>> get womenProducts => _womenProducts.stream;

  BehaviorSubject<List<Collection>> _menCollections =
      BehaviorSubject<List<Collection>>();
  BehaviorSubject<List<OfferBrief>> _menOffers =
      BehaviorSubject<List<OfferBrief>>();
  BehaviorSubject<List<ProductBrief>> _menProducts =
      BehaviorSubject<List<ProductBrief>>();

  Stream<List<Collection>> get menCollections => _menCollections.stream;

  Stream<List<OfferBrief>> get menOffers => _menOffers.stream;

  Stream<List<ProductBrief>> get menProducts => _menProducts.stream;

  JweleryKartBloc() {
    _womenCollections.sink.addStream(
      Observable.fromFuture(apiHelper.getWomenCollections())
          .asBroadcastStream(),
    );

    _womenOffers.sink.addStream(
      Observable.fromFuture(apiHelper.getWomenOffers()).asBroadcastStream(),
    );

    _womenProducts.sink.addStream(
      Observable.fromFuture(apiHelper.getWomenProducts()).asBroadcastStream(),
    );

    _menCollections.sink.addStream(
      Observable.fromFuture(apiHelper.getMenCollections()).asBroadcastStream(),
    );

    _menOffers.sink.addStream(
      Observable.fromFuture(apiHelper.getMenOffers()).asBroadcastStream(),
    );

    _menProducts.sink.addStream(
      Observable.fromFuture(apiHelper.getMenProducts()).asBroadcastStream(),
    );
  }

  @override
  void dispose() {
    _womenProducts?.close();
    _womenOffers?.close();
    _womenCollections?.close();
    _menProducts?.close();
    _menOffers?.close();
    _menCollections?.close();
  }
}
