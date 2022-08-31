import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../models/PostModel.dart';


class HomeNavController extends GetxController with GetSingleTickerProviderStateMixin {

  final pageController = PageController(initialPage: 0);
  var navBarIndex = 0 .obs;
  static List<PostModel> postList = [];
  
  void updateNavBarIndex(int x) {
    navBarIndex.value = x;
    pageController.animateToPage(x, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
  }
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/json/posts.json');
    List<dynamic> data = await json.decode(response);
    postList = data.map((e) => PostModel.fromJson(e)).toList();
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    readJson();
  }

  @override
  void onClose() {
    super.onClose();
  }
}