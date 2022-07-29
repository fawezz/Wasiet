import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class RatingBar extends StatelessWidget {
   RatingBar({Key? key, required this.percentage, required this.value}) : super(key: key);

  final barWidth = Get.width * 0.5;
  final double percentage;
   final int value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 0.5.sw,
          child: Stack(
            children: [
              Positioned(
                right: 12.w,
                child: Container(
                  height: 0.016.sh,
                  width: barWidth,
                  decoration: BoxDecoration(
                    color: HexColor("#E6E6E6"),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              Positioned(
                right: 12.w,
                child: Container(
                  height: 0.016.sh,
                  width: barWidth*percentage,
                  decoration: BoxDecoration(
                    color: HexColor("#00B4EF"),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(value.toString(),
        style: TextStyle(
          fontFamily: "Roboto",
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
        ),),
      ],
    );
  }
}
