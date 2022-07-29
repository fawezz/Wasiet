import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wasiet/Controllers/NewAdController.dart';
import 'package:wasiet/Custom_widgets/NewAdInputField.dart';
import 'package:wasiet/app/Constants.dart';



class NewAdStep3 extends StatelessWidget {
  const NewAdStep3({Key? key}) : super(key: key);

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
            Padding(
              padding: EdgeInsets.only(bottom: 15.h),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Residential Building",
                  style: TextStyle(
                    color: HexColor("#0A3C5F"),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            NewAdInputField(text: 'Number of apartments', dropdown: false , textController: newAdController.titleController,
                obligatory: false, numeric: true, function: () {}),
            NewAdInputField(text: 'Number of floors', dropdown: false , textController: newAdController.countryController,
                obligatory: false, numeric: true, function: (){}),
            NewAdInputField(text: 'Mahallat', dropdown: false , textController: newAdController.regionController,
                obligatory: false, numeric: true, function: (){}),
            NewAdInputField(text: 'Number of elevators', dropdown: false , textController: newAdController.cityController,
                obligatory: false, numeric: true, function: (){}),
            NewAdInputField(text: 'Age of the estate', dropdown: false , textController: newAdController.streetController,
                obligatory: false, numeric: true, function: (){}),
            NewAdInputField(text: 'Available', dropdown: true , textController: newAdController.streetController,
                obligatory: false, function: (){
                  newAdController.showCheckListBottomSheet(Get.context, "Available", availableList);
                }),
            60.h.verticalSpace,
          ],
        ),
      ),
    );
  }
}
