import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wasiet/Controllers/DetailAdController.dart';
import 'package:wasiet/Views/detail_ad_views/DetailTab.dart';
import 'package:wasiet/Views/detail_ad_views/RatingTab.dart';

class DetailAdView extends StatelessWidget {
  const DetailAdView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double tabw = Get.width * 0.413;
    final double tabh = Get.height * 0.0375;
    final tabfontsize = 14.sp;
    final DetailAdController controller = Get.put(DetailAdController());

    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leadingWidth: 100,
            automaticallyImplyLeading: false,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: IconButton(
                  onPressed: () {
                    Get.back();
                    controller.dispose();
                  },
                  icon: Image.asset(
                    "assets/icons/arrowBack.png",
                    fit: BoxFit.fill,
                  )),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(top:8.0, right: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Image.asset("assets/icons/share.png",
                        height: 26.w,
                        width: 26.w,
                      ),
                      onPressed: () {  },
                    ),
                    Obx( ()=>
                        IconButton(
                          icon:Image.asset(controller.isFavorite.value?"assets/icons/filledHeart.png":"assets/icons/outlineHeart.png",
                            height: 26.w,
                            width: 26.w,
                          ),
                          onPressed: () {
                            controller.isFavorite.value = !controller.isFavorite.value;
                            },
                        ),
                    ),
                  ],
                ),
              ),
            ],
            backgroundColor: Colors.white,
          ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: Get.width,
                        height: 0.30.sh,
                        child: PageView.builder(
                            itemCount: controller.images.length,
                            pageSnapping: true,
                            controller: controller.pageController,
                            physics: const BouncingScrollPhysics(),
                            onPageChanged: (page) {
                              controller.updateIndicator(page);
                            },
                            itemBuilder: (context, pagePosition) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image:
                                        Image.network(controller.images[pagePosition])
                                            .image,
                                  ),
                                ),
                              );
                            }),
                      ),
                      Positioned(
                        bottom: 16.h,
                        right: 16.w,
                        child: Container(
                          height: 0.038.sh,
                          width: 0.125.sw,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Center(
                            child: Obx(() => Text(
                                  "${controller.indicator}/${controller.images.length}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp,
                                  ),
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                  20.h.verticalSpace,
                  Container(
                    height: 0.1.sh,
                    width: 1.sw,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          colors: [HexColor("#00B4EF"), HexColor("#CEB8A0")]),
                    ),
                    child: SizedBox(
                      height: 0.05.sh,
                      child: Padding(
                        padding: EdgeInsets.all(16.sp),
                        child: TabBar(
                            labelStyle: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                            labelPadding: const EdgeInsets.only(right: 5, left: 5),
                            labelColor: HexColor("#0066B8"),
                            indicatorSize: TabBarIndicatorSize.label,
                            unselectedLabelColor: Colors.white,
                            indicator: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            indicatorPadding: const EdgeInsets.all(0),
                            onTap: (int x) {
                              controller.updateSelectedIndex();
                            },
                            controller: controller.tabController,
                            tabs: [
                              SizedBox(
                                width: tabw.sp,
                                height: tabh.sp,
                                child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Tab(
                                    child: Text(
                                      "Details",
                                      style: TextStyle(fontSize: tabfontsize.sp),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: tabw.sp,
                                height: tabh.sp,
                                child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Tab(
                                    child: Text(
                                      "Rating & Comments",
                                      style: TextStyle(fontSize: tabfontsize.sp),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.sh,
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: controller.tabController,
                      children: const [
                        DetailTab(),
                        RatingTab(),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: 1.sw,
                height: 0.1.sh,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 27.sp,
                      foregroundImage:
                      Image.asset("assets/icons/seller.jpg").image,
                    ),
                    10.w.horizontalSpace,
                    Text(
                      "foulen ben foulen",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 55.sp,
                      width: 69.sp,
                      decoration: BoxDecoration(
                        color: HexColor("##0066B8"),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset(
                        "assets/icons/phone.png",
                        scale: 3.5,
                      ),
                    ),
                    10.sp.horizontalSpace,
                    Container(
                      height: 55.sp,
                      width: 69.sp,
                      decoration: BoxDecoration(
                        color: HexColor("#00B4EF"),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset(
                        "assets/icons/message.png",
                        scale: 3.5,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
