class Customer {
  static final tblCustomer = "customer";
  static final dbId = "id";
  static final dbName = "name";
  static final dbAddress = "address";
  static final dbContact = "contact";
  static final dbPincode = "pincode";
  static final dbEmail = "email";
  static final dbCity = "city";

  String _customerAddress;
  String _customerContact;
  String _response;
  String _customerPincode;
  String _customerEmail;
  int _customerId;
  String _customerCity;
  String _customerName;

  Customer(
      {String customerAddress,
      String customerContact,
      String response,
      String customerPincode,
      String customerEmail,
      int customerId,
      String customerCity,
      String customerName}) {
    this._customerAddress = customerAddress;
    this._customerContact = customerContact;
    this._response = response;
    this._customerPincode = customerPincode;
    this._customerEmail = customerEmail;
    this._customerId = customerId;
    this._customerCity = customerCity;
    this._customerName = customerName;
  }

  String get customerAddress => _customerAddress;

  set customerAddress(String customerAddress) =>
      _customerAddress = customerAddress;

  String get customerContact => _customerContact;

  set customerContact(String customerContact) =>
      _customerContact = customerContact;

  String get response => _response;

  set response(String response) => _response = response;

  String get customerPincode => _customerPincode;

  set customerPincode(String customerPincode) =>
      _customerPincode = customerPincode;

  String get customerEmail => _customerEmail;

  set customerEmail(String customerEmail) => _customerEmail = customerEmail;

  int get customerId => _customerId;

  set customerId(int customerId) => _customerId = customerId;

  String get customerCity => _customerCity;

  set customerCity(String customerCity) => _customerCity = customerCity;

  String get customerName => _customerName;

  set customerName(String customerName) => _customerName = customerName;

  Customer.fromJson(Map<String, dynamic> json) {
    _customerAddress = json['customerAddress'];
    _customerContact = json['customerContact'];
    _response = json['response'];
    _customerPincode = json['customerPincode'];
    _customerEmail = json['customerEmail'];
    _customerId = json['customerId'];
    _customerCity = json['customerCity'];
    _customerName = json['customerName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerAddress'] = this._customerAddress;
    data['customerContact'] = this._customerContact;
    data['response'] = this._response;
    data['customerPincode'] = this._customerPincode;
    data['customerEmail'] = this._customerEmail;
    data['customerId'] = this._customerId;
    data['customerCity'] = this._customerCity;
    data['customerName'] = this._customerName;
    return data;
  }
}
