import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wasiet/Controllers/SignUpController.dart';
import 'package:wasiet/Custom_widgets/NewAdInputField.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.put(SignUpController());
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
                    controller.dispose();
                  },
                  icon: Image.asset(
                    "assets/icons/x.png",
                    fit: BoxFit.fill,
                    height: 18.w,
                    width: 18.w,
                  )),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(top:8.0, right: 14.0),
                child: SizedBox(
                  height: 40.sp,
                  child: Center(
                    child: Text("Your Phone Number",
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
            padding: EdgeInsets.all(24.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatefulBuilder(
                  builder: (BuildContext context, void Function(void Function()) setState) {
                    return NewAdInputField(text: "Please enter your phone number", dropdown: false,
                        textController: controller.phoneController, obligatory: false,
                        prefixIcon: "assets/icons/phone-black.png", numeric: true, suffix: true,
                        function: null);
                  },

                ),
                24.h.verticalSpace,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Image.asset("assets/icons/info_icon.png",
                        height: 22.h,
                        width: 22.w,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'We only use your phone to identify your identity, and it will not be shared with anyone',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: 'By clicking this button, you agree to our',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                TextSpan(text: ' Terms of Use and Privacy Policy',
                                    style: TextStyle(
                                        color: HexColor("#0066B8"), fontSize: 12.sp, fontWeight: FontWeight.bold),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Get.toNamed("/terms");
                                      }
                                )
                              ]
                          ),
                        ),
                      ),]
                    ),
                    22.h.verticalSpace,
                    ValueListenableBuilder(
                        valueListenable: controller.phoneController.value,
                        builder: (context, TextEditingValue value, __){
                        return Container(
                      width: Get.width * 0.88,
                      height: Get.height * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: controller.phoneController.value.text.isNotEmpty && controller.phoneController.value.text.length == 8?
                            [HexColor("#0066B8"), HexColor("#00B2EE"),]: // blue
                            [HexColor("#9E9E9E"), HexColor("#D2D2D2"),]  //grey
                        ),
                      ),
                      child: MaterialButton(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: const StadiumBorder(),
                        onPressed: controller.phoneController.value.text.isNotEmpty && controller.phoneController.value.text.length == 8?
                        () => Get.toNamed("/signUpVerification") : null,
                        child: Text(
                          'Continue',
                          style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                        }),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}
