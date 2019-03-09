import 'package:flutter/material.dart';
import 'package:jwelery_kart/bloc/base_provider.dart';
import 'package:jwelery_kart/bloc/product_detail_bloc.dart';
import 'package:jwelery_kart/data/models/product.dart';

class ShoppingActionWidget extends StatefulWidget {
  final Product product;

  ShoppingActionWidget({this.product});

  @override
  ShoppingActionWidgetState createState() {
    return new ShoppingActionWidgetState(product);
  }
}

class ShoppingActionWidgetState extends State<ShoppingActionWidget> {
  final Product product;

  ShoppingActionWidgetState(this.product);

  @override
  Widget build(BuildContext context) {
    final productDetailBloc = Provider.of<ProductDetailBloc>(context);
    String _sizeValue = productDetailBloc.getProductSize();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Wrap(
          alignment: WrapAlignment.spaceEvenly,
          children: product.productSize
              .map((size) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ChoiceChip(
                        backgroundColor: Colors.grey,
                        selectedColor: Colors.teal,
                        label: Text(
                          size,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        selected: _sizeValue == size,
                        onSelected: (selected) {
                          setState(() {
                            _sizeValue = selected ? size : null;
                            productDetailBloc.setProductSize(size);
                          });
                        }),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

//class ShoppingActionWidget extends StatelessWidget {
//  final Product product;
//
//  ShoppingActionWidget(this.product);
//
//  @override
//  Widget build(BuildContext context) {
//    final productDetailBloc = Provider.of<ProductDetailBloc>(context);
//    return StreamBuilder(
//        stream: productDetailBloc.productSize,
//        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//          return Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              Wrap(
//                alignment: WrapAlignment.spaceEvenly,
//                children: product.productSize
//                    .map((size) => Padding(
//                          padding: const EdgeInsets.all(8.0),
//                          child: ChoiceChip(
//                              backgroundColor: Colors.grey,
//                              selectedColor: Colors.teal,
//                              label: Text(
//                                size,
//                                style: TextStyle(
//                                    color: Colors.white,
//                                    fontWeight: FontWeight.bold),
//                              ),
//                              selected: snapshot.data == size,
//                              onSelected: (selected) {
//                                productDetailBloc.changeProductSize(size);
//                              }),
//                        ))
//                    .toList(),
//              ),
//            ],
//          );
//        });
//  }
//}
