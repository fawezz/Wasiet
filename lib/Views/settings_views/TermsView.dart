import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class TermsView extends StatelessWidget {
  const TermsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final boldStyle = TextStyle(
    color: Colors.black,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    );
    final normalStyle = TextStyle(
      height: 1.5,
      color: Colors.black,
      fontSize: 14.sp,
      fontWeight: FontWeight.normal,
    );

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
                padding: const EdgeInsets.only(top:8.0, right: 14.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 40.sp,
                      child: Center(
                        child: Text("Terms Of Service",
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
                      width: Get.width*0.1,
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
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(24.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("About our services",
                    style: TextStyle(
                      color: HexColor("#0066B8"),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  16.h.verticalSpace,
                  Text("Principles of privacy and safety",
                      style: boldStyle
                  ),
                  Text("Since our founding, we have aspired to build our services with a strong set of privacy and security principles in mind.",
                  style: normalStyle,
                  ),
                  16.h.verticalSpace,
                  Text("Communication with other people",
                      style: boldStyle
                  ),
                  Text("We offer you, and always do our best to improve, several ways that allow you to communicate with other WhatsApp users via messages, voice calls and video calls, send photos and videos, view your status, and share your location with others when you choose. We may offer you a convenient platform that allows you to send money to or receive money from other users via our Platform. WhatsApp works with partners, service providers, and affiliates to help us provide ways for you to communicate through their services.",
                    style: normalStyle,
                  ),
                  16.h.verticalSpace,
                  Text("ways to improve our services",
                      style: boldStyle
                  ),
                  Text("We analyze how you use it so we can improve all of our services, including helping businesses that use WhatsApp measure the effectiveness and distribution of their services and messages. WhatsApp uses the information it has and also cooperates with partners, service providers, and affiliates to do so.",
                    style: normalStyle,
                  ),
                  16.h.verticalSpace,
                  Text("Communication with businesses",
                      style: boldStyle
                  ),
                  Text("We offer, and always do our best to improve, the many ways that you and other businesses and organizations can communicate with each other through our Services, for example by exchanging order messages, transactions, scheduling information, delivery and shipping notices, product and service updates, and marketing.",
                    style: normalStyle,
                  ),
                  16.h.verticalSpace,
                ],
              ),
            ),
          ),
        ));
  }
}
