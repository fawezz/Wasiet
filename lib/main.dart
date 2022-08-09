import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wasiet/Views/detail_ad_views/DetailAdView.dart';
import 'package:wasiet/Views/MyAdsView.dart';
import 'package:wasiet/Views/MyComplaintsView.dart';
import 'package:wasiet/Views/NotificationView.dart';
import 'package:wasiet/Views/ProfileView.dart';
import 'package:wasiet/Views/ReportPersonView.dart';
import 'package:wasiet/Views/SellerProfileView.dart';
import 'package:wasiet/Views/login_views/PersonalInfoView.dart';
import 'package:wasiet/Views/login_views/SignUpView.dart';
import 'package:wasiet/Views/settings_views/AboutView.dart';
import 'package:wasiet/Views/settings_views/ContactUsView.dart';
import 'package:wasiet/Views/settings_views/SettingsView.dart';
import 'package:wasiet/Views/settings_views/TermsView.dart';

import 'Views/HomeNavigationView.dart';
import 'Views/ComplaintDetailsView.dart';
import 'Views/login_views/SignUpVerificationView.dart';
import 'Views/new_ad_views/NewAdNavigationView.dart';

Future<void> main() async {
  await GetStorage.init();
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
          fontFamily: "Cairo",
          scaffoldBackgroundColor: Colors.white,
          canvasColor: Colors.transparent
          ),
          builder: EasyLoading.init(),
          home: const HomeNavigationView(),
          getPages: [
            GetPage(name: '/home', page: () => const HomeNavigationView()),
            GetPage(name: '/myAds', page: () => const MyAdsView()),
            GetPage(name: '/sellerProfile', page: () => const SellerProfileView()),
            GetPage(name: '/notification', page: () => const NotificationView()),
            GetPage(name: '/profile', page: () => ProfileView()),
            GetPage(name: '/reportPerson', page: () => const ReportPersonView()),
            GetPage(name: '/myComplaints', page: () => const MyComplaintsView()),
            GetPage(name: '/complaintDetails', page: () => const ComplaintDetailsView()),
            GetPage(name: '/newAd', page: () => NewAdNavigationView()),
            GetPage(name: '/settings', page: () => const SettingsView()),
            GetPage(name: '/terms', page: () => const TermsView()),
            GetPage(name: '/about', page: () => const AboutView()),
            GetPage(name: '/contactUs', page: () => const ContactUsView()),
            GetPage(name: '/detailAd', page: () => const DetailAdView()),
            GetPage(name: '/signUp', page: () => const LoginView()),
            GetPage(name: '/signUpVerification', page: () => const SignUpVerificationView()),
            GetPage(name: '/personalInfo', page: () => const PersonalInfoView()),


          ],
        );
      },
    );
  }


}