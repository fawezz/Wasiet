import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasiet/Custom_widgets/RatingStars.dart';

class RatingAndComment extends StatelessWidget {
  const RatingAndComment({Key? key, required this.rating, this.comment = "", required this.date,
    required this.name, required this.userImage}) : super(key: key);

  final int rating;
  final String comment;
  final String date;
  final String name;
  final String userImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Wrap(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 27.sp,
                  foregroundImage:
                  Image.asset(userImage).image,
                ),
                10.w.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                RatingStars(rating: rating),
              ],
            ),
            if(comment.isNotEmpty)...[
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: Text(
                  comment,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      height: 1.3
                  ),
                  maxLines: 10,
                ),
              ),
            ]
          ],
      ),
    );
  }
}
