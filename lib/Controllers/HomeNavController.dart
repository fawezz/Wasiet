import 'package:get/get.dart';
import 'package:flutter/material.dart';


class HomeNavController extends GetxController with GetSingleTickerProviderStateMixin {

  final pageController = PageController(initialPage: 0);
  var navBarIndex = 0 .obs;
  
  
  void updateNavBarIndex(int x) {
    navBarIndex.value = x;
    pageController.animateToPage(x, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
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