import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactUsController extends GetxController{

  final nameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final subjectController = TextEditingController().obs;
  final messageController = TextEditingController().obs;


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}