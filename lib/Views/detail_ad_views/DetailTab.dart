import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wasiet/Custom_widgets/ButtonOutline.dart';
import 'package:wasiet/Custom_widgets/TechnicalInfoField.dart';

class DetailTab extends StatelessWidget {
  const DetailTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            r"150,000 Rial",
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
                  height: Get.height * 0.028,
                  width: Get.width * 0.1014,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: HexColor("#00B4EF"),
                    borderRadius: BorderRadius.circular(45),
                  ),
                  //color: ,
                  child: Text(
                    "Rent",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                "Ad number: 19",
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
                "20-07-2021",
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
            "Villa for sale in Holy Mecca",
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
                "4.5",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
              4.sp.horizontalSpace,
              //number of raters
              Text(
                "(12)",
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
                "Elbkiriyya - Saudi Arabia",
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
          const TechnicalInfoField(title: 'Estate type', value: 'Duplex Villa', isColored: true),
          const TechnicalInfoField(title: 'Area', value: '250 m', isColored: false),
          const TechnicalInfoField(title: 'meter squared price', value: '1500 Rial', isColored: true),
          const TechnicalInfoField(title: 'number of rooms', value: '5', isColored: false),
          const TechnicalInfoField(title: 'bathrooms', value: '2', isColored: true),
          const TechnicalInfoField(title: 'Number of living rooms', value: '2', isColored: false),
          const TechnicalInfoField(title: 'Age of the Estate', value: '3(y)', isColored: true),
          24.h.verticalSpace,
          Text(
            "Description",
            style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "Lorem Ipsum has been the standard for formal text since the fifteenth century when an unknown printing press stacked a set of random letters taken from a text, to form a pamphlet as a guide or formal reference for these letters.",
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
    );
  }
}
