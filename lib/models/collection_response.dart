class CollectionResponse {
  List<Collection> _collection;

  CollectionResponse({List<Collection> collection}) {
    this._collection = collection;
  }

  List<Collection> get collection => _collection;

  set collection(List<Collection> collection) => _collection = collection;

  CollectionResponse.fromJson(Map<String, dynamic> json) {
    if (json['collection'] != null) {
      _collection = new List<Collection>();
      json['collection'].forEach((v) {
        _collection.add(new Collection.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._collection != null) {
      data['collection'] = this._collection.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Collection {
  int _collectionId;
  String _collectionName;
  String _collectionDescription;
  String _collectionImageURL;

  Collection(
      {int collectionId,
      String collectionName,
      String collectionDescription,
      String collectionImageURL}) {
    this._collectionId = collectionId;
    this._collectionName = collectionName;
    this._collectionDescription = collectionDescription;
    this._collectionImageURL = collectionImageURL;
  }

  int get collectionId => _collectionId;

  set collectionId(int collectionId) => _collectionId = collectionId;

  String get collectionName => _collectionName;

  set collectionName(String collectionName) => _collectionName = collectionName;

  String get collectionDescription => _collectionDescription;

  set collectionDescription(String collectionDescription) =>
      _collectionDescription = collectionDescription;

  String get collectionImageURL => _collectionImageURL;

  set collectionImageURL(String collectionImageURL) =>
      _collectionImageURL = collectionImageURL;

  Collection.fromJson(Map<String, dynamic> json) {
    _collectionId = json['collectionId'];
    _collectionName = json['collectionName'];
    _collectionDescription = json['collectionDescription'];
    _collectionImageURL = json['collectionImageURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['collectionId'] = this._collectionId;
    data['collectionName'] = this._collectionName;
    data['collectionDescription'] = this._collectionDescription;
    data['collectionImageURL'] = this._collectionImageURL;
    return data;
  }
}
