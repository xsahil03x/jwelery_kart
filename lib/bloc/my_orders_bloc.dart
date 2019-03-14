import 'package:jwelery_kart/bloc/base_bloc.dart';
import 'package:jwelery_kart/data/models/order_response.dart';
import 'package:jwelery_kart/data/remote/jwelery_kart_api.dart';
import 'package:rxdart/rxdart.dart';

class MyOrdersBloc extends BaseBloc {
  final String customerContact;

  BehaviorSubject<List<Orders>> _orders = BehaviorSubject<List<Orders>>();

  Stream<List<Orders>> get orders => _orders.stream;

  MyOrdersBloc(this.customerContact) {
    fetchOrders();
  }

  void fetchOrders() {
    _orders.sink.addStream(
      Observable.fromFuture(apiHelper.fetchOrders(customerContact))
          .asBroadcastStream(),
    );
  }

  @override
  void dispose() {
    _orders?.close();
  }
}
