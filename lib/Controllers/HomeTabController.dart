import 'package:get/get.dart';
import 'package:flutter/material.dart';


class HomeTabController extends GetxController with GetSingleTickerProviderStateMixin {
  var selectedTabIndex = 0 .obs;

  void updateSelectedIndex() {
    selectedTabIndex.value = controller.index;
  }

  var navBarIndex = 0 .obs;
  void updateNavBarIndex(int x) {
    navBarIndex.value = x;
    //navigate to index page
  }


  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: 5);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}