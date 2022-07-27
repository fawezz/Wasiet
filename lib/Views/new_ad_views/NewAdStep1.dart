import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wasiet/Controllers/NewAdController.dart';
import 'package:wasiet/Custom%20Widgets/NewAdInputField.dart';
import 'package:wasiet/app/Constants.dart';

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
              function: ()=> newAdController.showRadioBottomSheet(
                  Get.context, "Purpose of the announcement",
                purposeList, NewAdController.purpose, newAdController.purposeController,
                false
              ),
            ),
            NewAdInputField(text: 'Estate Type',
              dropdown: true ,
              textController: newAdController.typeController,
              obligatory: true,
              function: ()=> newAdController.showRadioBottomSheet(
                  Get.context, "Estate Type",
                  typeList, NewAdController.type, newAdController.typeController,
                  true
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
              numeric: true,
              function: ()=> print("aaa"),
            ),
            NewAdInputField(
              text: 'Square meter price',
              dropdown: false ,
              textController: newAdController.unitPriceController,
              obligatory: true,
              numeric: true,
              function: ()=> print("aaa"),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Text(
                  '*Total Price',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                NewAdInputField(
                  width: 0.5.sw,
                  text: 'Total Price',
                  label: false,
                  dropdown: false ,
                  textController: newAdController.totalPriceController,
                  obligatory: false,
                  numeric: true,
                  function: ()=> print("aaa"),
                ),
                const Spacer(),
                NewAdInputField(
                  width: 0.35.sw,
                  text: 'Rial',
                  label: false,
                  dropdown: true ,
                  textController: newAdController.currencyController,
                  obligatory: false,
                  numeric: true,
                  //prefixIcon: "assets/icons/outlineHeart.png",
                  function: ()=> print("aaa"),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(left: 0.05.sw, bottom: 8),
                child: Text(
                  '*Compulsory Field',
                  style: TextStyle(
                    color: HexColor("#707070"),
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Text("The total price will be automatically calculated once the area and the price price per square meter are set",
              style: TextStyle(color: HexColor("#00B4EF"), fontSize: 12.sp, fontWeight: FontWeight.w500,
              )
            ),
            20.h.verticalSpace
          ],
        ),
      ),
    );
  }
}


