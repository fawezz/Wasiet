import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wasiet/Controllers/DetailAdController.dart';
import 'package:wasiet/Views/detail_ad_views/DetailTab.dart';
import 'package:wasiet/Views/detail_ad_views/RatingTab.dart';
import 'package:wasiet/models/PostModel.dart';

class DetailAdView extends StatelessWidget {
  const DetailAdView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double tabw = Get.width * 0.413;
    final double tabh = Get.height * 0.0375;
    final tabfontsize = 14.sp;
    final DetailAdController controller = Get.find();
    controller.indicator.value = 1;

    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
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
                      height: 27.h,
                      width: 27.w,
                      fit: BoxFit.fill,
                    )),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Image.asset(
                          "assets/icons/share.png",
                          height: 26.w,
                          width: 26.w,
                        ),
                        onPressed: () {},
                      ),
                      Obx(
                        () => IconButton(
                          icon: Image.asset(
                            controller.isFavorite.value
                                ? "assets/icons/filledHeart.png"
                                : "assets/icons/outlineHeart.png",
                            height: 26.w,
                            width: 26.w,
                          ),
                          onPressed: () {
                            controller.isFavorite.value =
                                !controller.isFavorite.value;
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
              child: NestedScrollView(
                physics: const BouncingScrollPhysics(),
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      pinned: false,
                      backgroundColor: Colors.white,
                      flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.pin,
                        background: Column(
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                  width: Get.width,
                                  height: 0.30.sh,
                                  child: PageView.builder(
                                      itemCount: controller.post?.pictures.length,
                                      pageSnapping: true,
                                      controller: controller.pageController,
                                      physics: const BouncingScrollPhysics(),
                                      onPageChanged: (page) {
                                        controller.updateIndicator(page);
                                      },
                                      itemBuilder: (context, imageIndex) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image:
                                              Image.network(
                                                  controller.post!.pictures.elementAt(imageIndex),
                                                loadingBuilder: (BuildContext context, Widget child,
                                                    ImageChunkEvent? loadingProgress) {
                                                  if (loadingProgress == null) return child;
                                                  return Center(
                                                    child: CircularProgressIndicator(
                                                      value: loadingProgress.expectedTotalBytes != null
                                                          ? loadingProgress.cumulativeBytesLoaded /
                                                          loadingProgress.expectedTotalBytes!
                                                          : null,
                                                    ),
                                                  );
                                                },
                                              ).image,
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
                                        "${controller.indicator}/${controller.post!.pictures.length}",
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
                          ],
                        ),
                      ),
                      expandedHeight: 0.43.sh,
                    )
                  ];
                },
                body: Column(
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 24.h),
                        child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: controller.tabController,
                          children: const [
                            DetailTab(),
                            RatingTab(),
                          ],),
                      ),
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
                            Image.network(controller.post!.sellerPicture).image,
                          ),
                          10.w.horizontalSpace,
                          Text(
                            controller.post!.userName,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: (){
                              controller.launchUri("tel:94086751");
                            },
                            child: Container(
                              height: 55.h,
                              width: 69.w,
                              decoration: BoxDecoration(
                                color: HexColor("##0066B8"),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.w),
                                child: Image.asset(
                                  "assets/icons/phone.png",
                                  height: 26.w,
                                  width: 26.w,
                                ),
                              ),
                            ),
                          ),
                          10.sp.horizontalSpace,
                          GestureDetector(
                            onTap: (){
                              controller.launchUri("sms:94086751");
                            },
                            child: Container(
                              height: 55.h,
                              width: 69.w,
                              decoration: BoxDecoration(
                                color: HexColor("#00B4EF"),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.w),
                                child: Image.asset(
                                  "assets/icons/message.png",
                                  height: 26.w,
                                  width: 26.w,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
        ),
    );
  }
}
