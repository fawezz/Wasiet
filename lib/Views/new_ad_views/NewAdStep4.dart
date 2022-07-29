import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wasiet/Controllers/NewAdController.dart';
import 'package:wasiet/Custom_widgets/PictureCard.dart';

class NewAdStep4 extends StatelessWidget {
  const NewAdStep4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewAdController newAdController = Get.find();
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.all(24.sp),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 0.05.sw, bottom: 8),
                child: Text(
                  "Add pictures",
                  style: TextStyle(
                    color: HexColor("#0A3C5F"),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 0.05.sw, bottom: 8),
                child: Text(
                  "Note: the maximum number of pictures is 5 \n"
                      "Allowed formats are: jpg,jpeg,png,bmp,gif",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    height: 1.4,
                  ),
                ),
              ),
            ),
            Obx(() => Wrap(
                spacing: 6.sp,
                runSpacing: 6.sp,
                direction: Axis.horizontal,
                children: [
                  Container(
                    height: 0.2.sh,
                    width: 0.42.sw,
                    decoration: BoxDecoration(
                      color: HexColor("#0066B8").withOpacity(0.08),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: MaterialButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: const StadiumBorder(),
                      child: Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/icons/plus-circle.png",
                            scale: 3.5,
                          )),
                      onPressed: () {
                        newAdController.showAddPictureBottomSheet(Get.context);
                      },
                    ),
                  ),
                  if(newAdController.imageFileList.isEmpty)...[
                    SizedBox(height: 0.2.sh, width: 0.4.sw,),
                  ],
                      ...(newAdController.imageFileList).map((i) {
                    return PictureCard(image: i, onCancel: (){
                        newAdController.imageFileList.remove(i);
                      },
                    );
                  }).toList()
                ]
            ),
            ),
          ],
        ),
      ),
    );
  }
}
