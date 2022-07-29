import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class ButtonOutline extends StatelessWidget {
  const ButtonOutline({Key? key, required this.text, this.height, this.width, required this.function}) : super(key: key);

  final String text;
  final width ;
  final height ;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? Get.width *0.422,
      height: height ?? Get.height* 0.07,
      child: ElevatedButton(
          onPressed: function,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty
                .all(RoundedRectangleBorder(side: BorderSide(width: 2, color: HexColor("#0A3C5F")),
                borderRadius: BorderRadius.circular(16))),
          ),
          child: Text(text,
            style: TextStyle(
              color: HexColor("#0A3C5F"),
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),)),
    );
  }
}
