import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wasiet/Custom_widgets/NewAdInputField.dart';

import '../../Controllers/PersonalInfoController.dart';

class PersonalInfoView extends StatelessWidget {
  const PersonalInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersonalInfoController controller = Get.put(PersonalInfoController());
    final fieldHeight = 0.082.sh;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leadingWidth: 100.w,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Image.asset(
                "assets/icons/arrowBack.png",
                height: 27.h,
                width: 27.w,
                fit: BoxFit.fill,
              )),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 14.0),
            child: SizedBox(
              height: 40.sp,
              child: Center(
                child: Text(
                  "Personal Information",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    backgroundColor: Colors.white,
                    color: HexColor("#0A3C5F"),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              0.01.sh.verticalSpace,
              Center(
                child: StatefulBuilder(
                  builder: (BuildContext context, void Function(void Function()) setState) {
                    return Stack(
                      children: [
                        SizedBox(
                          height: Get.width * 0.25.w,
                          width: Get.width * 0.25.w,
                          child: CircleAvatar(
                            radius: Get.width * 0.116,
                            backgroundColor: HexColor("#00B4EF"),
                             backgroundImage:
                             controller.profileImage != null?
                            Image.file(
                              controller.profileImage!.value,
                              height:50,
                              width:50 ,
                            ).image:null,
                            child: controller.profileImage == null ?Image.asset(
                              "assets/icons/user-white.png",
                              height: 55.h,
                              width: 55.w,
                            ): null,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: GestureDetector(
                            onTap: (){
                              controller.showAddPictureBottomSheet(context, (){setState((){});});
                            },
                            child: Container(
                              height: Get.width * 0.0966,
                              width: Get.width * 0.0966,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              padding: const EdgeInsets.all(2),
                              child: CircleAvatar(
                                radius: Get.width * 0.4347,
                                backgroundColor: HexColor("#E9E9E9"),
                                child: Image.asset(
                                  "assets/icons/camera.png",
                                  scale: 3.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },

                ),
              ),
              0.04.sh.verticalSpace,
              Form(
                key: controller.formGlobalKey.value,
                child: Column(
                  children: [
                    NewAdInputField(
                      height: fieldHeight,
                      text: "Name & lastname",
                      dropdown: false,
                      textController: controller.nameController,
                      obligatory: true,
                      callValidator: ()=>controller.verifyFields(),
                    ),
                    16.h.verticalSpace,
                    NewAdInputField(
                      height: fieldHeight,
                      text: "Email",
                      dropdown: false,
                      textController: controller.emailController,
                      obligatory: false,
                      callValidator: ()=>controller.verifyFields(),
                    ),
                    16.h.verticalSpace,
                    NewAdInputField(
                      height: fieldHeight,
                      text: "Phone Number",
                      numeric: true,
                      dropdown: false,
                      textController: controller.phoneController,
                      obligatory: false,
                      callValidator: ()=>controller.verifyFields(),
                    ),
                    16.h.verticalSpace,
                    NewAdInputField(
                      height: fieldHeight,
                      text: "Country",
                      dropdown: true,
                      textController: controller.countryController,
                      obligatory: false,
                      callValidator: ()=>controller.verifyFields(),
                    ),
                    16.h.verticalSpace,
                    NewAdInputField(
                      height: fieldHeight,
                      text: "Region",
                      dropdown: true,
                      textController: controller.regionController,
                      obligatory: false,
                      callValidator: () {
                        print(controller.formGlobalKey);
                            controller.verifyFields();
                      },
                    ),
                  ],
                ),
              ),

              16.h.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h),
                child: Obx(
                  () => Container(
                      width: Get.width * 0.88,
                      height: Get.height * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: controller.allFilled.isTrue ? [HexColor("#0066B8"), HexColor("#00B2EE"),] // blue
                                :
                           [HexColor("#9E9E9E"), HexColor("#D2D2D2"),]  //grey
                            ),
                      ),
                      child: Obx(
                        () => MaterialButton(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: const StadiumBorder(),
                          onPressed: controller.allFilled.isTrue
                              ? () => Get.toNamed("/personalInfo")
                              : null,
                          child: Text(
                            'Save',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
