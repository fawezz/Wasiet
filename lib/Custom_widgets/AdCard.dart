import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:wasiet/models/PostModel.dart';

import '../Controllers/DetailAdController.dart';

class AdElement extends StatelessWidget {
  AdElement({Key? key, required this.isEditable, required this.post}) : super(key: key);

  bool isEditable = false;
  PostModel post;
  var formatter = NumberFormat('#,###,###.00\$');

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
        onTap: () {
          DetailAdController c = Get.put(DetailAdController());
          c.post = post;
          Get.toNamed('/detailAd', arguments: {"post": post});
        },
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
                          image: FadeInImage.assetNetwork(
                            placeholder: "assets/icons/img-placeholder.jpg",
                            image: post.pictures.first,
                          ).image),),
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
                                Get.toNamed("/sellerProfile")
                              },
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.circular(40)),
                                child: CircleAvatar(
                                  backgroundImage:
                                    Image.network(post.sellerPicture!).image
                                      //Image.asset("assets/icons/user.png"),
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
                            height: Get.height * 0.032,
                            width: Get.width * 0.125,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: (() {
                                switch(post.category) {
                                  case "rent": {
                                    return HexColor("#00B4EF");
                                  }
                                  case "sell": {
                                    return HexColor("#FF4B70");
                                  }
                                  case "exchange": {
                                    return HexColor("#7951FF");
                                  }
                                  default: {
                                    return HexColor("#00B4EF");
                                  }
                                }
                              }()),
                              borderRadius: BorderRadius.circular(45),
                            ),
                            child: Text(
                              post.category!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 21.sp,
                          width: 24.sp,
                          child: Image.asset(
                            post.id.isEven?"assets/icons/filledHeart.png": "assets/icons/outlineHeart.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        //Image.asset(),
                        0.16.sw.horizontalSpace,
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
                          post.avgRating.toString(),
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.bold,
                            fontSize: 13.sp,
                          ),
                        ),
                        4.sp.horizontalSpace,
                        //number of raters
                        Text(
                          "(${post.ratingNumber.toString()})",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.normal,
                            fontSize: 13.sp,
                          ),
                        )
                      ],
                    ),
                    Text(
                      post.title,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      post.date,
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 10.sp, color: HexColor("#999999")),
                    ),
                    Text(
                      "${post.country} - ${post.city}",
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      formatter.format(post.totalPrice),
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
