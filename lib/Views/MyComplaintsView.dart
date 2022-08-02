import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';


class MyComplaintsView extends StatelessWidget {
  const MyComplaintsView({Key? key}) : super(key: key);

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
                      "Complaints",
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
      body: Container(
        height: Get.height * 0.9,
        width: Get.width * 0.92,
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        child: Padding(
          padding: EdgeInsets.only(top: 24.sp, left: 8, right: 8),
          child: SizedBox(
              height: Get.height * 0.78,
              child:
              ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      Get.toNamed('/complaintDetails');
                    },
                    child: Container(
                      height: Get.height * 0.14,
                        margin: EdgeInsets.only(top: 8.sp, bottom: 16.sp),
                        padding: EdgeInsets.all(11.sp),
                        decoration: BoxDecoration(
                          color: HexColor("#EEEFF2"),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 8.sp),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      //test which color
                                      padding: EdgeInsets.all(8),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: HexColor("#00B4EF"),
                                        borderRadius: BorderRadius.circular(45),
                                      ),
                                      //color: ,
                                      child: Text(
                                        "processing",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text("#1000232",
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text("title of the reported complaint",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                ),
                              ),
                              4.sp.verticalSpace,
                              Text("2021-07-20",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 10.sp,
                                ),
                              ),
                            ]
                        )
                    ),
                  );
                }
                ,)
          ),
        )
      ),
    );
  }
}
