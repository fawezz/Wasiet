class NotificationModel {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(1657881667);
  late String title ;
  late String body ;

  NotificationModel({required int date, required this.title, required this.body})
  {
    this.date = DateTime.fromMillisecondsSinceEpoch(date);
  }


}