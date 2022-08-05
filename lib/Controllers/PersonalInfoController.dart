import 'package:flutter/widgets.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:get/get.dart';
import 'package:wasiet/models/NotificationModel.dart';


class PersonalInfoController extends GetxController{

  final nameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final countryController = TextEditingController().obs;
  final regionController = TextEditingController().obs;

  final formGlobalKey = GlobalKey < FormState >().obs;


  RxBool allFilled = false.obs;

  void verifyFields(){
    allFilled.value = formGlobalKey.value.currentState!.validate();
    print("all fields are filled: ${allFilled.isTrue}");
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}



