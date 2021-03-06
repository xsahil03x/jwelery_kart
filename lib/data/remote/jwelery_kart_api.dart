import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:jwelery_kart/data/models/cart_response.dart';
import 'package:jwelery_kart/data/models/collection_response.dart';
import 'package:jwelery_kart/data/models/customer.dart';
import 'package:jwelery_kart/data/models/offer_product_response.dart';
import 'package:jwelery_kart/data/models/order.dart';
import 'package:jwelery_kart/data/models/order_response.dart';
import 'package:jwelery_kart/data/models/paytm_model.dart';
import 'package:jwelery_kart/data/models/product.dart';
import 'package:jwelery_kart/data/models/product_response.dart';

JeweleryKartApi apiHelper = new JeweleryKartApi();

class JeweleryKartApi {
  final Client _client = Client();

  static const String _rootUrl =
      'http://jewelrykart-env.s4kbz4hmp3.ap-south-1.elasticbeanstalk.com/';

  static final JeweleryKartApi _instance = new JeweleryKartApi._internal();

  factory JeweleryKartApi() {
    return _instance;
  }

  JeweleryKartApi._internal();

  Future<List<Collection>> getWomenCollections() async {
    List<Collection> collections = [];
    await _client
        .get(_rootUrl + 'product?task=fetchWomenCollections')
        .then((result) => result.body)
        .then(json.decode)
        .then((json) => CollectionResponse.fromJson(json))
        .then((collectionResponse) =>
            collections.addAll(collectionResponse.collection));

    return collections;
  }

  Future<List<OfferBrief>> getWomenOffers() async {
    List<OfferBrief> offers = [];
    await _client
        .get(_rootUrl + 'product?task=fetchWomenOffersProducts')
        .then((result) => result.body)
        .then(json.decode)
        .then((json) => OfferProductResponse.fromJson(json))
        .then((offerResponse) => offers.addAll(offerResponse.offerBrief));

    return offers;
  }

  Future<List<Collection>> getMenCollections() async {
    List<Collection> collections = [];
    await _client
        .get(_rootUrl + 'product?task=fetchMenCollections')
        .then((result) => result.body)
        .then(json.decode)
        .then((json) => CollectionResponse.fromJson(json))
        .then((collectionResponse) =>
            collections.addAll(collectionResponse.collection));

    return collections;
  }

  Future<List<OfferBrief>> getMenOffers() async {
    List<OfferBrief> offers = [];
    await _client
        .get(_rootUrl + 'product?task=fetchMenOffersProducts')
        .then((result) => result.body)
        .then(json.decode)
        .then((json) => OfferProductResponse.fromJson(json))
        .then((offerResponse) => offers.addAll(offerResponse.offerBrief));

    return offers;
  }

  Future<List<ProductBrief>> getMenProducts() async {
    List<ProductBrief> products = [];
    await _client
        .get(_rootUrl + 'product?task=fetchMenProducts')
        .then((result) => result.body)
        .then(json.decode)
        .then((json) => ProductResponse.fromJson(json))
        .then(
            (productResponse) => products.addAll(productResponse.productBrief));

    return products;
  }

  Future<List<ProductBrief>> getWomenProducts() async {
    List<ProductBrief> products = [];
    await _client
        .get(_rootUrl + 'product?task=fetchWomenProducts')
        .then((result) => result.body)
        .then(json.decode)
        .then((json) => ProductResponse.fromJson(json))
        .then(
            (productResponse) => products.addAll(productResponse.productBrief));

    return products;
  }

  Future<List<ProductBrief>> getProductsByCollection(
      String collectionId) async {
    List<ProductBrief> products = [];
    await _client
        .get(_rootUrl +
            'product?task=fetchProductsInCollection&collectionId=' +
            collectionId)
        .then((result) => result.body)
        .then(json.decode)
        .then((json) => ProductResponse.fromJson(json))
        .then(
            (productResponse) => products.addAll(productResponse.productBrief));

    return products;
  }

  Future<Product> getProductDetail(String productId) async {
    return await _client
        .get(_rootUrl +
            'product?task=fetchIndividualProduct&productId=' +
            productId)
        .then((result) => result.body)
        .then(json.decode)
        .then((json) => Product.fromJson(json));
  }

  Future<CartResponse> getCartResponse(String contact) async {
    return await _client
        .get(_rootUrl + 'customer?task=fetchCart&customerContact=' + contact)
        .then((result) => result.body)
        .then(json.decode)
        .then((json) => CartResponse.fromJson(json));
  }

