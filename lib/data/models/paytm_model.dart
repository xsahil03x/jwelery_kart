class PaytmModel {
//  String merchantMid = "MLZTpP95065805278660";
//  // Key in your staging and production MID available in your dashboard
//  String merchantKey = "#oFxvzqFp&m4fV1_";
//  // Key in your staging and production MID available in your dashboard
//  String orderId = request.getParameter("orderId");
//  String channelId = "WAP";
//  String customerId = request.getParameter("customerId");
//  String phoneNumber = request.getParameter("phoneNumber");
//  String email = request.getParameter("customerEmail");
//  String txnAmount = request.getParameter("transactionAmount");
//  String website = "WEBSTAGING";
//  // This is the staging value. Production value is available in your dashboard
//  String industryTypeId = "Retail";
//  // This is the staging value. Production value is available in your dashboard
//  String callbackUrl = "https://securegw-stage.paytm.in/theia/paytmCallback?ORDER_ID=order1";

  String _orderId;
  String _customerId;
  String _phoneNumber;
  String _customerEmail;
  String _transactionAmount;

  PaytmModel(
      {String orderId,
      String customerId,
      String phoneNumber,
      String customerEmail,
      String transactionAmount}) {
    this._orderId = orderId;
    this._customerId = customerId;
    this._phoneNumber = phoneNumber;
    this._customerEmail = customerEmail;
    this._transactionAmount = transactionAmount;
  }

  String get orderId => _orderId;

  set orderId(String orderId) => _orderId = orderId;

  String get customerId => _customerId;

  set customerId(String customerId) => _customerId = customerId;

  String get transactionAmount => _transactionAmount;

  set transactionAmount(String value) => _transactionAmount = value;

  String get customerEmail => _customerEmail;

  set customerEmail(String value) => _customerEmail = value;

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) => _phoneNumber = value;

  PaytmModel.fromJson(Map<String, dynamic> json) {
    _orderId = json['orderId'];
    _customerId = json['customerId'];
    _phoneNumber = json['phoneNumber'];
    _customerEmail = json['customerEmail'];
    _transactionAmount = json['transactionAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this._orderId;
    data['customerId'] = this._customerId;
    data['phoneNumber'] = this._phoneNumber;
    data['customerEmail'] = this._customerEmail;
    data['transactionAmount'] = this._transactionAmount;
    return data;
  }
}
