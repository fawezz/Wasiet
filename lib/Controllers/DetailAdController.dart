import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailAdController extends GetxController with GetSingleTickerProviderStateMixin{

  //image slider
  final pageController = PageController(initialPage: 0);
  RxInt indicator = 0.obs;

  void updateIndicator(int x) {
    indicator.value = x+1;
    pageController.animateToPage(x, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  //Tabbar
  var selectedTabIndex = 0 .obs;
  late TabController tabController;

  void updateSelectedIndex() {
    selectedTabIndex.value = tabController.index;
  }

  //appbar
  RxBool isFavorite = true.obs;





  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  List<String> images = [
    "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
    "https://wallpaperaccess.com/full/2637581.jpg",
    "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg"
  ];

}