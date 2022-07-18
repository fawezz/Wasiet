import 'package:get/get.dart';
import 'package:wasiet/models/NotificationModel.dart';


class NotificationController extends GetxController{
  List<NotificationModel> list = [];

  final fWeekDays = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};

  final fMonths = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November","December"};




  @override
  void onInit() {
    list.add(NotificationModel(date:1657894344000,title: "title",body: "All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet."));
    list.add(NotificationModel(date:1657159944000,title: "comes from a line in section 1.10.32.",body: "contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites "));
    list.add(NotificationModel(date:1647894344000,title: "Where can I get some",body: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. "));
    list.add(NotificationModel(date:1157882243000,title: "Why do we use it",body: " is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. "));
    list.add(NotificationModel(date:1107882243000,title: "Why do we use it",body: " is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. "));

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}



