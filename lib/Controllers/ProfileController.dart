import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class ProfileController extends GetxController with GetTickerProviderStateMixin {

  late bool connected ;

  late AnimationController toggleController;
  late AnimationController colorController;
  late Animation<Offset> offsetAnimation;
  late Animation colorAnimation;

  Rx<HexColor> switchColor = HexColor("#1CD159").obs;

  late Color btnColor;
  @override
  void onInit() {

    //test if notifications are allowed and set color accordingly
    switchColor.value = HexColor("#9E9E9E");

    super.onInit();
    toggleController = AnimationController (duration: const Duration (milliseconds: 500), vsync: this,);
    offsetAnimation = Tween<Offset> (begin: Offset.zero,
      end: const Offset (1.5, 0.0),
    ).animate(CurvedAnimation (parent: toggleController, // Tween
        curve: Curves.linear));
  }

  @override
  void onClose() {
    toggleController.dispose();
    super.onClose();
  }

  void toggleButton() {
    if(toggleController.isDismissed){
      toggleController.animateTo(0.5, curve: Curves.linear);
      switchColor.value = HexColor("#1CD159");
    }else{
      toggleController.reverse();
      switchColor.value = HexColor("#9E9E9E");
    }
    //save notification state
  }

}






