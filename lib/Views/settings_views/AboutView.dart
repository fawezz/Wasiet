import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        child: Text("About the Application",
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
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ],
                ),
              ),
            ],
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(24.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  38.h.verticalSpace,
                  Center(
                    child: Image.asset("assets/icons/logo-full.png",
                      scale: 3,
                    ),
                  ),
                  38.h.verticalSpace,
                  Text("WASIET - وسيط",
                    style: TextStyle(
                      color: HexColor("#0066B8"),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  16.h.verticalSpace,
                  Text("It is a modern Saudi application that enables those wishing to sell, buy and rent their real estate of all kinds and forms by direct and indirect auction to obtain the best price and the least possible time. We hope that this application will be useful and useful for everyone and in line with the Kingdom's vision 20-30",
                    style: TextStyle(
                      height: 1.5,
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}