class RatingModel {
  late int _postId;
  late String _userName;
  late int _userId;
  late String _date;
  late int _rating;
  late String _comment;
  late String _userImage;


  RatingModel.name(this._postId, this._userName, this._userId,  this._userImage, this._date,
      this._rating, this._comment,);

  RatingModel.fromJson(Map<String, dynamic> json) {
    _postId = json['id'];
    _userName = json['name'];
    //_userImage = json['userImage'];
    _userImage = 'https://picsum.photos/400/400';
    _date = json['date'];
    _rating = json['stars'];
    _comment = json['description'];
  }

  String get userImage => _userImage;

  set userImage(String value) {
    _userImage = value;
  }

  String get comment => _comment;

  set comment(String value) {
    _comment = value;
  }

  int get rating => _rating;

  set rating(int value) {
    _rating = value;
  }

  String get date => _date;

  set date(String value) {
    _date = value;
  }

  int get userId => _userId;

  set userId(int value) {
    _userId = value;
  }

  String get userName => _userName;

  set userName(String value) {
    _userName = value;
  }

  int get postId => _postId;

  set postId(int value) {
    _postId = value;
  }

  @override
  String toString() {
    return 'RatingModel{_postId: $_postId, _userName: $_userName, _userId: $_userId, _date: $_date, _rating: $_rating, _comment: $_comment, _userImage: $_userImage}';
  }
}