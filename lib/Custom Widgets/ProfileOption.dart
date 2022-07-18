import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class ProfileOption extends StatelessWidget {
  ProfileOption({Key? key, required this.text,required this.namedView}) : super(key: key);

  String text;
  String namedView;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Container(
        height: Get.height*0.0886,
        width: Get.width*0.884,
        decoration: BoxDecoration(
          color: HexColor("#F1F4F9"),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width*0.058),
          child: GestureDetector(
            onTap: (){
              if(namedView == "/home"){
                //deconnect
                Get.offAllNamed("/home");
              }else{
                Get.toNamed(namedView);
              }

            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Image.asset("assets/icons/arrow-head.png",
                  scale: 3.5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
