import 'dart:math';

import 'RatingModel.dart';

class PostModel {
  late int _id;
  late int _userId;
  late String _userName;
  late String _sellerPicture;
  late int _number;
  late String _date;
  late int _rating;
  int _ratingNumber = 12;
  late String _title;
  late String _country;
  String? _region;
  String? _city;
  String? _street;
  late String _category;
  late String _type;
  String? _unitOfMeasurment;
  late double _surface;
  double? _metrePrice;
  double? _totalPrice;
  String? _currency;
  late double _westStreetWidth = 0;
  late double _eastStreetWidth = 0;
  late double _northStreetWidth = 0;
  late double _southStreetWidth = 0;
  late String _details;
  late String _email;
  String? _posterIdentity;
  int _apartments = 0;
  int _floors = 0;
  int _mahallat = 0;
  int _elevators = 0;
  int _rooms = 0;
  int _bathrooms = 0;
  int _livingrooms = 0;
  double? _avgRating;
  String? _address;
  late String _description;
  String? _phone;
  late double _age;
  List<String> _pictures = [];
  List<RatingModel> _ratings = <RatingModel>[];


  PostModel();


  int get id => _id;

  set id(int value) {
    _id = value;
  }

  PostModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _totalPrice = json['price'] + 0.0;
    _pictures = json['pictures'].cast<String>();
    _category = json['category'];
    _number = json['number'];
    _date = json['date'];
    _userName = json['seller'];
    _sellerPicture = json['sellerPicture'];
    _type = json['type'];
    _surface = json['area'] + 0.0;
    _metrePrice = json['metrePrice'] + 0.0;
    _rooms = json['rooms'];
    _bathrooms = json['bathrooms'];
    _livingrooms = json['livingrooms'];
    _age = json['age'] + 0.0;
    _avgRating = json['avgRating'] + 0.0;
    _country = json['country'];
    _city = json['city'];
    _address = json['address'];
    _description = json['description'];
    _email = json['email'];
    _phone = json['phone'];
    if (json['ratings'] != null) {
      json['ratings'].forEach((v) {
        _ratings.add(RatingModel.fromJson(v));
      });
    }
    var rand = Random();
    _ratingNumber = rand.nextInt(88) + 2;
  }

  @override
  String toString() {
    return 'PostModel{_id: $_id, _userId: $_userId, _userName: $_userName, _number: $_number, _date: $_date, _rating: $_rating, _ratingNumber: $_ratingNumber, _title: $_title, _country: $_country, _region: $_region, _city: $_city, _street: $_street, _category: $_category, _type: $_type, _unitOfMeasurment: $_unitOfMeasurment, _surface: $_surface, _metrePrice: $_metrePrice, _totalPrice: $_totalPrice, _currency: $_currency, _westStreetWidth: $_westStreetWidth, _eastStreetWidth: $_eastStreetWidth, _northStreetWidth: $_northStreetWidth, _southStreetWidth: $_southStreetWidth, _details: $_details, _email: $_email, _posterIdentity: $_posterIdentity, _apartments: $_apartments, _floors: $_floors, _mahallat: $_mahallat, _elevators: $_elevators, _rooms: $_rooms, _bathrooms: $_bathrooms, _livingrooms: $_livingrooms, _avgRating: $_avgRating, _address: $_address, _description: $_description, _phone: $_phone, _age: $_age, _pictures: $_pictures, _ratings: $_ratings}';
  }

  String get sellerPicture => _sellerPicture;

  set sellerPicture(String value) {
    _sellerPicture = value;
  }

  int get userId => _userId;

  set userId(int value) {
    _userId = value;
  }

  String get userName => _userName;

  set userName(String value) {
    _userName = value;
  }

  int get number => _number;

  set number(int value) {
    _number = value;
  }

  String get date => _date;

  set date(String value) {
    _date = value;
  }

  int get rating => _rating;

  set rating(int value) {
    _rating = value;
  }

  int get ratingNumber => _ratingNumber;

  set ratingNumber(int value) {
    _ratingNumber = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get country => _country;

  set country(String value) {
    _country = value;
  }

  String? get region => _region;

  set region(String? value) {
    _region = value;
  }

  String? get city => _city;

  set city(String? value) {
    _city = value;
  }

  String? get street => _street;

  set street(String? value) {
    _street = value;
  }

  String get category => _category;

  set category(String value) {
    _category = value;
  }

  String get type => _type;

  set type(String value) {
    _type = value;
  }

  String? get unitOfMeasurment => _unitOfMeasurment;

  set unitOfMeasurment(String? value) {
    _unitOfMeasurment = value;
  }

  double get surface => _surface;

  set surface(double value) {
    _surface = value;
  }

  double? get metrePrice => _metrePrice;

  set metrePrice(double? value) {
    _metrePrice = value;
  }

  double? get totalPrice => _totalPrice;

  set totalPrice(double? value) {
    _totalPrice = value;
  }

  String? get currency => _currency;

  set currency(String? value) {
    _currency = value;
  }

  double get westStreetWidth => _westStreetWidth;

  set westStreetWidth(double value) {
    _westStreetWidth = value;
  }

  double get eastStreetWidth => _eastStreetWidth;

  set eastStreetWidth(double value) {
    _eastStreetWidth = value;
  }

  double get northStreetWidth => _northStreetWidth;

  set northStreetWidth(double value) {
    _northStreetWidth = value;
  }

  double get southStreetWidth => _southStreetWidth;

  set southStreetWidth(double value) {
    _southStreetWidth = value;
  }

  String get details => _details;

  set details(String value) {
    _details = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String? get posterIdentity => _posterIdentity;

  set posterIdentity(String? value) {
    _posterIdentity = value;
  }

  int get apartments => _apartments;

  set apartments(int value) {
    _apartments = value;
  }

  int get floors => _floors;

  set floors(int value) {
    _floors = value;
  }

  int get mahallat => _mahallat;

  set mahallat(int value) {
    _mahallat = value;
  }

  int get elevators => _elevators;

  set elevators(int value) {
    _elevators = value;
  }

  int get rooms => _rooms;

  set rooms(int value) {
    _rooms = value;
  }

  int get bathrooms => _bathrooms;

  set bathrooms(int value) {
    _bathrooms = value;
  }

  int get livingrooms => _livingrooms;

  set livingrooms(int value) {
    _livingrooms = value;
  }

  double? get avgRating => _avgRating;

  set avgRating(double? value) {
    _avgRating = value;
  }

  String? get address => _address;

  set address(String? value) {
    _address = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String? get phone => _phone;

  set phone(String? value) {
    _phone = value;
  }

  double get age => _age;

  set age(double value) {
    _age = value;
  }

  List<String> get pictures => _pictures;

  set pictures(List<String> value) {
    _pictures = value;
  }

  List<RatingModel> get ratings => _ratings;

  set ratings(List<RatingModel> value) {
    _ratings = value;
  }

/*Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['price'] = this._totalPrice;
    data['pictures'] = this._pictures;
    data['category'] = this._category;
    data['number'] = this._number;
    data['date'] = this._date;
    data['seller'] = this._seller;
    data['sellerPicture'] = this._sellerPicture;
    data['type'] = this._type;
    data['area'] = this._area;
    data['metrePrice'] = this._metrePrice;
    data['rooms'] = this._rooms;
    data['bathrooms'] = this._bathrooms;
    data['livingrooms'] = this._livingrooms;
    data['age'] = this._age;
    data['avgRating'] = this._avgRating;
    data['country'] = this._country;
    data['city'] = this._city;
    data['address'] = this._address;
    data['description'] = this._description;
    data['email'] = this._email;
    data['phone'] = this._phone;
    if (this._ratings != null) {
      data['ratings'] = this._ratings.map((v) => v.toJson()).toList();
    }
    return data;
  }*/

}