import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wasiet/Controllers/HomeNavController.dart';
import 'dart:ui' as ui;
import 'package:wasiet/Views/HomeView.dart';
import 'package:wasiet/Views/MyAdsView.dart';
import 'package:wasiet/Views/NewAdView.dart';
import 'package:wasiet/Views/NotificationView.dart';
import 'package:wasiet/Views/ProfileView.dart';
import 'package:wasiet/Views/TestScreen1.dart';

import 'SellerProfileView.dart';
import 'TestScreen2.dart';

class HomeNavigationView extends StatelessWidget {
  const HomeNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeNavController _navx = Get.put(HomeNavController());

    double navIconSize = 40;
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [HexColor("#6A83FF").withOpacity(0.1), Colors.white70],
              center: Alignment.centerRight,
              radius: 0.9,
            ),
            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25)),
        ),
        child: Stack(
          children: [
            PageView(
              controller: _navx.pageController,
              physics: const NeverScrollableScrollPhysics(),
              children:  [
                const HomeView(),
                const MyAdsView(),
                NewAdView(),
                ProfileView(connected: true,),
                //TestScreen2(),

                //mes annonces
                //chat
                //Profile
              ],
            ),
            //NAVBAR
            Positioned(
                bottom: 0,
                left: 0,
                child: SizedBox(
                  width: Get.width,
                  height: 100.h,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: CustomPaint(
                          size: Size(Get.width, 55.h),
                          painter: navBarCustomPainter(),
                        ),
                      ),
                      Center(
                        heightFactor: 0.9,
                        child: Container(
                          height: 100.h,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: HexColor("#00B4EF").withOpacity(0.15),
                                blurRadius: 20,
                                spreadRadius: 0
                              )
                            ]
                          ),
                          child: Center(
                            child: SizedBox(
                              height: 75.sp,
                              child: FloatingActionButton.large(
                                  backgroundColor: HexColor("#00B4EF"),
                                  child: Icon(Icons.add),
                                  elevation: 0.1,
                                  onPressed: () {}),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: SizedBox(
                          width: Get.width,
                          height: 80.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Obx(()=> SizedBox(
                                    height: 60.sp,
                                    child: IconButton(
                                        icon: Image.asset( _navx.navBarIndex.value == 0 ?
                                        "assets/icons/home_active.png" : "assets/icons/home.png",
                                        scale: 3.5,
                                        ),
                                        onPressed: () =>
                                            _navx.updateNavBarIndex(0)
                                    ),
                                  ),
                                  ),
                                  Obx(()=> Container(
                                    height: 5,
                                    width: navIconSize-14,
                                    decoration: BoxDecoration(
                                        color: _navx.navBarIndex.value == 0 ? HexColor("#00B4EF"):
                                        Colors.transparent,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                  ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Obx(()=> SizedBox(
                                    height: 60.sp,
                                    child: IconButton(
                                      //iconSize: navIconSize,
                                        icon: Image.asset(_navx.navBarIndex.value == 1 ?
                                        "assets/icons/annonce_active.png": "assets/icons/annonce.png",
                                        ),
                                        onPressed: () {
                                          _navx.updateNavBarIndex(1);
                                        }),
                                  ),
                                  ),
                                  Obx(()=> Container(
                                    height: 5,
                                    width: navIconSize-14,
                                    decoration: BoxDecoration(
                                        color: _navx.navBarIndex.value == 1 ? HexColor("#00B4EF"):
                                        Colors.transparent,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                  ),
                                  )
                                ],
                              ),
                              Container(
                                width: Get.width * 0.20,
                              ),
                              Column(
                                children: [
                                  Obx(()=> SizedBox(
                                    height: 60.sp,
                                    child: IconButton(
                                        icon: Image.asset(_navx.navBarIndex.value == 2 ?
                                        "assets/icons/chat_active.png" :"assets/icons/chat.png",
                                        scale: 3.5,
                                        ),
                                        onPressed: () {
                                          _navx.updateNavBarIndex(2);
                                        }),
                                  ),
                                  ),
                                  Obx(()=> Container(
                                    height: 5,
                                    width: navIconSize-14,
                                    decoration: BoxDecoration(
                                        color: _navx.navBarIndex.value == 2 ? HexColor("#00B4EF"):
                                        Colors.transparent,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                  ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Obx(()=> SizedBox(
                                    height: 60.sp,
                                    child: IconButton(
                                      icon: Image.asset(
                                          _navx.navBarIndex.value == 3 ?
                                          "assets/icons/profile_active.png": "assets/icons/profile.png",
                                      scale: 3.5,),
                                      onPressed: () {
                                        _navx.updateNavBarIndex(3);
                                      },
                                      splashColor: Colors.white,
                                    ),
                                  ),
                                  ),
                                  Obx(()=> Container(
                                    height: 5,
                                    width: navIconSize-14,
                                    decoration: BoxDecoration(
                                        color: _navx.navBarIndex.value == 3 ? HexColor("#00B4EF"):
                                        Colors.transparent,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                  ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    ));
  }
}

class navBarCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, -20); // Start
    //path.quadraticBezierTo(800 , 0, size.width , 60);
    path.arcToPoint(Offset(size.width, 1400), radius: Radius.circular(-200), clockwise: true);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }

}