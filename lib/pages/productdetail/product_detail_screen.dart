import 'package:flutter/material.dart';
import 'package:jwelery_kart/bloc/base_provider.dart';
import 'package:jwelery_kart/bloc/product_detail_bloc.dart';
import 'package:jwelery_kart/data/models/product.dart';
import 'package:jwelery_kart/pages/home/cart_item_counter.dart';
import 'package:jwelery_kart/pages/productdetail/carousel_product_images.dart';
import 'package:jwelery_kart/pages/productdetail/custom_bottom_nav.dart';
import 'package:jwelery_kart/utils/dialog_utils.dart';
import 'package:jwelery_kart/pages/productdetail/shopping_action_widget.dart';
import 'package:jwelery_kart/widgets/description_text_widget.dart';
import 'package:jwelery_kart/widgets/discount_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  final String productId;

  const ProductDetailScreen({this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductDetailBloc>(
      builder: (_, bloc) => bloc ?? ProductDetailBloc(productId),
      onDispose: (_, bloc) => bloc.dispose(),
      child: RootApp(),
    );
  }
}

class RootApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productDetailBloc = Provider.of<ProductDetailBloc>(context);
    return Container(
      color: Colors.white,
      child: StreamBuilder(
          stream: productDetailBloc.product,
          builder: (BuildContext context, AsyncSnapshot<Product> snapshot) {
            if (snapshot.hasData) {
              return Scaffold(
                body: CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      actions: <Widget>[
                        CartItemCounter(),
                      ],
                      pinned: true,
                      expandedHeight:
                          ((MediaQuery.of(context).size.height * 2) / 3) - 24.0,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Container(
                            color: Colors.white,
                            child: CarouselProductImages(snapshot.data)),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                snapshot.data.productName,
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Text(
                                    '₹ ${snapshot.data.productPrice}',
                                    style: TextStyle(
                                      fontSize: 24.0,
                                      color: Colors.teal,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    maxLines: 1,
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    '₹ ${snapshot.data.productBasePrice}',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.red,
                                      decoration: TextDecoration.lineThrough,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    maxLines: 1,
                                  ),
                                  SizedBox(width: 10.0),
                                  DiscountWidget(
                                      productBasePrice:
                                          snapshot.data.productBasePrice,
                                      productPrice: snapshot.data.productPrice)
                                ],
                              ),
                              SizedBox(height: 2.0),
                              Text(
                                "(Inclusive of all Taxes)",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.all(4.0),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "About this Product",
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              DescriptionTextWidget(
                                text: snapshot.data.productDescription,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.all(4.0),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Available Sizes",
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blueGrey[700],
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              ShoppingActionWidget(product: snapshot.data)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                bottomNavigationBar: CustomBottomNav(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Some Error..."),
              );
            } else
              return Center(
                child: DialogUtils.showCircularProgressBar(),
              );
          }),
    );
  }
}
