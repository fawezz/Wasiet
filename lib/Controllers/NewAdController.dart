import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class NewAdController extends GetxController with GetSingleTickerProviderStateMixin {

  final stepController = PageController(initialPage: 0);
  var stepIndex = 0 .obs;
  final numberOfSteps = 5;

  void nextStepIndex() {
    //print(stepIndex);
    if(stepIndex<4){
      stepIndex.value = stepIndex.value+1;
      stepController.animateToPage(stepIndex.value, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }
  void prevStepIndex() {
    if(stepIndex>0){
      stepIndex.value = stepIndex.value-1;
      stepController.animateToPage(stepIndex.value, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
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