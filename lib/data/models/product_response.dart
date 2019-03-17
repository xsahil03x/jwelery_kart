class ProductResponse {
  List<ProductBrief> _productBrief;

  ProductResponse({List<ProductBrief> productBrief}) {
    this._productBrief = productBrief;
  }

  List<ProductBrief> get productBrief => _productBrief;

  set productBrief(List<ProductBrief> productBrief) =>
      _productBrief = productBrief;

  ProductResponse.fromJson(Map<String, dynamic> json) {
    if (json['productBrief'] != null) {
      _productBrief = new List<ProductBrief>();
      json['productBrief'].forEach((v) {
        _productBrief.add(new ProductBrief.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._productBrief != null) {
      data['productBrief'] = this._productBrief.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductBrief {
  int _productId;
  String _productName;
  String _productDescription;
  String _productPrice;
  String _productBasePrice;
  String _productImageURL;

  ProductBrief(
      {int productId,
      String productName,
      String productDescription,
      String productPrice,
      String productBasePrice,
      String productImageURL}) {
    this._productId = productId;
    this._productName = productName;
    this._productDescription = productDescription;
    this._productPrice = productPrice;
    this._productBasePrice = productBasePrice;
    this._productImageURL = productImageURL;
  }

  int get productId => _productId;

  set productId(int productId) => _productId = productId;

  String get productName => _productName;

  set productName(String productName) => _productName = productName;

  String get productDescription => _productDescription;

  set productDescription(String productDescription) =>
      _productDescription = productDescription;

  String get productPrice => _productPrice;

  set productPrice(String productPrice) => _productPrice = productPrice;

  String get productBasePrice => _productBasePrice;

  set productBasePrice(String productBasePrice) =>
      _productBasePrice = productBasePrice;

  String get productImageURL => _productImageURL;

  set productImageURL(String productImageURL) =>
      _productImageURL = productImageURL;

  ProductBrief.fromJson(Map<String, dynamic> json) {
    _productId = json['productId'];
    _productName = json['productName'];
    _productDescription = json['productDescription'];
    _productPrice = json['productPrice'];
    _productBasePrice = json['productBasePrice'];
    _productImageURL = json['productImageURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this._productId;
    data['productName'] = this._productName;
    data['productDescription'] = this._productDescription;
    data['productPrice'] = this._productPrice;
    data['productBasePrice'] = this._productBasePrice;
    data['productImageURL'] = this._productImageURL;
    return data;
  }
}
