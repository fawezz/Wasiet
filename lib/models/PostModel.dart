class PostModel {
  late int _Id;
  late int _userId;
  late String _userName;
  late int _Number;
  late String _date;
  late int _rating;
  late int _ratingNumber;
  late String _title;
  late String _country;
  late String _region;
  late String _city;
  late String _street;
  late String _category;
  late String _type;
  late String _unitOfMeasurment;
  late double _surface;
  late double _metrePrice;
  late double _totalPrice;
  late String _currency;
  late double _westStreetWidth = 0;
  late double _eastStreetWidth = 0;
  late double _northStreetWidth = 0;
  late double _southStreetWidth = 0;
  late String _details;
  late String _email;
  late String _posterIdentity;
  late int _apartments;
  late int _floors;
  late int _mahallat;
  late int _elevators;
  late double _age;
  late List<String> _images = [];


  PostModel();

  PostModel.name(
      this._Id,
      this._userId,
      this._userName,
      this._Number,
      this._date,
      this._rating,
      this._ratingNumber,
      this._title,
      this._country,
      this._region,
      this._city,
      this._street,
      this._category,
      this._type,
      this._unitOfMeasurment,
      this._surface,
      this._metrePrice,
      this._totalPrice,
      this._currency,
      this._westStreetWidth,
      this._eastStreetWidth,
      this._northStreetWidth,
      this._southStreetWidth,
      this._details,
      this._email,
      this._posterIdentity,
      this._apartments,
      this._floors,
      this._mahallat,
      this._elevators,
      this._age,
      this._images);

  List<String> get images => _images;

  set images(List<String> value) {
    _images = value;
  }

  double get age => _age;

  set age(double value) {
    _age = value;
  }

  int get elevators => _elevators;

  set elevators(int value) {
    _elevators = value;
  }

  int get mahallat => _mahallat;

  set mahallat(int value) {
    _mahallat = value;
  }

  int get floors => _floors;

  set floors(int value) {
    _floors = value;
  }

  int get apartments => _apartments;

  set apartments(int value) {
    _apartments = value;
  }

  String get posterIdentity => _posterIdentity;

  set posterIdentity(String value) {
    _posterIdentity = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get details => _details;

  set details(String value) {
    _details = value;
  }

  double get southStreetWidth => _southStreetWidth;

  set southStreetWidth(double value) {
    _southStreetWidth = value;
  }

  double get northStreetWidth => _northStreetWidth;

  set northStreetWidth(double value) {
    _northStreetWidth = value;
  }

  double get eastStreetWidth => _eastStreetWidth;

  set eastStreetWidth(double value) {
    _eastStreetWidth = value;
  }

  double get westStreetWidth => _westStreetWidth;

  set westStreetWidth(double value) {
    _westStreetWidth = value;
  }

  String get currency => _currency;

  set currency(String value) {
    _currency = value;
  }

  double get totalPrice => _totalPrice;

  set totalPrice(double value) {
    _totalPrice = value;
  }

  double get metrePrice => _metrePrice;

  set metrePrice(double value) {
    _metrePrice = value;
  }

  double get surface => _surface;

  set surface(double value) {
    _surface = value;
  }

  String get unitOfMeasurment => _unitOfMeasurment;

  set unitOfMeasurment(String value) {
    _unitOfMeasurment = value;
  }

  String get type => _type;

  set type(String value) {
    _type = value;
  }

  String get category => _category;

  set category(String value) {
    _category = value;
  }

  String get street => _street;

  set street(String value) {
    _street = value;
  }

  String get city => _city;

  set city(String value) {
    _city = value;
  }

  String get region => _region;

  set region(String value) {
    _region = value;
  }

  String get country => _country;

  set country(String value) {
    _country = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  int get ratingNumber => _ratingNumber;

  set ratingNumber(int value) {
    _ratingNumber = value;
  }

  int get rating => _rating;

  set rating(int value) {
    _rating = value;
  }

  String get date => _date;

  set date(String value) {
    _date = value;
  }

  int get Number => _Number;

  set Number(int value) {
    _Number = value;
  }

  String get userName => _userName;

  set userName(String value) {
    _userName = value;
  }

  int get userId => _userId;

  set userId(int value) {
    _userId = value;
  }

  int get Id => _Id;

  set Id(int value) {
    _Id = value;
  }

  @override
  String toString() {
    return 'PostModel{_Id: $_Id, _userId: $_userId, _userName: $_userName, _Number: $_Number, _date: $_date, _rating: $_rating, _ratingNumber: $_ratingNumber, _title: $_title, _country: $_country, _region: $_region, _city: $_city, _street: $_street, _category: $_category, _type: $_type, _unitOfMeasurment: $_unitOfMeasurment, _surface: $_surface, _metrePrice: $_metrePrice, _totalPrice: $_totalPrice, _currency: $_currency, _westStreetWidth: $_westStreetWidth, _eastStreetWidth: $_eastStreetWidth, _northStreetWidth: $_northStreetWidth, _southStreetWidth: $_southStreetWidth, _details: $_details, _email: $_email, _posterIdentity: $_posterIdentity, _apartments: $_apartments, _floors: $_floors, _mahallat: $_mahallat, _elevators: $_elevators, _age: $_age, _images: $_images}';
  }
}