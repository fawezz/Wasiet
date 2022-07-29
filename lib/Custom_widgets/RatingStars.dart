import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({Key? key, required this.rating}) : super(key: key);

  final int rating;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          for (var i = 0 ; i < rating ; i++ )
            ...[SizedBox(
            height: 16.sp,
            width: 16.sp,
            child: Image.asset("assets/icons/star-blue.png",
              fit: BoxFit.contain,
            ),
          ),
          6.w.horizontalSpace,
          ],
          for (var i = 0 ; i < 5-rating ; i++ )
            ...[SizedBox(
              height: 16.sp,
              width: 16.sp,
              child: Image.asset("assets/icons/star-white.png",
                fit: BoxFit.contain,
              ),
            ),
              6.w.horizontalSpace,
            ]
        ],
      ),
    );
  }
}
