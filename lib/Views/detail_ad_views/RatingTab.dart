import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wasiet/Controllers/DetailAdController.dart';
import 'package:wasiet/Custom_widgets/ButtonOutline.dart';
import 'package:wasiet/Custom_widgets/RatingAndComment.dart';
import 'package:wasiet/Custom_widgets/RatingBar.dart';

class RatingTab extends StatelessWidget {
  const RatingTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DetailAdController controller = Get.find();
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 24.0.h, left: 10.w, right: 10.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: Column(
                    children: [
                      RatingBar(percentage: 0.88, value: 5),
                      RatingBar(percentage: 0.45, value: 4),
                      RatingBar(percentage: 0.25, value: 3),
                      RatingBar(percentage: 0.1, value: 2),
                      RatingBar(percentage: 0.15, value: 1),
                    ]
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: 0.14.sh,
                      width: 0.27.sw,
                      decoration: BoxDecoration(
                        color: HexColor("#00B4EF").withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset("assets/icons/star-rounded-edges.png",
                            height: 80.h,
                            width: 78.w,
                          ),
                          Text(
                            controller.post!.avgRating.toString(),
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 26.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),]
                      ),
                    ),
                    Text("${controller.post!.avgRating} out of 5",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("(${controller.post!.ratingNumber} total)",
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: ButtonOutline(
                text: "Add Comment",
                width: 88.6.sw,
                function: (){
                  controller.showNewRatingBottomSheet(Get.context);
                }),
          ),
          if( controller.post!.ratings.isNotEmpty )...[
            ...(controller.post!.ratings).map((i) {
              return RatingAndComment(comment: i.comment, rating: i.rating, date: i.date, name: i.userName, userImage: i.userImage,);
            }).toList()
          ],
          if (controller.post!.ratings.isEmpty )...[
            100.h.verticalSpace,
            const Text("There are no comments on this post yet.",
            style: TextStyle(
              fontWeight: FontWeight.w100,
              fontSize: 16,
            ),)
          ]
        ],
      ),
    );
  }
}
