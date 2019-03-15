import 'package:flutter/material.dart';
import 'package:jwelery_kart/data/models/order_response.dart';

class OrderItem extends StatelessWidget {
  final Orders order;

  OrderItem(this.order);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Order Id : ' + order.orderId.toString(),
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    order.productDetails,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Order Placed : ' + order.orderDate,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Current Status : ',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        order.orderStatus,
                        style: TextStyle(
                          color: getStatusColor(order.orderStatus),
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.black12))),
              height: 48.0,
              child: FlatButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(0.0)),
                onPressed: () {},
                child: Center(
                  child: Text(
                    "VIEW DETAILS",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Color getStatusColor(String orderStatus) {
  if (orderStatus == 'Processing')
    return Colors.blueAccent;
  else if (orderStatus == 'Confirmed')
    return Colors.amber;
  else if (orderStatus == 'Prepared')
    return Colors.blueGrey;
  else if (orderStatus == 'Dispatched')
    return Colors.deepOrange;
  else if (orderStatus == 'Delivered')
    return Colors.green;
  else if (orderStatus == 'Failed')
    return Colors.red;
  else
    return Colors.black;
}
