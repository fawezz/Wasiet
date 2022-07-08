import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wasiet/Controllers/HomeNavController.dart';
import 'dart:ui' as ui;
import 'package:wasiet/Views/HomeView.dart';
import 'package:wasiet/Views/TestScreen1.dart';

import 'TestScreen2.dart';

class HomeNavigationView extends StatelessWidget {
  const HomeNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeNavController _navx = Get.put(HomeNavController());
    Size size = MediaQuery.of(context).size;

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
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25)),
        ),
        child: Stack(
          children: [
            PageView(
              controller: _navx.pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                HomeView(),
                TestScreen1(),
                TestScreen2(),
                //mes annonces
                //chat
                //Profile
              ],
            ),
            //NAVBAR
            Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  width: size.width,
                  height: 80,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: CustomPaint(
                          size: Size(size.width, 50),
                          painter: navBarCustomPainter(),
                        ),
                      ),
                      Center(
                        heightFactor: 0.6,
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: HexColor("#00B4EF").withOpacity(0.2),
                                blurRadius: 40,
                                spreadRadius: 1
                              )
                            ]
                          ),
                          child: Center(
                            heightFactor: 0.6,
                            child: FloatingActionButton.large(
                                backgroundColor: HexColor("#00B4EF"),
                                child: Icon(Icons.add),
                                elevation: 0.1,
                                onPressed: () {}),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: SizedBox(
                          width: size.width,
                          height: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Obx(()=> IconButton(
                                      icon: _navx.navBarIndex.value == 0 ? Image.asset("assets/icons/home_active.png") :
                                      Image.asset("assets/icons/home.png"),
                                      onPressed: () =>
                                          _navx.updateNavBarIndex(0)
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
                                  Obx(()=> IconButton(
                                    //iconSize: navIconSize,
                                      icon: _navx.navBarIndex.value == 1 ? Image.asset("assets/icons/annonce_active.png") :
                                      Image.asset("assets/icons/annonce.png"),
                                      onPressed: () {
                                        _navx.updateNavBarIndex(1);
                                      }),
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
                                width: size.width * 0.20,
                              ),
                              Column(
                                children: [
                                  Obx(()=> IconButton(
                                      icon: _navx.navBarIndex.value == 2 ? Image.asset("assets/icons/chat_active.png") :
                                      Image.asset("assets/icons/chat.png"),
                                      onPressed: () {
                                        _navx.updateNavBarIndex(2);
                                      }),
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
                                  Obx(()=> IconButton(
                                    icon: _navx.navBarIndex.value == 3 ? Image.asset("assets/icons/profile_active.png") :
                                    Image.asset("assets/icons/profile.png"),
                                    onPressed: () {
                                      _navx.updateNavBarIndex(3);
                                    },
                                    splashColor: Colors.white,
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
    path.moveTo(0, 0); // Start
    //path.quadraticBezierTo(200 , 0, size.width , 60);
    path.arcToPoint(Offset(size.width, 700), radius: Radius.circular(-200), clockwise: true);
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