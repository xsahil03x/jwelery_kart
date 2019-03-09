class CartResponse {
  int _totalPrice;
  List<Cart> _cart;

  CartResponse({int totalPrice, List<Cart> cart}) {
    this._totalPrice = totalPrice;
    this._cart = cart;
  }

  int get totalPrice => _totalPrice;

  set totalPrice(int totalPrice) => _totalPrice = totalPrice;

  List<Cart> get cart => _cart;

  set cart(List<Cart> cart) => _cart = cart;

  CartResponse.fromJson(Map<String, dynamic> json) {
    _totalPrice = json['totalPrice'];
    if (json['cart'] != null) {
      _cart = new List<Cart>();
      json['cart'].forEach((v) {
        _cart.add(new Cart.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalPrice'] = this._totalPrice;
    if (this._cart != null) {
      data['cart'] = this._cart.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cart {
  int productId;
  String productName;
  String productSize;
  String productColor;
  int productQuantity;
  int productPrice;
  String productImageURL;

  Cart(
      {this.productId,
      this.productName,
      this.productSize,
      this.productColor,
      this.productQuantity,
      this.productPrice,
      this.productImageURL});

  Cart.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    productSize = json['productSize'];
    productColor = json['productColor'];
    productQuantity = json['productQuantity'];
    productPrice = json['productPrice'];
    productImageURL = json['productImageURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['productSize'] = this.productSize;
    data['productColor'] = this.productColor;
    data['productQuantity'] = this.productQuantity;
    data['productPrice'] = this.productPrice;
    data['productImageURL'] = this.productImageURL;
    return data;
  }
}
