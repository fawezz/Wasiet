import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wasiet/Custom%20Widgets/ProfileOption.dart';

import '../Controllers/ProfileController.dart';

class ProfileView extends StatelessWidget {
   ProfileView({Key? key, this.connected = false}) : super(key: key);

   bool connected;
   //_toggleController
  @override
  Widget build(BuildContext context) {
    final ProfileController _profilex = Get.put(ProfileController());

    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                !connected?Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: Get.width * 0.25,
                            width: Get.width * 0.25,
                            child: Positioned(
                              left: 8,
                              child: CircleAvatar(
                                radius: Get.width * 0.116,
                                backgroundColor: HexColor("#00B4EF"),
                                backgroundImage: Image.asset("assets/icons/seller.jpg").image,
                              ),
                            ),
                          ),
                          connected?
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: Container(
                              height: Get.width *0.0966,
                              width: Get.width * 0.0966,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              padding: const EdgeInsets.all(2),
                              child: CircleAvatar(
                                radius: Get.width*0.4347,
                                backgroundColor: HexColor("#E9E9E9"),
                                child: Image.asset("assets/icons/camera.png",
                                  scale: 3.5,
                                ),
                              ),
                            ),
                          ):
                              Container(),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 24.sp),
                        child: Column(
                          children: [
                            Text("Ahmed Ben Talal",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                              color: HexColor("#0A3C5F"),
                            ),),
                            6.h.verticalSpace,
                            Text("+923003213215",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: HexColor("#0A3C5F"),
                              ),)
                          ],
                        ),
                      )
                    ],
                  ),
                ):
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
                  child: Row(
                    children: [
                      SizedBox(
                        height: Get.width * 0.25,
                        width: Get.width * 0.25,
                        child: CircleAvatar(
                          radius: Get.width * 0.116,
                          backgroundColor: HexColor("#00B4EF"),
                          child: Image.asset("assets/icons/user-white.png",
                            scale: 3.4,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: Get.width*0.099),
                        child: SizedBox(
                          width: Get.width *0.5144,
                          height: Get.height* 0.0675,
                          child: ElevatedButton(
                              onPressed: () {
                                Get.toNamed("login");
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                shape: MaterialStateProperty
                                    .all(RoundedRectangleBorder(side: BorderSide(width: 2, color: HexColor("#0A3C5F")),
                                    borderRadius: BorderRadius.circular(16))),
                              ),
                              child: Text("Log in",
                                style: TextStyle(
                                  color: HexColor("#0A3C5F"),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),)),
                        ),
                      )
                    ],
                  ),
                ),
                (Get.height*0.01).verticalSpace,
                ProfileOption(text: "Edit my information", namedView: "/editInfo"),
                ProfileOption(text: "Complaints follow up", namedView: "/myComplaints"),
                ProfileOption(text: "My ads", namedView: "/myAds"),
                ProfileOption(text: "Auction Participations", namedView: "/AuctionParticipation"),
                ProfileOption(text: "Favorites", namedView: "/favorites"),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Container(
                    height: Get.height*0.0886,
                    width: Get.width*0.884,
                    decoration: BoxDecoration(
                      color: HexColor("#F1F4F9"),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: Get.width*0.058),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Receive notifications",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              _profilex.toggleButton();
                            },
                            child: Stack(
                              children: [
                                Container(
                                  height: 30.sp,
                                  width: 50.sp,
                                  decoration: BoxDecoration(
                                    color: HexColor("#1CD159").withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                ),
                                SlideTransition(
                                  position: _profilex.offsetAnimation,
                                  child: Container(
                                    height: 30.sp,
                                    width: 30.sp,
                                    decoration: BoxDecoration(
                                        color: HexColor("#1CD159"),
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
                ProfileOption(text: "Exit", namedView: "/home"),

              ],
            ),
          ),
        )
    );
  }
}
