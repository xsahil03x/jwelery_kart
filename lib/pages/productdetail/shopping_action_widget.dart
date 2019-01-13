import 'package:flutter/material.dart';
import 'package:jwelery_kart/models/product.dart';

class ShoppingActionWidget extends StatefulWidget {
  final Product product;

  ShoppingActionWidget({this.product});

  @override
  ShoppingActionWidgetState createState() {
    return new ShoppingActionWidgetState(product);
  }
}

class ShoppingActionWidgetState extends State<ShoppingActionWidget> {
  String _value;
  String _sizeValue;
  final Product product;

  ShoppingActionWidgetState(this.product);

  Widget colorsCard() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Colors",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: product.productSize
                .map((pc) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ChoiceChip(
                          label: Text(
                            pc,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          selected: _value == pc,
                          onSelected: (selected) {
                            setState(() {
                              _value = selected ? pc : null;
                            });
                          }),
                    ))
                .toList(),
          ),
        ],
      );

  Widget sizesCard() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
//          Text(
//            "Sizes",
//            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
//          ),
//          SizedBox(
//            height: 10.0,
//          ),
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
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          selected: _sizeValue == size,
                          onSelected: (selected) {
                            setState(() {
                              _sizeValue = selected ? size : null;
                            });
                          }),
                    ))
                .toList(),
          ),
        ],
      );

//  Widget quantityCard() {
//    CartBloc cartBloc = CartBloc(widget.product);
//    return Column(
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children: <Widget>[
//        Text(
//          "Sizes",
//          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
//        ),
//        SizedBox(
//          height: 10.0,
//        ),
//        Row(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          children: <Widget>[
//            CustomFloat(
//              isMini: true,
//              icon: FontAwesomeIcons.minus,
//              qrCallback: () => cartBloc.subtractionController.add(true),
//            ),
//            StreamBuilder<int>(
//              stream: cartBloc.getCount,
//              initialData: 0,
//              builder: (context, snapshot) => Text(
//                    snapshot.data.toString(),
//                    style:
//                        TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
//                  ),
//            ),
//            CustomFloat(
//              isMini: true,
//              icon: FontAwesomeIcons.plus,
//              qrCallback: () => cartBloc.additionalController.add(true),
//            ),
//          ],
//        )
//      ],
//    );
//  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
//        colorsCard(),
//        Divider(height: 8.0),
//        SizedBox(
//          height: 5.0,
//        ),
        sizesCard(),
//        Divider(height: 8.0),
//        SizedBox(
//          height: 5.0,
//        ),
//        Divider(height: 8.0),
//        SizedBox(
//          height: 20.0,
//        ),
      ],
    );
  }
}

final List<String> colorList = ['Red', 'Green', 'Blue', 'Cyan'];
final List<String> sizeList = ['XL', 'XXL', 'M', 'L'];
