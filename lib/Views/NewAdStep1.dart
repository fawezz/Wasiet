import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wasiet/Custom%20Widgets/RadioList.dart';

import '../Controllers/NewAdController.dart';
import '../Custom Widgets/ButtonBlueGradiant.dart';
import '../Custom Widgets/NewAdInputField.dart';
import '../app/Constants.dart';

class NewAdStep1 extends StatelessWidget {
  const NewAdStep1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewAdController newAdController = Get.find();
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.all(24.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            NewAdInputField(
              text: 'Purpose of the Ad',
              dropdown: true,
              textController: newAdController.purposeController,
              obligatory: true,
              function: ()=> newAdController.showPurposeBottomSheet(
                  Get.context, "Purpose of the announcement",
                purposeList, NewAdController.purpose, newAdController.purposeController
              ),
            ),
            NewAdInputField(text: 'Estate Type',
              dropdown: true ,
              textController: newAdController.typeController,
              obligatory: true,
              function: ()=> newAdController.showPurposeBottomSheet(
                  Get.context, "Estate Type",
                  typeList, NewAdController.type, newAdController.typeController
              ),
            ),
            NewAdInputField(
              text: 'Unit of Measurement',
              dropdown: false ,
              textController: newAdController.unitController,
              obligatory: true,
              function: ()=> print("aaa"),
            ),
            NewAdInputField(
              text: 'Surface in square meters',
              dropdown: false ,
              textController: newAdController.surfaceController,
              obligatory: true,
              function: ()=> print("aaa"),
            ),
            NewAdInputField(
              text: 'Square meter price',
              dropdown: true ,
              textController: newAdController.unitPriceController,
              obligatory: true,
              function: ()=> print("aaa"),
            ),
          ],
        ),
      ),
    );
  }
}


