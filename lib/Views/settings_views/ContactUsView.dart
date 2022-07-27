import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wasiet/Controllers/ContactUsController.dart';
import 'package:wasiet/Custom%20Widgets/ButtonBlueGradiant.dart';
import 'package:wasiet/Custom%20Widgets/NewAdInputField.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ContactUsController controller = Get.put(ContactUsController());
    final blueBoldStyle = TextStyle(
    color: HexColor("#0066B8"),
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    );

    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leadingWidth: 100,
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
                    fit: BoxFit.fill,
                  )),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 14.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 40.sp,
                      child: Center(
                        child: Text("About the application",
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
                    Container(
                      height: 6.sp,
                      width: Get.width * 0.1,
                      decoration: BoxDecoration(
                          color: HexColor("#00B4EF"),
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ],
                ),
              ),
            ],
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(24.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.h.verticalSpace,
                  Text("Via social media",
                    style: blueBoldStyle,
                  ),
                  16.h.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: null,
                        child: Image.asset("assets/icons/facebook.png",
                          height: 0.27.sw,
                          width: 0.20.sw,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Image.asset("assets/icons/twitter.png",
                        height: 0.27.sw,
                        width: 0.20.sw,
                        fit: BoxFit.fitHeight,
                      ),
                      Image.asset("assets/icons/instagram.png",
                        height: 0.27.sw,
                        width: 0.20.sw,
                        fit: BoxFit.fitHeight,
                      ),
                      Image.asset("assets/icons/whatsapp.png",
                        height: 0.27.sw,
                        width: 0.20.sw,
                        fit: BoxFit.fitHeight,
                      ),
                    ],
                  ),
                  Text("Via email",
                    style: blueBoldStyle,
                  ),
                  8.h.verticalSpace,
                  NewAdInputField(text: "Name & last name", dropdown: false,
                      textController: controller.nameController, obligatory: true,
                      function: null,
                  ),
                  NewAdInputField(text: "Email", dropdown: false,
                    textController: controller.emailController, obligatory: true,
                    function: null,
                  ),
                  NewAdInputField(text: "Phone Number", dropdown: false,
                    textController: controller.phoneController, obligatory: true,
                    function: null,
                  ),
                  NewAdInputField(text: "Subject", dropdown: false,
                    textController: controller.subjectController, obligatory: true,
                    function: null,
                  ),
                  NewAdInputField(text: "Message", dropdown: false,
                    textController: controller.messageController, obligatory: true,
                    multiline: true,
                    function: null,
                  ),
                  ButtonBlueGradiant(text: "Send", function: (){}),
                ],
              ),
            ),
          ),
        )
    );
  }
}
