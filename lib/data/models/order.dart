class Order {
  int _orderId;
  String _orderDate;
  String _orderPrice;
  List<Products> _products;
  String _orderStatus;
  String _orderDeliveryDate;

  Order(
      {int orderId,
      String orderDate,
      String orderPrice,
      List<Products> products,
      String orderStatus,
      String orderDeliveryDate}) {
    this._orderId = orderId;
    this._orderDate = orderDate;
    this._orderPrice = orderPrice;
    this._products = products;
    this._orderStatus = orderStatus;
    this._orderDeliveryDate = orderDeliveryDate;
  }

  int get orderId => _orderId;

  set orderId(int orderId) => _orderId = orderId;

  String get orderDate => _orderDate;

  set orderDate(String orderDate) => _orderDate = orderDate;

  String get orderPrice => _orderPrice;

  set orderPrice(String orderPrice) => _orderPrice = orderPrice;

  List<Products> get products => _products;

  set products(List<Products> products) => _products = products;

  String get orderStatus => _orderStatus;

  set orderStatus(String orderStatus) => _orderStatus = orderStatus;

  String get orderDeliveryDate => _orderDeliveryDate;

  set orderDeliveryDate(String orderDeliveryDate) =>
      _orderDeliveryDate = orderDeliveryDate;

  Order.fromJson(Map<String, dynamic> json) {
    _orderId = json['orderId'];
    _orderDate = json['orderDate'];
    _orderPrice = json['orderPrice'];
    if (json['products'] != null) {
      _products = new List<Products>();
      json['products'].forEach((v) {
        _products.add(new Products.fromJson(v));
      });
    }
    _orderStatus = json['orderStatus'];
    _orderDeliveryDate = json['orderDeliveryDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this._orderId;
    data['orderDate'] = this._orderDate;
    data['orderPrice'] = this._orderPrice;
    if (this._products != null) {
      data['products'] = this._products.map((v) => v.toJson()).toList();
    }
    data['orderStatus'] = this._orderStatus;
    data['orderDeliveryDate'] = this._orderDeliveryDate;
    return data;
  }
}

class Products {
  int _productId;
  String _productName;
  String _productPrice;
  String _productSize;
  String _productQuantity;

  Products(
      {int productId,
      String productName,
      String productPrice,
      String productSize,
      String productQuantity}) {
    this._productId = productId;
    this._productName = productName;
    this._productPrice = productPrice;
    this._productSize = productSize;
    this._productQuantity = productQuantity;
  }

  int get productId => _productId;

  set productId(int productId) => _productId = productId;

  String get productName => _productName;

  set productName(String productName) => _productName = productName;

  String get productPrice => _productPrice;

  set productPrice(String productPrice) => _productPrice = productPrice;

  String get productSize => _productSize;

  set productSize(String productSize) => _productSize = productSize;

  String get productQuantity => _productQuantity;

  set productQuantity(String productQuantity) =>
      _productQuantity = productQuantity;

  Products.fromJson(Map<String, dynamic> json) {
    _productId = json['productId'];
    _productName = json['productName'];
    _productPrice = json['productPrice'];
    _productSize = json['productSize'];
    _productQuantity = json['productQuantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this._productId;
    data['productName'] = this._productName;
    data['productPrice'] = this._productPrice;
    data['productSize'] = this._productSize;
    data['productQuantity'] = this._productQuantity;
    return data;
  }
}
