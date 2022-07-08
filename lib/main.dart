import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasiet/Controllers/MyAdsController.dart';
import 'package:wasiet/Views/MyAdsView.dart';

import 'Views/HomeNavigationView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 814),
      minTextAdapt: true,
      builder: (context , child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Wasiet',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: const HomeNavigationView(),
          getPages: [
            GetPage(name: '/home', page: () => const HomeNavigationView()),
            GetPage(name: '/myAds', page: () => const MyAdsView()),
          ],
        );
      },
    );
  }


}