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
    return SafeArea(
        child: Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [HexColor("#6A83FF").withOpacity(0.1), HexColor("#FFFFFF")],
          )),
          child: Column(
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
                        width: MediaQuery.of(context).size.width * 0.60,
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
                          child: Tab(
                            text: "All",
                          )),
                    ),
                    Obx(
                      () => Container(
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45),
                              color: _tabx.selectedTabIndex.value != 1
                                  ? Colors.white
                                  : Colors.transparent),
                          child: Tab(text: "Sell")),
                    ),
                    Obx(
                      () => Container(
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45),
                              color: _tabx.selectedTabIndex.value != 2
                                  ? Colors.white
                                  : Colors.transparent),
                          child: Tab(text: "Rent")),
                    ),
                    Obx(
                      () => Container(
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45),
                              color: _tabx.selectedTabIndex.value != 3
                                  ? Colors.white
                                  : Colors.transparent),
                          child: Tab(text: "Exchange")),
                    ),
                    Obx(
                      () => Container(
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45),
                              color: _tabx.selectedTabIndex.value != 4
                                  ? Colors.white
                                  : Colors.transparent),
                          child: Tab(text: "Auction")),
                    ),
                  ]),

              /*
            TabBarView(
              controller: _tabx.controller,
              children: const [
                testScreen1(),
                testScreen2(),
                testScreen1(),
                testScreen2(),
                testScreen1(),
              ],
            )*/
            ],
          )),
    ));
  }
}


class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.3337690,size.height*-0.05120620);
    path_0.cubicTo(size.width*0.4935470,size.height*-0.05120620,size.width*0.4524876,size.height*0.1604324,size.width*0.4524876,size.height*0.2076199);
    path_0.cubicTo(size.width*0.4524876,size.height*0.2548074,size.width*0.3085084,size.height*0.3696691,size.width*0.1487304,size.height*0.3696691);
    path_0.cubicTo(size.width*-0.01104751,size.height*0.3696691,size.width*0.00007470664,size.height*0.1926824,size.width*0.00007470664,size.height*0.1454955);
    path_0.cubicTo(size.width*0.00007470664,size.height*0.09830871,size.width*0.1739897,size.height*-0.05120620,size.width*0.3337690,size.height*-0.05120620);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Color(0xff6a83ff).withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
