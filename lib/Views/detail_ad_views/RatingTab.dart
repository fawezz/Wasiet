import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wasiet/Custom_widgets/ButtonOutline.dart';
import 'package:wasiet/Custom_widgets/RatingAndComment.dart';
import 'package:wasiet/Custom_widgets/RatingBar.dart';

class RatingTab extends StatelessWidget {
  const RatingTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 24.0.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 0.6.sw,
                    height: 0.02.sh,
                    child: RatingBar(percentage: 0.76, value: 5)
                ),

                ]
              ),
              Container(
                height: 0.14.sh,
                width: 0.27.sw,
                decoration: BoxDecoration(
                  color: HexColor("#00B4EF").withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: Image.asset("assets/icons/star-rounded-edges.png",
                      scale: 3.8,).image),
                ),
                child: Center(
                  child: Text(
                    "4.5",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 26.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: ButtonOutline(text: "Add Comment", width: 88.6.sw, function: (){}),
        ),
        8.h.verticalSpace,
        const RatingAndComment(comment: "test test ", rating: 4, date: '20-07-2022', name: "yacoub dbiaza", userImage: "assets/icons/seller.jpg",),

      ],
    );
  }
}
