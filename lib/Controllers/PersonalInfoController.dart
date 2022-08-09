import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wasiet/models/NotificationModel.dart';


class PersonalInfoController extends GetxController{

  final nameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final countryController = TextEditingController().obs;
  final regionController = TextEditingController().obs;

  final formGlobalKey = GlobalKey < FormState >().obs;


  RxBool allFilled = false.obs;

  void verifyFields(){
    allFilled.value = formGlobalKey.value.currentState!.validate();
    print("all fields are filled: ${allFilled.isTrue}");
  }

  //image
  final ImagePicker _picker = ImagePicker();
  Rx<File>? profileImage ;

  Future selectImage(String _source) async{
    XFile? selectedImage;
    selectedImage = await _picker.pickImage(source: _source == "CAMERA"?ImageSource.camera:ImageSource.gallery);
    if(selectedImage == null){
      return;
    }
    profileImage = File(selectedImage.path).obs;
  }

  showAddPictureBottomSheet(context, whenComplete) {
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
                          child: GestureDetector(
                            onTap: () async {
                              if(await Permission.camera.request().isGranted){
                                  await selectImage("CAMERA").then((value) => whenComplete.call());

                              }else{
                                _showToast("Camera Permission Denied");
                              }
                            },
                            child: Row(children: [
                              Container(
                                height: 40.h,
                                width: 40.h,
                                decoration: BoxDecoration(
                                    color: HexColor("#EBEFF2"),
                                    borderRadius: BorderRadius.circular(40)),
                                child: Image.asset(
                                  "assets/icons/camera-2.png",
                                  scale: 3.5,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 14),
                                child: Text("Camera",
                                  style: TextStyle(
                                      color: HexColor("#0A3C5F"),
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () async {
                              if(await Permission.storage.request().isGranted){
                                  selectImage("GALLERY").then((value) => whenComplete.call());

                              }else{
                                _showToast("Storage Permission Denied");
                              }
                            },
                            child: Row(children: [
                              Container(
                                height: 40.h,
                                width: 40.h,
                                decoration: BoxDecoration(
                                    color: HexColor("#EBEFF2"),
                                    borderRadius: BorderRadius.circular(40)),
                                child: Image.asset(
                                  "assets/icons/gallery.png",
                                  scale: 3.5,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 14),
                                child: Text("Gallery",
                                  style: TextStyle(
                                      color: HexColor("#0A3C5F"),
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ]),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ]),
            );
          });
  }

  _showToast(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.redAccent.withOpacity(0.8),
        textColor: Colors.white,
        fontSize: 14.0
    );
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}



