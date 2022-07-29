import 'package:get/get.dart';
import 'package:flutter/material.dart';


class HomeTabController extends GetxController with GetSingleTickerProviderStateMixin {
  var selectedTabIndex = 0 .obs;
  late TabController tabController;


  void updateSelectedIndex() {
    selectedTabIndex.value = tabController.index;
  }

  var navBarIndex = 0 .obs;
  void updateNavBarIndex(int x) {
    navBarIndex.value = x;
    //navigate to index page
  }


  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: 5);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}