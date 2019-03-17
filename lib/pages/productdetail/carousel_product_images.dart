import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jwelery_kart/data/models/product.dart';

class CarouselProductImages extends StatelessWidget {
  final Product product;

  CarouselProductImages(this.product);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      height: (MediaQuery.of(context).size.height * 2) / 3,
      viewportFraction: 1.0,
      items: product.productImageURLs.map((image) {
        return Container(
          child: image.isNotEmpty
              ? CachedNetworkImage(
                  imageUrl: image,
                  errorWidget: (context, url, error) => Image.asset(
                        'assets/images/ic_error_placeholder.png',
                        fit: BoxFit.cover,
                      ),
                  fit: BoxFit.cover,
                  height: (MediaQuery.of(context).size.height * 2) / 3,
                  width: double.infinity,
                )
              : Image.asset(
                  'assets/images/ic_error_placeholder.png',
                  fit: BoxFit.cover,
                ),
        );
      }).toList(),
      autoPlay: false,
    );
  }
}
