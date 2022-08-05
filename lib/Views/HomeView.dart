import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wasiet/Custom_widgets/AdCard.dart';

import '../Controllers/HomeTabController.dart';
import 'TestScreen1.dart';
import 'TestScreen2.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeTabController controller = Get.put(HomeTabController());
    Size size = MediaQuery.of(context).size;

    final double tabw = size.width * 0.1956;
    final double tabh = size.height * 0.0675;
    final tabfontsize = 14.sp;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
          child: Row(
            children: [
              Image.asset(
                'assets/icons/logo_bar.png',
                width: size.width*0.1812,
                height: size.width*0.1812,
              ),
              const Spacer(),
              FittedBox(
                child: SizedBox(
                  height: 60.sp,
                  child: IconButton(
                    icon: Image.asset(
                      'assets/icons/bell.png',
                      fit: BoxFit.fill,
                    ),
                    iconSize: 30.sp,
                    onPressed: (){
                      Get.toNamed("/notification");
                    },
                  ),
                ),
              ),
              const SizedBox(width: 15),
              SizedBox(
                height: 60.sp,
                child: IconButton(
                  icon: Image.asset(
                    'assets/icons/settings.png',
                    fit: BoxFit.fill,
                  ),
                  iconSize: size.width * 0.05,
                  onPressed: () {
                    Get.toNamed('/settings');
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 30.sp),
                child: SizedBox(
                  width: size.width * 0.65.w,
                  height: size.width * 0.13.h,
                  child: TextField(
                    style: TextStyle(
                        fontSize: 14.0.sp, color: Colors.black,),
                    decoration: InputDecoration(
                      hintText: "search for something",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: SizedBox(
                        child: Image.asset('assets/icons/search.png',
                          scale: 1.3,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding:  EdgeInsets.only(right: 30.sp),
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/icons/filtre.png',
                    height: 26.h,
                    width: 26.w,
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
              labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              labelPadding: const EdgeInsets.only(right: 5, left: 5),
              labelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor: HexColor("#0A3C5F"),
              isScrollable: true,
              indicator: BoxDecoration(
                gradient: LinearGradient(
                    colors: [HexColor("#0066B8"), HexColor("00B4EF")]),
                borderRadius: BorderRadius.circular(40.0),
              ),
              onTap: (int x) {
                controller.updateSelectedIndex();
              },
              controller: controller.tabController,
              tabs: [
                Obx(
                      () => Container(
                    width: tabw.sp,
                    height: tabh.sp,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: controller.selectedTabIndex.value != 0
                            ? Colors.white
                            : Colors.transparent),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Tab(
                        height: 60.sp,
                        child: Text("All",
                          style: TextStyle(
                              fontSize: tabfontsize.sp
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Obx(
                      () => Container(
                    width: tabw.sp,
                    height: tabh.sp,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: controller.selectedTabIndex.value != 1
                            ? Colors.white
                            : Colors.transparent),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Tab(
                        height: 60.sp,
                        child: Text("Sell",
                          style: TextStyle(
                              fontSize: tabfontsize.sp
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Obx(
                      () => Container(
                    width: tabw.sp,
                    height: tabh.sp,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: controller.selectedTabIndex.value != 2
                            ? Colors.white
                            : Colors.transparent),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Tab(
                        height: 60.sp,
                        child: Text("Rent",
                          style: TextStyle(
                              fontSize: tabfontsize.sp
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Obx(
                      () => Container(
                      width: tabw.sp,
                      height: tabh.sp,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: controller.selectedTabIndex.value != 3
                              ? Colors.white
                              : Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Tab(
                          height: 60.sp,
                          child: Text("Exchange",
                          style: TextStyle(
                            fontSize: tabfontsize.sp
                            ),
                          ),
                        ),
                      ),
                  ),
                ),
                Obx(
                      () => Container(
                    width: tabw.sp,
                    height: tabh.sp,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: controller.selectedTabIndex.value != 4
                            ? Colors.white
                            : Colors.transparent),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Tab(
                        height: 60.sp,
                        child: Text("Auction",
                          style: TextStyle(
                              fontSize: tabfontsize.sp
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
        ),
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller.tabController,
                    children:  [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.sp),
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:5,
                            itemBuilder: (context, index) {
                              return AdElement(isEditable: false,);
                            }
                        ),
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
