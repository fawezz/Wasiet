import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wasiet/Controllers/NewAdController.dart';
import 'package:wasiet/Custom_widgets/NewAdInputField.dart';
import '';

class NewAdStep0 extends StatelessWidget {
  const NewAdStep0({Key? key}) : super(key: key);

  _showTypeBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Wrap(children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(child: Container(
                        height: 8,
                        width: 66,
                        decoration: BoxDecoration(
                            color: HexColor("##EBEBEB"),
                            borderRadius: BorderRadius.circular(10)
                        ),
                      )
                      ),
                      0.03.sh.verticalSpace,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: HexColor("#EBEFF2"),
                                borderRadius: BorderRadius.circular(40)),
                            child: Image.asset(
                              "assets/icons/modify.png",
                              scale: 1.5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Text("Edit",
                              style: TextStyle(
                                  color: HexColor("#0A3C5F"),
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: HexColor("#EBEFF2"),
                                borderRadius: BorderRadius.circular(40)),
                            child: Image.asset(
                              "assets/icons/delete.png",
                              scale: 1.5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Text("Delete",
                              style: TextStyle(
                                  color: HexColor("#0A3C5F"),
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ]),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          );
        });
  }


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
            NewAdInputField(text: 'Title', dropdown: false , textController: newAdController.titleController,
              obligatory: true, function: ()=> print("aaa"),),
            NewAdInputField(text: 'Country', dropdown: true , textController: newAdController.countryController,
              obligatory: true, function: ()=> print("aaa"),),
            NewAdInputField(text: 'Region', dropdown: true , textController: newAdController.regionController,
              obligatory: true, function: ()=> print("aaa"),),
            NewAdInputField(text: 'City', dropdown: true , textController: newAdController.cityController,
              obligatory: true, function: ()=> print("aaa"),),
            NewAdInputField(text: 'Street', dropdown: false , textController: newAdController.streetController,
              obligatory: true, function: ()=> print("aaa"),),
          ],
        ),
      ),
    );
  }
}
