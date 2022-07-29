import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wasiet/Custom_widgets/ProfileOption.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

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
                      child: Text("Settings",
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
        body: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            children: [
              (Get.height*0.01).verticalSpace,
              ProfileOption(text: "Change language", namedView: "/"),
              ProfileOption(text: "Contact us", namedView: "/contactUs"),
              ProfileOption(text: "Terms of service", namedView: "/terms"),
              ProfileOption(text: "About", namedView: "/about"),
            ],
          ),
        ),
      ),
    );
  }
}
