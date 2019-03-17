class Product {
  int productId;
  String productName;
  String productDescription;
  String productPrice;
  String productBasePrice;
  int collectionId;
  List<String> productImageURLs;
  List<String> productSize;
  String productDetails;
  String productStock;
  String productColor;
  String productCompany;

  Product(
      {this.productId,
      this.productName,
      this.productDescription,
      this.productPrice,
      this.productBasePrice,
      this.collectionId,
      this.productImageURLs,
      this.productSize,
      this.productDetails,
      this.productStock,
      this.productColor,
      this.productCompany});

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    productDescription = json['productDescription'];
    productPrice = json['productPrice'];
    productBasePrice = json['productBasePrice'];
    collectionId = json['collectionId'];
    productImageURLs = json['productImageURLs'].cast<String>();
    productSize = json['productSize'].cast<String>();
    productDetails = json['productDetails'];
    productStock = json['productStock'];
    productColor = json['productColor'];
    productCompany = json['productCompany'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['productDescription'] = this.productDescription;
    data['productPrice'] = this.productPrice;
    data['productBasePrice'] = this.productPrice;
    data['collectionId'] = this.collectionId;
    data['productImageURLs'] = this.productImageURLs;
    data['productSize'] = this.productSize;
    data['productDetails'] = this.productDetails;
    data['productStock'] = this.productStock;
    data['productColor'] = this.productColor;
    data['productCompany'] = this.productCompany;
    return data;
  }
}
