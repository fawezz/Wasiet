import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasiet/Controllers/MyAdsController.dart';
import 'package:wasiet/Views/MyAdsView.dart';
import 'package:wasiet/Views/MyComplaintsView.dart';
import 'package:wasiet/Views/NotificationView.dart';
import 'package:wasiet/Views/ProfileView.dart';
import 'package:wasiet/Views/ReportPersonView.dart';
import 'package:wasiet/Views/SellerProfileView.dart';

import 'Views/HomeNavigationView.dart';
import 'Views/ComplaintDetailsView.dart';
import 'Views/NewAdView.dart';

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
          theme: ThemeData(primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          canvasColor: Colors.transparent
          ),
          home: NewAdView(),
          getPages: [
            GetPage(name: '/home', page: () => const HomeNavigationView()),
            GetPage(name: '/myAds', page: () => const MyAdsView()),
            GetPage(name: '/sellerProfile', page: () => const SellerProfileView()),
            GetPage(name: '/notification', page: () => const NotificationView()),
            GetPage(name: '/profile', page: () => ProfileView()),
            GetPage(name: '/reportPerson', page: () => const ReportPersonView()),
            GetPage(name: '/myComplaints', page: () => const MyComplaintsView()),
            GetPage(name: '/complaintDetails', page: () => const ComplaintDetailsView()),
            GetPage(name: '/newAd', page: () => NewAdView()),

          ],
        );
      },
    );
  }


}