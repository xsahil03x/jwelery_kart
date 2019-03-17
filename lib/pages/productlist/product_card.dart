import 'package:flutter/material.dart';
import 'package:jwelery_kart/config/application.dart';
import 'package:jwelery_kart/config/routes.dart';
import 'package:jwelery_kart/data/models/product_response.dart';
import 'package:jwelery_kart/utils/app_utils.dart';
import 'package:jwelery_kart/widgets/discount_widget.dart';

class ProductCard extends StatelessWidget {
  final ProductBrief product;

  ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.8,
      child: Container(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            if (product.productId.toString().isNotEmpty) {
              Application.router.navigateTo(
                context,
                Routes.productDetail +
                    "?productId=${product.productId.toString()}",
              );
            }
          },
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
            elevation: 1.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0))),
            child: Container(
              child: Stack(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: ClipRRect(
                          borderRadius: new BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                          child: AppUtils.displayNetworkImage(
                              product.productImageURL),
                        ),
                      ),
                      // Expanded(
                      //   child: Container(color: Colors.grey[300]),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              product.productName,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 1,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Text(
                                  '₹ ${product.productPrice}',
                                  style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  maxLines: 1,
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  '₹ ${product.productBasePrice}',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.red,
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  maxLines: 1,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 0.0,
                    top: 0.0,
                    child: DiscountWidget(
                      productBasePrice: product.productBasePrice,
                      productPrice: product.productPrice,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
