import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wasiet/Controllers/NewAdController.dart';
import 'package:wasiet/Custom_widgets/CheckList.dart';
import 'package:wasiet/Custom_widgets/NewAdInputField.dart';
import 'package:wasiet/app/Constants.dart';



class NewAdStep3 extends StatefulWidget {
  const NewAdStep3({Key? key}) : super(key: key);

  @override
  State<NewAdStep3> createState() => _NewAdStep3State();
}

class _NewAdStep3State extends State<NewAdStep3> {
  @override
  Widget build(BuildContext context) {
    NewAdController controller = Get.find();

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
            NewAdInputField(text: 'Number of apartments', dropdown: false , textController: controller.titleController,
                obligatory: false, numeric: true, function: () {}),
            NewAdInputField(text: 'Number of floors', dropdown: false , textController: controller.countryController,
                obligatory: false, numeric: true, function: (){}),
            NewAdInputField(text: 'Mahallat', dropdown: false , textController: controller.regionController,
                obligatory: false, numeric: true, function: (){}),
            NewAdInputField(text: 'Number of elevators', dropdown: false , textController: controller.cityController,
                obligatory: false, numeric: true, function: (){}),
            NewAdInputField(text: 'Age of the estate', dropdown: false , textController: controller.streetController,
                obligatory: false, numeric: true, function: (){}),
            NewAdInputField(text: 'Available', dropdown: true , textController: controller.streetController,
                obligatory: false, function: (){
                  controller.showCheckListBottomSheet(Get.context, "Available", cAvailableList, (){setState((){});});
                }),
               StatefulBuilder(
                      builder: (BuildContext context,StateSetter setState){
                        return Wrap(
                          children: [
                            ...(controller.checkedItems).map((i) {
                              return Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 4.w, vertical: 4.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: HexColor("#AD46CB").withOpacity(0.1)
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(8.w),
                                  child: Wrap(
                                      direction: Axis.horizontal,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            controller.checkedItems.remove(i);
                                            setState((){});
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: HexColor("#AD46CB")
                                                  .withOpacity(0.14),
                                              borderRadius: BorderRadius
                                                  .circular(30),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(7),
                                              child: Image.asset(
                                                "assets/icons/x-white.png",
                                                scale: 3.7,
                                              ),
                                            ),
                                          ),
                                        ),
                                        8.w.horizontalSpace,
                                        Text(i,
                                          style: TextStyle(
                                              color: HexColor("#AD46CB"),
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500
                                          ),)
                                      ]
                                  ),
                                ),
                              );
                            }).toList()
                          ],
                        );
                  }),
            60.h.verticalSpace,
          ],
        ),
      ),
    );
  }
}
