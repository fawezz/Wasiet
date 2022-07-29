import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wasiet/Custom_widgets/NewAdInputField.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leadingWidth: 100,
            automaticallyImplyLeading: false,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Image.asset(
                    "assets/icons/x.png",
                    fit: BoxFit.fill,
                    height: 18.w,
                    width: 18.w,
                  )),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(top:8.0, right: 14.0),
                child: SizedBox(
                  height: 40.sp,
                  child: Center(
                    child: Text("Your Phone Number",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        backgroundColor: Colors.white,
                        color: HexColor("#0A3C5F"),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
            backgroundColor: Colors.white,
          ),
          body: Padding(
            padding: EdgeInsets.all(24.sp),
            child: Column(
              children: [
                NewAdInputField(text: "Your phone number", dropdown: false,
                    textController: TextEditingController().obs, obligatory: false,
                    prefixIcon: "assets/icons/phone-black.png",
                    function: null),

              ],
            ),
          ),
        )
    );
  }
}
