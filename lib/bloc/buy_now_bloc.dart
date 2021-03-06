import 'package:jwelery_kart/bloc/base_bloc.dart';
import 'package:jwelery_kart/data/remote/jwelery_kart_api.dart';

enum PaymentMode { Online, Cod }

class BuyNowBloc extends BaseBloc {
  final String _productId;
  final String _orderPrice;

  PaymentMode mode = PaymentMode.Cod;

  BuyNowBloc(this._productId, this._orderPrice);

  Future<String> placeOrder(String customerContact) {
    return apiHelper.placeOrder(
        _productId,
        _orderPrice,
        mode == PaymentMode.Cod ? 'Cash on Delivery' : 'Online',
        customerContact);
  }

  Future<String> emptyCart(String customerCart) {
    return apiHelper.emptyCart(customerCart);
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
