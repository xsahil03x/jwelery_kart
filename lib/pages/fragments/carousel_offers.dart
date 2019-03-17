import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jwelery_kart/data/models/offer_product_response.dart';
import 'package:jwelery_kart/utils/app_utils.dart';

class CarouselOffers extends StatelessWidget {
  final List<OfferBrief> carouselOffers;

  CarouselOffers(this.carouselOffers);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      autoPlayInterval: Duration(seconds: 6),
      enlargeCenterPage: true,
      items: imgList.map((offer) {
        return Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: AppUtils.displayNetworkImage(offer),
          ),
        );
      }).toList(),
      autoPlay: true,
      aspectRatio: 2.0,
    );
  }
}

final List<String> imgList = [
  'https://cdn.pixabay.com/photo/2017/08/02/01/34/pocket-watch-2569573__340.jpg',
  'http://www.kantilalchhotalal.com/wp-content/uploads/2016/09/jewellery-banner-2.png',
  'http://thenewconnections.com/wp-content/uploads/2017/07/Banner1-1-500x250.jpg',
  'https://www.photographymad.com/files/images/reflected-earrings.jpg',
  'https://img.freepik.com/free-photo/jewels-sparkle-golden-wedding-rings-lying-leather_8353-763.jpg?size=626&ext=jpg'
];
