import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:ui' as ui;
import 'package:wasiet/Views/testScreen1.dart';
import 'package:wasiet/Views/testScreen2.dart';

import '../Controllers/HomeTabController.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeTabController _tabx = Get.put(HomeTabController());
    Size size = MediaQuery.of(context).size;

    double navIconSize = 40;
    return SafeArea(
        child: Scaffold(
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
                        child: FloatingActionButton.large(
                            backgroundColor: HexColor("#00B4EF"),
                            child: Icon(Icons.add),
                            elevation: 0.1,
                            onPressed: () {}),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: size.width,
                          height: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Obx(()=> IconButton(
                                      icon: _tabx.navBarIndex.value == 0 ? Image.asset("assets/icons/home_active.png") :
                                      Image.asset("assets/icons/home.png"),
                                      onPressed: () {
                                        _tabx.updateNavBarIndex(0);
                                      }),
                                  ),
                                  Obx(()=> Container(
                                      height: 5,
                                      width: navIconSize-14,
                                      decoration: BoxDecoration(
                                        color: _tabx.navBarIndex.value == 0 ? HexColor("#00B4EF"):
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
                                      icon: _tabx.navBarIndex.value == 1 ? Image.asset("assets/icons/annonce_active.png") :
                                      Image.asset("assets/icons/annonce.png"),
                                      onPressed: () {
                                        _tabx.updateNavBarIndex(1);
                                      }),
                                  ),
                                  Obx(()=> Container(
                                    height: 5,
                                    width: navIconSize-14,
                                    decoration: BoxDecoration(
                                        color: _tabx.navBarIndex.value == 1 ? HexColor("#00B4EF"):
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
                                      icon: _tabx.navBarIndex.value == 2 ? Image.asset("assets/icons/chat_active.png") :
                                      Image.asset("assets/icons/chat.png"),
                                      onPressed: () {
                                        _tabx.updateNavBarIndex(2);
                                      }),
                                  ),
                                  Obx(()=> Container(
                                    height: 5,
                                    width: navIconSize-14,
                                    decoration: BoxDecoration(
                                        color: _tabx.navBarIndex.value == 2 ? HexColor("#00B4EF"):
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
                                    icon: _tabx.navBarIndex.value == 3 ? Image.asset("assets/icons/profile_active.png") :
                                    Image.asset("assets/icons/profile.png"),
                                    onPressed: () {
                                      _tabx.updateNavBarIndex(3);
                                    },
                                    splashColor: Colors.white,
                                    ),
                                  ),
                                  Obx(()=> Container(
                                    height: 5,
                                    width: navIconSize-14,
                                    decoration: BoxDecoration(
                                        color: _tabx.navBarIndex.value == 3 ? HexColor("#00B4EF"):
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
              Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/logo_bar.png',
                        width: 100.0,
                        height: 100.0,
                      ),
                      const Spacer(),
                      IconButton(
                        icon: Image.asset(
                          'assets/icons/bell.png',
                          fit: BoxFit.fill,
                        ),
                        iconSize: 10,
                        onPressed: null,
                      ),
                      const SizedBox(width: 15),
                      IconButton(
                        icon: Image.asset(
                          'assets/icons/settings.png',
                          fit: BoxFit.contain,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: SizedBox(
                          width: size.width * 0.60,
                          height: 45,
                          child: TextField(
                            style: const TextStyle(
                                fontSize: 16.0, color: Colors.blueAccent),
                            decoration: InputDecoration(
                              labelText: "search for something",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Image.asset('assets/icons/search.png'),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/icons/filtre.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TabBar(
                    labelStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    labelPadding: const EdgeInsets.only(right: 5, left: 5),
                    labelColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.label,
                    unselectedLabelColor: HexColor("#0A3C5F"),
                    isScrollable: true,
                    indicator: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [HexColor("#0066B8"), HexColor("00B4EF")]),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    onTap: (int x) {
                      _tabx.updateSelectedIndex();
                    },
                    controller: _tabx.controller,
                    tabs: [
                      Obx(
                        () => Container(
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(45),
                                color: _tabx.selectedTabIndex.value != 0
                                    ? Colors.white
                                    : Colors.transparent),
                            child: Tab(text: "All",)
                        ),
                      ),
                      Obx(
                        () => Container(
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(45),
                                color: _tabx.selectedTabIndex.value != 1
                                    ? Colors.white
                                    : Colors.transparent),
                            child: Tab(text: "Sell")
                        ),
                      ),
                      Obx(
                        () => Container(
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(45),
                                color: _tabx.selectedTabIndex.value != 2
                                    ? Colors.white
                                    : Colors.transparent),
                            child: Tab(text: "Rent")
                        ),
                      ),
                      Obx(
                        () => Container(
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(45),
                                color: _tabx.selectedTabIndex.value != 3
                                    ? Colors.white
                                    : Colors.transparent),
                            child: Tab(text: "Exchange")
                        ),
                      ),
                      Obx(
                        () => Container(
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(45),
                                color: _tabx.selectedTabIndex.value != 4
                                    ? Colors.white
                                    : Colors.transparent),
                            child: Tab(text: "Auction")
                        ),
                      ),
                    ]),

                /*
                TabBarView(
                  controller: _tabx.controller,
                  children: const [
                    testScreen1(),
                    testScreen2(),
                    testScreen1(),l
                    testScreen2(),
                    testScreen1(),
                  ],
                )*/
              ],
            )],
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