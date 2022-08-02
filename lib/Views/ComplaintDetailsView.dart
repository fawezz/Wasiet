import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wasiet/Custom_widgets/InfoField.dart';

import '../Controllers/ComplaintDetailsController.dart';
import '../Custom_widgets/PictureCard.dart';

class ComplaintDetailsView extends StatelessWidget {
  const ComplaintDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ComplaintDetailsController _reportDetailx = Get.put(ComplaintDetailsController());
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
                height: 27.h,
                width: 27.w,
                fit: BoxFit.fill,
              )),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 8.0, right: 24.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 40.sp,
                  child: Center(
                    child: Text(
                      "Complaint Details",
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
              ],
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text("2021-07-20",
                  style: TextStyle(
                      fontSize: 10.sp
                  ),
                ),
              ),
              14.h.verticalSpace,
              // Test if the complaint has a user
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
              InfoField(labelText: 'Complaint Number', data: '1000232'),
              InfoField(labelText: 'Complaint State', data: '1000232'),
              InfoField(labelText: 'Subject', data: '1000232'),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 0.05.sw, bottom: 8),
                  child: Text('Complaint Details',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Container(
                height: 0.19.sh,
                width: 0.9.sw,
                decoration: BoxDecoration(
                  color: HexColor("#F2F2F2"),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.0.sp, right: 16.sp),
                      child: Text("There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                        style: TextStyle(
                            height: 1.4,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp
                        ),
                      ),
                    )),
              ),
              //test if the complaint has pictures
              Column(
                children: [
                  16.h.verticalSpace,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 0.05.sw, bottom: 8),
                      child: Text(
                        "Pictures",
                        style: TextStyle(
                          color: HexColor("#0A3C5F"),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Wrap(
                      spacing: 6.sp,
                      runSpacing: 6.sp,
                      direction: Axis.horizontal,
                      children: [
                        /*
                    ...(_reportDetailx.imageFileList).map((i) {
                      return ReportPictureCard(image: i);
                    }).toList()*/
                      ]
                  ),
                ],
              ),

              //test state of complaint if completed show this column
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 24.h),
                    color: HexColor("#CCCCCC"),
                    height: 2,
                    width: 88.4.sw,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 0.05.sw, bottom: 8),
                      child: Text(
                        "The Administration's Response",
                        style: TextStyle(
                          color: HexColor("#0066B8"),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 0.19.sh,
                    width: 0.9.sw,
                    decoration: BoxDecoration(
                      color: HexColor("#0A3C5F"),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 16.0.sp, right: 16.sp),
                          child: Text("There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                            style: TextStyle(
                                height: 1.4,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp
                            ),
                          ),
                        )),
                  ),
                ],
              ),
              24.h.verticalSpace,
              SizedBox(
                width: 88.4.sw,
                height: Get.height* 0.0675,
                child: ElevatedButton(
                    onPressed: () {
                      //Get.offAndToNamed('/myComplaints');
                      Get.back();
                      print("delete complaint button pressed");
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty
                          .all(RoundedRectangleBorder(side: BorderSide(width: 2, color: HexColor("#0A3C5F")),
                          borderRadius: BorderRadius.circular(16))),
                    ),
                    child: Text("Delete Complaint",
                      style: TextStyle(
                        color: HexColor("#0A3C5F"),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
