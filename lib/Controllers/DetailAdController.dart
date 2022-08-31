import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wasiet/Custom_widgets/ButtonBlueGradiant.dart';
import 'package:wasiet/models/PostModel.dart';

class DetailAdController extends GetxController with GetSingleTickerProviderStateMixin{

  PostModel? post ;
  //image slider
  final pageController = PageController(initialPage: 0);
  RxInt indicator = 0.obs;

  void updateIndicator(int x) {
    indicator.value = x+1;
    pageController.animateToPage(x, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  //Tabbar
  var selectedTabIndex = 0 .obs;
  late TabController tabController;

  void updateSelectedIndex() {
    selectedTabIndex.value = tabController.index;
  }

  //appbar
  RxBool isFavorite = true.obs;

  //RAting
  RxInt newRating = 0.obs;

  showNewRatingBottomSheet(context) {
    var i = 0;
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Wrap(children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Padding(
                  padding: EdgeInsets.all(24.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(child:
                      Container(
                        height: 8.h,
                        width: 66.w,
                        decoration: BoxDecoration(
                            color: HexColor("##EBEBEB"),
                            borderRadius: BorderRadius.circular(10)
                        ),
                      )
                      ),
                      0.03.sh.verticalSpace,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Your rating",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      StatefulBuilder(builder: (context, setstate){
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.h),
                          child: SizedBox(
                            height: 80.h,
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (context, int i)
                                {
                                  return GestureDetector(
                                    onTap: () {
                                      setstate((){
                                        newRating.value = i+1;
                                        print(newRating);
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: SizedBox(
                                        height: 40.sp,
                                        width: 40.sp,
                                        child: Image.asset(i<newRating.value?"assets/icons/star-blue.png":"assets/icons/star-outline.png",
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  );}
                            ),
                          ),
                        );
                      }),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Your Comment",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top:16.h, bottom: 24.h),
                        child: TextField(
                          minLines: 5,
                          maxLines: 6,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: "Comment Text",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                      ButtonBlueGradiant(text: 'Confirm',
                        function: (){
                        //send rating
                          Get.back();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          );
        });
  }

  launchUri(String u) async {
    Uri url = Uri.parse(u);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  void onClose() {
    tabController.dispose();
    indicator = 0.obs;
    super.onClose();
    dispose();
  }

  List<String> images = [
    "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
    "https://wallpaperaccess.com/full/2637581.jpg",
    "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg"
  ];

}