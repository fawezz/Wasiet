import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Views/HomeView.dart';

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
      home: const HomeView(),
      getPages: [
        GetPage(name: '/home', page: () => const HomeView()),
      ],
    );
  }


}