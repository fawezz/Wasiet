import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class AdElement extends StatelessWidget {
  AdElement({Key? key, required this.isEditable}) : super(key: key);
  bool isEditable = false;

  _showModlBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Wrap(children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(child: Container(
                          height: 8,
                          width: 66,
                          decoration: BoxDecoration(
                              color: HexColor("##EBEBEB"),
                              borderRadius: BorderRadius.circular(10)
                          ),
                        )
                      ),
                      0.03.sh.verticalSpace,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: HexColor("#EBEFF2"),
                                borderRadius: BorderRadius.circular(40)),
                            child: Image.asset(
                              "assets/icons/modify.png",
                              scale: 1.5,
                            ),
                          ),
                           Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Text("Edit",
                            style: TextStyle(
                              color: HexColor("#0A3C5F"),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500),
                            ),
                          ),
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: HexColor("#EBEFF2"),
                                borderRadius: BorderRadius.circular(40)),
                            child: Image.asset(
                              "assets/icons/delete.png",
                              scale: 1.5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Text("Delete",
                              style: TextStyle(
                                  color: HexColor("#0A3C5F"),
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ]),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 4, right: 4),
      child: GestureDetector(
        onTap: () => {Get.toNamed('/detailAd')},
        child: Container(
          color: Colors.transparent,
          height: Get.height * 0.17,
          width: Get.width * 0.884,
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                    //image
                    height: Get.width * 0.338,
                    width: Get.width * 0.338,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: Image.asset(
                            "assets/icons/sale.jpg",
                          ).image,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///////////////////edit button
                          isEditable
                              ? SizedBox(
                                  width: Get.width * 0.0748,
                                  height: Get.width * 0.0748,
                                  child: GestureDetector(
                                    onTap: () =>
                                        {_showModlBottomSheet(Get.context)},
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      child: CircleAvatar(
                                        child: Image.asset(
                                            "assets/icons/editable.png"),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          SizedBox(
                            width: Get.width * 0.0966,
                            height: Get.width * 0.0966,
                            child: GestureDetector(
                              onTap: () => {
                                Get.toNamed("sellerProfile")
                              },
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.circular(40)),
                                child: CircleAvatar(
                                  child:
                                      Image.asset("assets/icons/user.png"),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 13.sp, top: 10.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        //categorie
                        Padding(
                          padding: const EdgeInsets.only(right: 8.5),
                          child: Container(
                            //test which color
                            height: Get.height * 0.028,
                            width: Get.width * 0.1014,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: HexColor("#00B4EF"),
                              borderRadius: BorderRadius.circular(45),
                            ),
                            //color: ,
                            child: Text(
                              "Rent",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        // if liked
                        SizedBox(
                          height: 21.sp,
                          width: 24.sp,
                          child: Image.asset(
                            "assets/icons/filledHeart.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        //else
                        //Image.asset("assets/icons/outlineHeart.png"),
                        (Get.width * 0.16).horizontalSpace,
                        //star
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4.0),
                          child: SizedBox(
                            height: 16.sp,
                            width: 16.sp,
                            child: Image.asset(
                              "assets/icons/star.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        //rating
                        Text(
                          "4.5",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.bold,
                            fontSize: 13.sp,
                          ),
                        ),
                        4.sp.horizontalSpace,
                        //number of raters
                        Text(
                          "(12)",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.normal,
                            fontSize: 13.sp,
                          ),
                        )
                      ],
                    ),
                    Text(
                      "5 floors villa",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "20-07-2021",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 10.sp, color: HexColor("#999999")),
                    ),
                    Text(
                      "Al Bukayriyah - Al Bukayriyah",
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      r"150,000$",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: HexColor("#0066B8"),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
