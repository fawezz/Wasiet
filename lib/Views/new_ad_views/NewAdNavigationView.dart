import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wasiet/Views/new_ad_views/NewAdStep0.dart';
import 'package:wasiet/Views/new_ad_views/NewAdStep1.dart';
import 'package:wasiet/Views/new_ad_views/NewAdStep2.dart';
import 'package:wasiet/Views/new_ad_views/NewAdStep4.dart';
import '../../Controllers/NewAdController.dart';
import 'NewAdStep3.dart';

class NewAdNavigationView extends StatelessWidget {
  NewAdNavigationView({Key? key}) : super(key: key);

  final double steppersHeight = 4.h ;
  final double steppersWidth = 0.05.sw;
  @override
  Widget build(BuildContext context) {
    final NewAdController newAdController = Get.put(NewAdController());

    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Positioned(
                top: 100.h,
                height: 0.75.sh,
                width: 1.sw,
                child: PageView(
                  controller: newAdController.stepController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    NewAdStep0(),
                    NewAdStep1(),
                    NewAdStep2(),
                    NewAdStep3(),
                    NewAdStep4(),
                    //step 4,
                    //step 5,
                  ],
                ),
              ),
              //TOP PART
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Create New Ad",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            backgroundColor: Colors.white,
                            color: HexColor("#0A3C5F"),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Image.asset(
                              "assets/icons/x.png",
                              fit: BoxFit.fill,
                              scale: 3.5,
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 100.w),
                    child: Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: steppersWidth,
                          height: steppersHeight,
                          decoration: BoxDecoration(
                            color: HexColor("#00B4EF"),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        Container(
                          width: steppersWidth,
                          height: steppersHeight,
                          decoration: BoxDecoration(
                            color: newAdController.stepIndex>0?HexColor("#00B4EF") : HexColor("#E5E5E5"),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        Container(
                          width: steppersWidth,
                          height: steppersHeight,
                          decoration: BoxDecoration(
                            color: newAdController.stepIndex>1?HexColor("#00B4EF") : HexColor("#E5E5E5"),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        Container(
                          width: steppersWidth,
                          height: steppersHeight,
                          decoration: BoxDecoration(
                            color: newAdController.stepIndex>2?HexColor("#00B4EF") : HexColor("#E5E5E5"),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        Container(
                          width: steppersWidth,
                          height: steppersHeight,
                          decoration: BoxDecoration(
                            color: newAdController.stepIndex>3?HexColor("#00B4EF") : HexColor("#E5E5E5"),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ],
                    ),
                    )
                  )
                ],
              ),
              //NAVBAR
              Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    width: Get.width,
                    height: 100.h,
                    padding: EdgeInsets.symmetric(horizontal: 24.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius:8.0.h,
                        ),
                      ],
                    ),
                    child: Obx(() => Row(
                      children: [
                        newAdController.stepIndex.value != 0 ?
                        SizedBox(
                          width: Get.width *0.422,
                          height: Get.height* 0.07,
                          child: ElevatedButton(
                              onPressed: () => newAdController.prevStepIndex(),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                shape: MaterialStateProperty
                                    .all(RoundedRectangleBorder(side: BorderSide(width: 2, color: HexColor("#0A3C5F")),
                                    borderRadius: BorderRadius.circular(16))),
                              ),
                              child: Text("Previous",
                                style: TextStyle(
                                  color: HexColor("#0A3C5F"),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),)),
                        ):
                        SizedBox(
                          width: Get.width *0.422,
                          height: Get.height* 0.07
                        ),
                        16.w.horizontalSpace,
                        Container(
                          width: Get.width * 0.422,
                          height: Get.height * 0.07,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              //Case newAdController.stepIndex.value fel controller fonction testi w tbadel couleur obs
                              colors: newAdController.stepIndex.value != newAdController.numberOfSteps - 1 || newAdController.imageFileList.isNotEmpty?
                              [HexColor("#0066B8"), HexColor("#00B2EE"),]: // blue
                              [HexColor("#9E9E9E"), HexColor("#D2D2D2"),]  //grey
                            ),
                          ),
                          child: MaterialButton(
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            shape: const StadiumBorder(),
                            onPressed: newAdController.stepIndex.value == newAdController.numberOfSteps - 1?
                                //test if it's the last page
                                (){ //if yes then test if there are pictures
                                  if(newAdController.imageFileList.isEmpty) //if empty do nothing
                                      {}
                                  else {
                                    //send data
                                    Get.offAllNamed('/home');
                                  }
                                }
                                :(){
                                  newAdController.nextStepIndex();
                                //print("textcontroller value is : " + newAdController.purposeController.value.text);
                                },
                            child: Text(
                              newAdController.stepIndex.value < newAdController.numberOfSteps - 1?
                              'Next':'Send',
                              style: TextStyle(color: Colors.white, fontSize: 14.sp),
                            ),
                          ),
                        ),
                      ],
                    )
                    ),
                  )
              ),
            ],
          ),
        ));
  }
}
