import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wasiet/Custom%20Widgets/AdElement.dart';

import '../Controllers/HomeTabController.dart';
import 'TestScreen1.dart';
import 'TestScreen2.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeTabController _tabx = Get.put(HomeTabController());
    Size size = MediaQuery.of(context).size;

    return Column(
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
                  width: size.width * 0.7,
                  height: 50,
                  child: TextField(
                    style: const TextStyle(
                        fontSize: 16.0, color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "search for something",
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
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: TabBar(
              labelStyle:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
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
        ),
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _tabx.controller,
                    children:  [
                      ListView.builder(
                        physics: const BouncingScrollPhysics(),
                          itemCount:5,
                          itemBuilder: (context, index) {
                            return AdElement();
                          }
                      ),
                      TestScreen2(),
                      TestScreen1(),
                      TestScreen2(),
                      TestScreen1(),
                    ],
                  ),
                )
      ],
    );
  }
}
