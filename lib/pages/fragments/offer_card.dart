import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jwelery_kart/data/models/offer_product_response.dart';
import 'package:jwelery_kart/utils/app_utils.dart';

class OfferCard extends StatelessWidget {
  final OfferBrief offerBrief;

  OfferCard(this.offerBrief);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      margin: EdgeInsets.all(2.0),
      child: AppUtils.displayNetworkImage(offerBrief.productImageURL),
    );
  }
}
