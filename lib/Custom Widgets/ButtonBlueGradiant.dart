import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class ButtonBlueGradiant extends StatelessWidget {
  const ButtonBlueGradiant({Key? key, required this.text, required this.function}) : super(key: key);

  final String text;
  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25.h),
      child: Container(
        width: Get.width * 0.88,
        height: Get.height * 0.07,
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [HexColor("#0066B8"), HexColor("#00B2EE"),],
          ),
        ),
        child: MaterialButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: const StadiumBorder(),
          onPressed: function,
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 14.sp),
          )
        ),
      ),
    );
  }
}
