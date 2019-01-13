import 'package:flutter/material.dart';
import 'package:jwelery_kart/bloc/base_provider.dart';
import 'package:jwelery_kart/bloc/jwelery_kart_bloc.dart';
import 'package:jwelery_kart/models/collection_response.dart';
import 'package:jwelery_kart/models/offer_product_response.dart';
import 'package:jwelery_kart/models/product_response.dart';
import 'package:jwelery_kart/pages/fragments/carousel_offers.dart';
import 'package:jwelery_kart/pages/fragments/collection_card.dart';
import 'package:jwelery_kart/pages/fragments/item_card.dart';
import 'package:jwelery_kart/pages/fragments/offer_card.dart';
import 'package:jwelery_kart/utils/dialog_utils.dart';

class WomenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final jweleryKartBloc = Provider.of<JweleryKartBloc>(context);
    return StreamBuilder(
      stream: jweleryKartBloc.womenCollections,
      builder:
          (BuildContext context, AsyncSnapshot<List<Collection>> snapshot) {
        if (snapshot.hasData) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverPadding(
                padding: EdgeInsets.all(0.0),
                sliver: SliverToBoxAdapter(
                  child: Container(
                      height: MediaQuery.of(context).size.height / 3.0,
                      color: Colors.white,
                      child: StreamBuilder(
                        stream: jweleryKartBloc.menOffers,
                        builder: (BuildContext context,
                            AsyncSnapshot<List<OfferBrief>> snapshot) {
                          if (snapshot.hasData) {
                            return CarouselOffers(snapshot.data);
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text("Some error..."),
                            );
                          } else {
                            return Center(
                                child: DialogUtils.showCircularProgressBar());
                          }
                        },
                      )),
                ),
              ),
              SliverPadding(padding: EdgeInsets.symmetric(vertical: 5.0)),
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 8.0, bottom: 0.0, left: 12.0, right: 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Collections",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1.2,
                                  color: Colors.blueGrey[900],
                                  fontSize: 12.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
              SliverPadding(
                padding: EdgeInsets.all(0.0),
                sliver: SliverToBoxAdapter(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 3.0,
                    color: Colors.white,
                    child: ListView.builder(
                      padding: EdgeInsets.only(
                          left: 6.0, right: 6.0, top: 4.0, bottom: 12.0),
                      itemBuilder: (context, index) {
                        return CollectionCard(snapshot.data.elementAt(index));
                      },
                      itemCount: snapshot.data.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
              ),
              SliverPadding(padding: EdgeInsets.symmetric(vertical: 5.0)),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 14.0, bottom: 6.0, left: 12.0, right: 12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "Hot Offers",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1.2,
                                    color: Colors.blueGrey[900],
                                    fontSize: 14.0),
                              ),
                            ),
//                            ViewAll(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 0.0),
                sliver: SliverList(
                    delegate: SliverChildListDelegate([
                  Container(
                    height: 190.0,
                    color: Colors.white,
                    child: StreamBuilder(
                      stream: jweleryKartBloc.womenOffers,
                      builder: (BuildContext context,
                          AsyncSnapshot<List<OfferBrief>> snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            padding: EdgeInsets.only(
                                left: 6.0, right: 6.0, bottom: 4.0, top: 4.0),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                OfferCard(snapshot.data.elementAt(index)),
                            itemCount: snapshot.data.length,
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text("Some error..."),
                          );
                        } else {
                          return DialogUtils.showCircularProgressBar();
                        }
                      },
                    ),
                    padding: EdgeInsets.only(bottom: 8.0, top: 4.0),
                  ),
                ])),
              ),
              SliverPadding(padding: EdgeInsets.symmetric(vertical: 5.0)),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 14.0, bottom: 6.0, left: 12.0, right: 12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "Hot Products",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1.2,
                                    color: Colors.blueGrey[900],
                                    fontSize: 14.0),
                              ),
                            ),
//                            ViewAll(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 0.0),
                sliver: SliverList(
                    delegate: SliverChildListDelegate([
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        child: StreamBuilder(
                          stream: jweleryKartBloc.womenProducts,
                          builder: (BuildContext context,
                              AsyncSnapshot<List<ProductBrief>> snapshot) {
                            if (snapshot.hasData) {
                              return GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                padding: EdgeInsets.only(
                                    left: 6.0,
                                    right: 6.0,
                                    bottom: 4.0,
                                    top: 4.0),
                                itemBuilder: (context, index) =>
                                    ItemCard(snapshot.data.elementAt(index)),
                                itemCount: snapshot.data.length,
                              );
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Text("Some error..."),
                              );
                            } else {
                              return DialogUtils.showCircularProgressBar();
                            }
                          },
                        ),
                        padding: EdgeInsets.only(bottom: 8.0, top: 4.0),
                      ),
                    ],
                  ),
                ])),
              ),
              SliverPadding(padding: EdgeInsets.symmetric(vertical: 10.0)),
            ],
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Some error..."),
          );
        } else {
          return DialogUtils.showCircularProgressBar();
        }
      },
    );
  }
}
