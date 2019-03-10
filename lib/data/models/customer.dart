class Customer {
  static final tblCustomer = "customer";
  static final dbId = "id";
  static final dbName = "name";
  static final dbAddress = "address";
  static final dbContact = "contact";
  static final dbPincode = "pincode";
  static final dbEmail = "email";
  static final dbCity = "city";

  String _response;
  int _customerId;
  String _customerName;
  String _customerContact;
  String _customerAddress;
  String _customerCity;
  String _customerPincode;
  String _customerEmail;

  Customer(
      {String response,
      int customerId,
      String customerName,
      String customerContact,
      String customerAddress,
      String customerCity,
      String customerPincode,
      String customerEmail}) {
    this._response = response;
    this._customerId = customerId;
    this._customerName = customerName;
    this._customerContact = customerContact;
    this._customerAddress = customerAddress;
    this._customerCity = customerCity;
    this._customerPincode = customerPincode;
    this._customerEmail = customerEmail;
  }

  Customer.fresh(
      {String customerName,
      String customerContact,
      String customerAddress,
      String customerCity,
      String customerPincode,
      String customerEmail}) {
    this._customerName = customerName;
    this._customerContact = customerContact;
    this._customerAddress = customerAddress;
    this._customerCity = customerCity;
    this._customerPincode = customerPincode;
    this._customerEmail = customerEmail;
  }

  String get response => _response;

  set response(String response) => _response = response;

  int get customerId => _customerId;

  set customerId(int customerId) => _customerId = customerId;

  String get customerName => _customerName;

  set customerName(String customerName) => _customerName = customerName;

  String get customerContact => _customerContact;

  set customerContact(String customerContact) =>
      _customerContact = customerContact;

  String get customerAddress => _customerAddress;

  set customerAddress(String customerAddress) =>
      _customerAddress = customerAddress;

  String get customerCity => _customerCity;

  set customerCity(String customerCity) => _customerCity = customerCity;

  String get customerPincode => _customerPincode;

  set customerPincode(String customerPincode) =>
      _customerPincode = customerPincode;

  String get customerEmail => _customerEmail;

  set customerEmail(String customerEmail) => _customerEmail = customerEmail;

  Customer.fromJson(Map<String, dynamic> json) {
    _response = json['response'];
    _customerId = json['customerId'];
    _customerName = json['customerName'];
    _customerContact = json['customerContact'];
    _customerAddress = json['customerAddress'];
    _customerCity = json['customerCity'];
    _customerPincode = json['customerPincode'];
    _customerEmail = json['customerEmail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this._response;
    data['customerId'] = this._customerId;
    data['customerName'] = this._customerName;
    data['customerContact'] = this._customerContact;
    data['customerAddress'] = this._customerAddress;
    data['customerCity'] = this._customerCity;
    data['customerPincode'] = this._customerPincode;
    data['customerEmail'] = this._customerEmail;
    return data;
  }
}
