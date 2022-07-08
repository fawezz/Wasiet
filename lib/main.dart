import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Views/HomeNavigationView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wasiet',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeNavigationView(),
      getPages: [
        GetPage(name: '/home', page: () => const HomeNavigationView()),
      ],
    );
  }


}