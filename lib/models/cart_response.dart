class CartResponse {
  List<Cart> cart;

  CartResponse({this.cart});

  CartResponse.fromJson(Map<String, dynamic> json) {
    if (json['cart'] != null) {
      cart = new List<Cart>();
      json['cart'].forEach((v) {
        cart.add(new Cart.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cart != null) {
      data['cart'] = this.cart.map((v) => v.toJson()).toList();
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

  Cart(
      {this.productId,
      this.productName,
      this.productSize,
      this.productColor,
      this.productQuantity});

  Cart.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    productSize = json['productSize'];
    productColor = json['productColor'];
    productQuantity = json['productQuantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['productSize'] = this.productSize;
    data['productColor'] = this.productColor;
    data['productQuantity'] = this.productQuantity;
    return data;
  }
}
