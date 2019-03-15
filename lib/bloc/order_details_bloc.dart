import 'package:jwelery_kart/bloc/base_bloc.dart';
import 'package:jwelery_kart/data/models/order.dart';
import 'package:jwelery_kart/data/remote/jwelery_kart_api.dart';
import 'package:rxdart/rxdart.dart';

class OrderDetailsBloc extends BaseBloc {
  final String orderId;
  BehaviorSubject<Order> _order = BehaviorSubject<Order>();

  Stream<Order> get order => _order.stream;

  OrderDetailsBloc(this.orderId) {
    fetchOrderDetails();
  }

  void fetchOrderDetails() {
    _order.sink.addStream(
      Observable.fromFuture(apiHelper.fetchIndividualOrder(orderId))
          .asBroadcastStream(),
    );
  }

  Future<String> cancelOrder(String customerContact) {
    return apiHelper.cancelOrder(customerContact, orderId);
  }

  @override
  void dispose() {
    _order?.close();
  }
}
