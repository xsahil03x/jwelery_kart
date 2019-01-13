import 'package:jwelery_kart/bloc/base_bloc.dart';
import 'package:jwelery_kart/models/cart_response.dart';
import 'package:jwelery_kart/utils/jwelery_kart_api.dart';
import 'package:rxdart/rxdart.dart';

class CartListBloc extends BaseBloc {
  final JweleryKartApi kartApi;
  final String customerContact;

  Stream<List<Cart>> _cartItems = Stream.empty();

//  Stream<String> _addItemResult = Stream.empty();
//  Stream<String> _removeItemResult = Stream.empty();

  Stream<List<Cart>> get cartItems => _cartItems;

//  Stream<String> get addItemResult => _addItemResult;
//
//  Stream<String> get removeItemResult => _removeItemResult;

  CartListBloc(this.kartApi, this.customerContact) {
    _cartItems = Observable.defer(
      () => Observable.fromFuture(kartApi.getCartList(customerContact))
          .asBroadcastStream(),
      reusable: true,
    );
  }

//  addItemToCart(Map<String, String> addBody) {
////    Map<String, String> addBody = new Map();
////    addBody['customerContact'] = 'admin';
////    addBody['productId'] = cart.productId.toString();
////    addBody['productName'] = cart.productName;
////    addBody['productSize'] = cart.productSize;
////    addBody['productColor'] = cart.productColor;
////    addBody['productQuantity'] = cart.productQuantity.toString();
//
//    _addItemResult = Observable.defer(
//        () => Observable.fromFuture(kartApi.addItemToCart(addBody))
//            .asBroadcastStream(),
//        reusable: true);
//  }
//
//  removeItemFromCart(Map<String, String> deleteBody) {
//    _removeItemResult = Observable.defer(
//        () => Observable.fromFuture(kartApi.removeItemFromCart(deleteBody))
//            .asBroadcastStream(),
//        reusable: true);
//  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
