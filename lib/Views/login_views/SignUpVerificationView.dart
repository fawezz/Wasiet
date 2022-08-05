import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wasiet/Controllers/SignUpController.dart';
import 'package:wasiet/Controllers/SignUpVerificationController.dart';
import 'package:wasiet/Custom_widgets/OTPField.dart';

class SignUpVerificationView extends StatelessWidget {
  const SignUpVerificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpVerificationController controller = Get.put(SignUpVerificationController());
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
              padding: const EdgeInsets.only(top:8.0, right: 14.0),
              child: SizedBox(
                height: 40.sp,
                child: Center(
                  child: Text("Phone Number Verification",
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
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
          child: Column(
            children: [
              48.h.verticalSpace,
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("a message with the code was sent to your phone number",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  6.h.verticalSpace,
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("0354664546546",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  20.h.verticalSpace,
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("Verification Code",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: HexColor("#0066B8"),
                      ),
                    ),
                  ),
                  8.h.verticalSpace,
                  Container(
                    height: 0.1.sh,
                    width: 0.884.sw,
                    decoration: BoxDecoration(
                      color: HexColor("#F2F2F2"),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Form(
                      key: controller.otpFormGlobalKey.value,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          OTPField(textController: controller.firstController, first: true, last: false,
                            callValidator: () {
                              controller.verifyAllFilled();
                            },
                          ),
                          OTPField(textController: controller.secondController, first: false, last: false,
                            callValidator: () {
                              controller.verifyAllFilled();
                            },
                          ),
                          OTPField(textController: controller.thirdController, first: false, last: false,
                            callValidator: () {
                              controller.verifyAllFilled();
                            },
                          ),
                          OTPField(textController: controller.forthController, first: false, last: true,
                            callValidator: () {
                              controller.verifyAllFilled();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  24.h.verticalSpace,
                  Align(
                    alignment: Alignment.topLeft,
                    child: CountdownTimer(
                      controller: controller.timerController,
                      widgetBuilder: (_, CurrentRemainingTime? time) {
                        if (time == null) {
                          return RichText(
                            text: TextSpan(
                                text: 'Did not receive a message ?',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: <TextSpan>[
                                  TextSpan(text: ' Send again',
                                      style: TextStyle(
                                          color: HexColor("#0066B8"), fontSize: 12.sp, fontWeight: FontWeight.bold),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          print('send message again');
                                        }
                                  )
                                ]
                            ),
                          );
                        }
                        return Text(time.sec!<10?
                        'Send the code again in 00:0${time.sec}.': 'Send the code again in 00:${time.sec}.',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const Spacer(),
                 Obx(() => Container(
                    width: Get.width * 0.88,
                    height: Get.height * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: controller.allFilled.isTrue?
                          [HexColor("#0066B8"), HexColor("#00B2EE"),]: // blue
                          [HexColor("#9E9E9E"), HexColor("#D2D2D2"),]  //grey
                      ),
                    ),
                    child: Obx(() =>  MaterialButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: const StadiumBorder(),
                      onPressed: controller.allFilled.isTrue?
                          () => Get.toNamed("/personalInfo") : null,
                      child: Text(
                        'Continue',
                        style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),
                    ),)
                ),
                 ),
            ],
          ),
        ),
      ),
    );
  }
}
