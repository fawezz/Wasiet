import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wasiet/Custom_widgets/InfoField.dart';

import '../Custom_widgets/AdCard.dart';

class SellerProfileView extends StatelessWidget {
  const SellerProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: CircleAvatar(
                    radius: 45,
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
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    7.sp.verticalSpace,
                    Text(
                      "member since 03-02-2021",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: HexColor("#999999"),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
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
                10.sp.horizontalSpace,
                Container(
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
                )
              ],
            ),
            30.sp.verticalSpace,
            InfoField(labelText: "Email", data: "example@example.com"),
            InfoField(labelText: "Phone number", data: "32165465487"),
            InfoField(labelText: "Country", data: "Saudi Arabia"),
            30.sp.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Previously shared',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      color: HexColor("#0066B8")),
                ),
              ),
            ),
            25.sp.verticalSpace,
            false
                ? Text(
                    'none found',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: HexColor("#B2B2B2")),
                  )
                : Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    height: Get.height * 0.26,
                    width: Get.width * 0.9565,
                    decoration: BoxDecoration(
                      color: HexColor("#F5F5F5"),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: Get.height * 0.172,
                          width: Get.width * 0.92,
                          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: const PageScrollPhysics(parent: BouncingScrollPhysics()),
                              shrinkWrap: true,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return AdElement(
                                  isEditable: false,
                                );
                              }),
                        ),
                        Container(
                          height: 14.sp,
                          width: 64.sp,
                          decoration: BoxDecoration(
                            color: HexColor("#707070").withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 4.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 6.w,
                                  width: 6.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                Container(
                                  height: 7.w,
                                  width: 7.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                Container(
                                  height: 9.w,
                                  width: 9.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                Container(
                                  height: 7.w,
                                  width: 7.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                Container(
                                  height: 6.w,
                                  width: 6.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
            34.sp.verticalSpace,
            SizedBox(
              width: Get.width *0.8816,
              height: Get.height* 0.0675,
              child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/reportPerson');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty
                          .all(RoundedRectangleBorder(side: BorderSide(width: 2, color: HexColor("#0A3C5F")),
                          borderRadius: BorderRadius.circular(16))),
                      ),
                  child: Text("Report this person",
                    style: TextStyle(
                      color: HexColor("#0A3C5F"),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),)),
            ),
            34.sp.verticalSpace,
          ],
        ),
      ),
    );
  }
}
