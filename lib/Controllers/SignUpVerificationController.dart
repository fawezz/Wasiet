import 'package:flutter/widgets.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:get/get.dart';
import 'package:wasiet/models/NotificationModel.dart';


class SignUpVerificationController extends GetxController{

  final codeController = TextEditingController().obs;
  late CountdownTimerController timerController;
  late int endTime ;

  final firstController = TextEditingController().obs;
  final secondController = TextEditingController().obs;
  final thirdController = TextEditingController().obs;
  final forthController = TextEditingController().obs;
  final otpFormGlobalKey = GlobalKey < FormState >().obs;

  RxBool allFilled = false.obs;

  void verifyAllFilled(){
    allFilled.value = otpFormGlobalKey.value.currentState!.validate();
    print("all otp fields are filled: ${allFilled.isTrue}");
  }

  @override
  void onInit() {
    endTime = DateTime.now().millisecondsSinceEpoch + (1000 * 60);
    timerController = CountdownTimerController(endTime: endTime,);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    timerController.dispose();
  }
}



