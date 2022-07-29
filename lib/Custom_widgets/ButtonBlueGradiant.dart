import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class ButtonBlueGradiant extends StatelessWidget {
  const ButtonBlueGradiant({Key? key, required this.text, required this.function, this.height, this.width}) : super(key: key);

  final String text;
  final height;
  final width;
  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? Get.width * 0.88,
      height: height ?? Get.height * 0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [HexColor("#0066B8"), HexColor("#00B2EE"),],
        ),
      ),
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
          ),
        )
      ),
    );
  }
}