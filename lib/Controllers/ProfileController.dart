import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class ProfileController extends GetxController with GetTickerProviderStateMixin {

  late AnimationController toggleController;
  late AnimationController colorController;
  late Animation<Offset> offsetAnimation;
  late Animation colorAnimation;

  late Color btnColor;
  @override
  void onInit() {
    super.onInit();
    toggleController = AnimationController (duration: Duration (milliseconds: 500), vsync: this,);
    offsetAnimation = Tween<Offset> (begin: Offset.zero,
      end: const Offset (1.5, 0.0),
    ).animate(CurvedAnimation (parent: toggleController, // Tween
        curve: Curves.linear));

    /*colorController = AnimationController(vsync: this,
      duration: Duration (milliseconds: 400),
      value: 1.0,
    );

    colorAnimation = ColorTween(
      begin: HexColor("#1CD159"),
      end: Colors.grey,
    ).animate(colorController);
*/

//HexColor("#1CD159").withOpacity(0.4),
  }


  @override
  void onClose() {
    toggleController.dispose();
    super.onClose();
  }

  void toggleButton() {
    if(toggleController.isDismissed){
      toggleController.animateTo(0.5, curve: Curves.linear);
      //colorController.forward();

    }else{
      toggleController.reverse();
      //colorController.reverse();
    }
    print(toggleController.status);
  }

}






