import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Controllers/NewAdController.dart';
import '../Custom Widgets/NewAdInputField.dart';

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
            NewAdInputField(label: 'Purpose of the Ad', dropdown: false ,
              textController: newAdController.purposeController, obligatory: true,
              function: ()=> print("aaa"),
            ),
            NewAdInputField(label: 'Estate Type', dropdown: false ,
              textController: newAdController.typeController, obligatory: true,
              function: ()=> print("aaa"),
            ),
            NewAdInputField(label: 'Unit of Measurement', dropdown: true ,
              textController: newAdController.unitController, obligatory: true,
              function: ()=> print("aaa"),
            ),
            NewAdInputField(label: 'Surface in square meters', dropdown: false ,
              textController: newAdController.surfaceController, obligatory: true,
              function: ()=> print("aaa"),
            ),
            NewAdInputField(label: 'Square meter price', dropdown: true ,
              textController: newAdController.unitPriceController, obligatory: true,
              function: ()=> print("aaa"),
            ),
          ],
        ),
      ),
    );
  }
}