  Future<String> addItemToCart(
      Product product, String customerContact, String productSize) async {
    return await _client
        .get(_rootUrl +
            'customer?task=addUpdateToCart&customerContact=' +
            customerContact +
            '&productId=' +
            product.productId.toString() +
            '&productName=' +
            product.productName +
            '&productSize=' +
            productSize +
            '&productColor=' +
            product.productColor +
            '&productQuantity=1')
        .then((result) => result.body);
  }

  Future<String> removeItemFromCart(
      String customerContact, String productId) async {
    return await _client
        .get(_rootUrl +
            'customer?task=deleteFromCart&customerContact=' +
            customerContact +
            '&productId=' +
            productId)
        .then((result) => result.body);
  }

  Future<String> emptyCart(String customerContact) async {
    return await _client
        .get(_rootUrl +
            'customer?task=emptyCart&customerContact=' +
            customerContact)
        .then((result) => result.body);
  }

  Future<List<ProductBrief>> searchProduct(String searchQuery) async {
    List<ProductBrief> products = [];
    await _client
        .get(_rootUrl + 'product?task=searchProduct&productName=' + searchQuery)
        .then((result) => result.body)
        .then(json.decode)
        .then((json) => ProductResponse.fromJson(json))
        .then(
            (productResponse) => products.addAll(productResponse.productBrief));

    return products;
  }

  Future<String> registerCustomer(Customer customer) async {
    return await _client
        .get(_rootUrl +
            'customer?task=newCustomer&customerName=' +
            customer.customerName +
            '&customerContact=' +
            customer.customerContact +
            '&customerAddress=' +
            customer.customerAddress +
            '&customerCity=' +
            customer.customerCity +
            '&customerPincode=' +
            customer.customerPincode +
            '&customerEmail=' +
            customer.customerEmail)
        .then((result) => result.body);
  }

  Future<String> updateCustomer(Customer customer) async {
    return await _client
        .get(_rootUrl +
            'customer?task=updateCustomer&customerName=' +
            customer.customerName +
            '&customerContact=' +
            customer.customerContact +
            '&customerAddress=' +
            customer.customerAddress +
            '&customerCity=' +
            customer.customerCity +
            '&customerPincode=' +
            customer.customerPincode +
            '&customerEmail=' +
            customer.customerEmail)
        .then((result) => result.body);
  }

  Future<Customer> fetchCustomer(String customerContact) async {
    return await _client
        .get(_rootUrl +
            'customer?task=fetchCustomer&customerContact=' +
            customerContact)
        .then((result) => result.body)
        .then(json.decode)
        .then((response) => Customer.fromJson(response));
  }

  Future<String> generateChecksum(PaytmModel model) async {
    return await _client
        .get('http://jewelrykart.in/generatechecksumforapplication?orderId=' +
            model.orderId +
            '&customerId=' +
            model.customerId +
            '&customerPhone=' +
            model.phoneNumber +
            '&customerEmail' +
            model.customerEmail +
            '&transactionAmount' +
            model.transactionAmount)
        .then((result) => result.body);
  }

  //http://jewelrykart.in/generatechecksumforapplication?orderId=30&customerId=33&customerPhone=7987036365&customerEmail=xdsahil@gmail.com&transactionAmount=330

  Future<String> placeOrder(
    String productId,
    String orderPrice,
    String paymentMode,
    String customerContact,
  ) async {
    return await _client
        .get(_rootUrl +
            'order?task=placeOrder&customerContact=' +
            customerContact +
            '&productId=' +
            productId +
            '&orderPrice=' +
            orderPrice +
            '&paymentMode=' +
            paymentMode)
        .then((result) => result.body);
  }

  Future<List<Orders>> fetchOrders(String customerContact) async {
    List<Orders> orders = [];
    await _client
        .get(_rootUrl +
            'order?task=fetchOrders&customerContact=' +
            customerContact)
        .then((result) => result.body)
        .then(json.decode)
        .then((json) => OrderResponse.fromJson(json))
        .then((orderResponse) => orders.addAll(orderResponse.orders));
    return orders;
  }

  Future<Order> fetchIndividualOrder(String orderId) async {
    return _client
        .get(_rootUrl + 'order?task=fetchIndividualOrder&orderId=' + orderId)
        .then((result) => result.body)
        .then(json.decode)
        .then((json) => Order.fromJson(json));
  }

  Future<String> cancelOrder(String customerContact, String orderId) async {
    return _client
        .get(_rootUrl +
            'order?task=cancelOrder&customerContact=' +
            customerContact +
            '&orderId=' +
            orderId)
        .then((result) => result.body);
  }
}
