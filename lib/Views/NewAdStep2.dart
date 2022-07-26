import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wasiet/Custom%20Widgets/NewAdInputField.dart';
import 'package:wasiet/app/Constants.dart';

import '../Controllers/NewAdController.dart';

class NewAdStep2 extends StatelessWidget {
  const NewAdStep2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewAdController newAdController = Get.find();

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 0.05.sw, bottom: 8),
                child: Text(
                  "Fill the width and direction of the street(s) surrounding your estate.\n"
                      "*the streets not suitable for your estate should be left empty",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    height: 1.4,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NewAdInputField(text: "Northern street width", label: false, obligatory: false, dropdown: false,
                  width: 0.42.sw, height: 0.0818.sh, numeric: true,
                  textController: newAdController.northController,function: null,),
                16.w.horizontalSpace,
                NewAdInputField(text: "Southern street width", label: false, obligatory: false, dropdown: false,
                  width: 0.42.sw, height: 0.0818.sh, numeric: true,
                  textController: newAdController.southController,function: null,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NewAdInputField(text: "Eastern street width", label: false, obligatory: false, dropdown: false,
                  width: 0.42.sw, height: 0.0818.sh, numeric: true,
                  textController: newAdController.eastController,function: null,),
                16.w.horizontalSpace,
                NewAdInputField(text: "Western street width", label: false, obligatory: false, dropdown: false,
                  width: 0.42.sw, height: 0.0818.sh, numeric: true,
                  textController: newAdController.westController,function: null,),
              ],
            ),
            16.h.verticalSpace,
            NewAdInputField(text: "More details", dropdown: false, textController: newAdController.detailsController,
                obligatory: false, width: 0.88.sw, height: 0.188.sh, multiline: true, function: null),
            16.h.verticalSpace,
            NewAdInputField(text: "Email", dropdown: false, textController: newAdController.emailController,
                obligatory: false, function: null),
            16.h.verticalSpace,
            NewAdInputField(text: "Identity of the announcer", dropdown: true, textController: newAdController.identityController,
                obligatory: false, function: null),

          ],
        ),
      ),
    );
  }
}

