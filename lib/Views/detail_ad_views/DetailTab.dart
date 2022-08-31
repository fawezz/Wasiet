import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:wasiet/Controllers/DetailAdController.dart';
import 'package:wasiet/Custom_widgets/ButtonOutline.dart';
import 'package:wasiet/Custom_widgets/TechnicalInfoField.dart';

class DetailTab extends StatelessWidget {
  const DetailTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DetailAdController controller = Get.find();
    var formatter = NumberFormat('#,###,###.00');
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(top:16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${formatter.format(controller.post!.totalPrice)} Rial",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                color: HexColor("#0066B8"),
              ),
            ),
            Row(
              children: [
                //categorie
                Padding(
                  padding: const EdgeInsets.only(right: 8.5),
                  child: Container(
                    //test which color
                    height: Get.height * 0.03,
                    width: Get.width * 0.13,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: (() {
                        switch(controller.post!.category) {
                          case "rent": {
                            return HexColor("#00B4EF");
                          }
                          case "sell": {
                            return HexColor("#FF4B70");
                          }
                          case "exchange": {
                            return HexColor("#7951FF");
                          }
                          default: {
                            return HexColor("#00B4EF");
                          }
                        }
                      }()),
                      borderRadius: BorderRadius.circular(45),
                    ),
                    //color: ,
                    child: Text(
                      controller.post!.category,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  "Ad number: ${controller.post!.number}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.normal),
                ),
                16.w.horizontalSpace,
                SizedBox(
                  height: 15.sp,
                  width: 15.sp,
                  child: Image.asset(
                    "assets/icons/clock.png",
                    fit: BoxFit.contain,
                  ),
                ),
                6.w.horizontalSpace,
                Text(
                  controller.post!.date,
                  style: TextStyle(
                      fontFamily: "Roboto",
                      color: Colors.black,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
            5.h.verticalSpace,
            Text(
              controller.post!.title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold),
            ),
            5.h.verticalSpace,
            //RATING
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4.0),
                  child: SizedBox(
                    height: 16.sp,
                    width: 16.sp,
                    child: Image.asset(
                      "assets/icons/star.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Text(
                  controller.post!.avgRating.toString(),
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
                4.sp.horizontalSpace,
                //number of raters
                Text(
                  "(${controller.post!.ratingNumber})",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.normal,
                    fontSize: 14.sp,
                  ),
                )
              ],
            ),
            5.h.verticalSpace,
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4.0),
                  child: SizedBox(
                    height: 16.sp,
                    width: 16.sp,
                    child: Image.asset(
                      "assets/icons/gps.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Text(
                  "${controller.post!.country} - ${controller.post!.city}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
            30.h.verticalSpace,
            Text(
              "Technical card",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold),
            ),
            TechnicalInfoField(title: 'Estate type', value: controller.post!.type, isColored: true),
            TechnicalInfoField(title: 'Area', value: "${controller.post!.surface} m", isColored: false),
            TechnicalInfoField(title: 'meter squared price', value: '${controller.post!.totalPrice} Rial', isColored: true),
            TechnicalInfoField(title: 'number of rooms', value:  controller.post!.rooms.toString(), isColored: false),
            TechnicalInfoField(title: 'bathrooms', value: controller.post!.bathrooms.toString(), isColored: true),
            TechnicalInfoField(title: 'Number of living rooms', value: controller.post!.livingrooms.toString(), isColored: false),
            TechnicalInfoField(title: 'Age of the Estate', value: '${controller.post!.age} (y)', isColored: true),
            24.h.verticalSpace,
            Text(
              "Description",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              controller.post!.description,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal),
              maxLines: 10,
            ),
            24.h.verticalSpace,
            ButtonOutline(
                text: "Report this Ad",
                width: 0.9.sw,
                function: () => Get.toNamed("/reportPerson"))
          ],
        ),
      ),
    );
  }
}
