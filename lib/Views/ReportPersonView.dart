import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wasiet/Custom_widgets/ButtonBlueGradiant.dart';

import '../Controllers/ReportPersonController.dart';
import '../Custom_widgets/PictureCard.dart';

class ReportPersonView extends StatelessWidget {
  const ReportPersonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ReportPersonController _reportx = Get.put(ReportPersonController());

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Image.asset(
                "assets/icons/arrowBack.png",
                fit: BoxFit.fill,
              )),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 14.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 40.sp,
                  child: Center(
                    child: Text(
                      "Report This Person",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        backgroundColor: Colors.white,
                        color: HexColor("#0A3C5F"),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 6.sp,
                  width: Get.width * 0.1,
                  decoration: BoxDecoration(
                      color: HexColor("#00B4EF"),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(24.sp),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: CircleAvatar(
                      radius: Get.width * 0.07,
                      foregroundImage:
                          Image.asset("assets/icons/seller.jpg").image,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "foulen ben foulen",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      7.sp.verticalSpace,
                      Text(
                        "member since 03-02-2021",
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: HexColor("#999999"),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 24.sp),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 0.05.sw, bottom: 8),
                        child: Text(
                          "Subject",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 0.08.sh,
                      width: 0.88.sw,
                      decoration: BoxDecoration(
                        color: HexColor("#F6F7FA"),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                fillColor: HexColor("#F6F7FA"),
                              ),
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 24.sp),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 0.05.sw, bottom: 8),
                        child: Text(
                          "Report details",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 0.2.sh,
                      width: 0.88.sw,
                      decoration: BoxDecoration(
                        color: HexColor("#F6F7FA"),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: TextField(
                              maxLines: 9,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                fillColor: HexColor("#F6F7FA"),
                              ),
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              24.sp.verticalSpace,
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 0.05.sw, bottom: 8),
                  child: Text(
                    "Add pictures",
                    style: TextStyle(
                      color: HexColor("#0A3C5F"),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Obx(() => Wrap(
                spacing: 6.sp,
                runSpacing: 6.sp,
                direction: Axis.horizontal,
                  children: [
                    Container(
                      height: 0.2.sh,
                      width: 0.42.sw,
                      decoration: BoxDecoration(
                        color: HexColor("#0066B8").withOpacity(0.08),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: MaterialButton(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: const StadiumBorder(),
                        child: Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              "assets/icons/plus-circle.png",
                              scale: 3.5,
                            )),
                        onPressed: () {
                          _reportx.showAddPictureBottomSheet(Get.context);
                        },
                      ),
                    ),
                    if(_reportx.imageFileList.isEmpty)...[
                      SizedBox(height: 0.2.sh, width: 0.4.sw,),
                    ],
                    ...(_reportx.imageFileList).map((i) {
                      return PictureCard(image: i, onCancel: (){
                        _reportx.imageFileList.remove(i);
                      },
                      );
                    }).toList()
                  ]
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25.h),
                child: ButtonBlueGradiant(text: 'Send',
                  function: ()=> _reportx.sendReport(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
