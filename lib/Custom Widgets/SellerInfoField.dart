import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class SellerInfoField extends StatelessWidget {
  SellerInfoField({Key? key,required this.labelText,required this.data}) : super(key: key);

  String labelText;
  String data;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 0.05.sw, bottom: 8),
              child: Text(labelText,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Container(
            height: 65.sp,
            width: 0.9.sw,
            decoration: BoxDecoration(
              color: HexColor("#F2F2F2"),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(data,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp
                    ),
                  ),
                )),
          ),
        ],

      ),
    );
  }
}
