import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class TechnicalInfoField extends StatelessWidget {
  const TechnicalInfoField({Key? key, required this.title, required this.value, required this.isColored}) : super(key: key);

  final String title;
  final String value;
  final bool isColored;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.0586.sh,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: isColored? HexColor("#0066B8").withOpacity(0.08):Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal),
            ),
            Text(
              value,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}
