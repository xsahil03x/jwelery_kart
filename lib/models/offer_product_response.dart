class OfferProductResponse {
  List<OfferBrief> _offerBrief;

  OfferProductResponse({List<OfferBrief> offerBrief}) {
    this._offerBrief = offerBrief;
  }

  List<OfferBrief> get offerBrief => _offerBrief;

  set offerBrief(List<OfferBrief> offerBrief) => _offerBrief = offerBrief;

  OfferProductResponse.fromJson(Map<String, dynamic> json) {
    if (json['offerBrief'] != null) {
      _offerBrief = new List<OfferBrief>();
      json['offerBrief'].forEach((v) {
        _offerBrief.add(new OfferBrief.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._offerBrief != null) {
      data['offerBrief'] = this._offerBrief.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OfferBrief {
  int _productId;
  String _productName;
  String _productDescription;
  String _productPrice;
  String _offerPrice;
  String _productImageURL;

  OfferBrief(
      {int productId,
      String productName,
      String productDescription,
      String productPrice,
      String offerPrice,
      String productImageURL}) {
    this._productId = productId;
    this._productName = productName;
    this._productDescription = productDescription;
    this._productPrice = productPrice;
    this._offerPrice = offerPrice;
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

  String get offerPrice => _offerPrice;

  set offerPrice(String offerPrice) => _offerPrice = offerPrice;

  String get productImageURL => _productImageURL;

  set productImageURL(String productImageURL) =>
      _productImageURL = productImageURL;

  OfferBrief.fromJson(Map<String, dynamic> json) {
    _productId = json['productId'];
    _productName = json['productName'];
    _productDescription = json['productDescription'];
    _productPrice = json['productPrice'];
    _offerPrice = json['offerPrice'];
    _productImageURL = json['productImageURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this._productId;
    data['productName'] = this._productName;
    data['productDescription'] = this._productDescription;
    data['productPrice'] = this._productPrice;
    data['offerPrice'] = this._offerPrice;
    data['productImageURL'] = this._productImageURL;
    return data;
  }
}
