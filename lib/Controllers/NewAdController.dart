import 'dart:io';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';


class NewAdController extends GetxController with GetSingleTickerProviderStateMixin {


  final stepController = PageController(initialPage: 0);
  var stepIndex = 0 .obs;
  final numberOfSteps = 5;

  void nextStepIndex() {
    //print(stepIndex);
    if(stepIndex<4){
      stepIndex.value = stepIndex.value+1;
      stepController.animateToPage(stepIndex.value, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }
  void prevStepIndex() {
    if(stepIndex>0){
      stepIndex.value = stepIndex.value-1;
      stepController.animateToPage(stepIndex.value, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }
  //Step 1
  final titleController = TextEditingController().obs;
  final countryController = TextEditingController().obs;
  final regionController = TextEditingController().obs;
  final cityController = TextEditingController().obs;
  final streetController = TextEditingController().obs;
  //step 2
  final purposeController = TextEditingController().obs;
  final typeController = TextEditingController().obs;
  final unitController = TextEditingController().obs;
  final surfaceController = TextEditingController().obs;
  final unitPriceController = TextEditingController().obs;
  final totalPriceController = TextEditingController().obs;
  //step 3
  final northController = TextEditingController().obs;
  final southController = TextEditingController().obs;
  final eastController = TextEditingController().obs;
  final westController = TextEditingController().obs;
  final detailsController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final identityController = TextEditingController().obs;


  //step 5
  final ImagePicker _picker = ImagePicker();
  var imageFileList = [].obs;



  void selectImage(String _source) async{
    XFile? selectedImage;
    selectedImage = await _picker.pickImage(source: _source == "CAMERA"?ImageSource.camera:ImageSource.gallery);
    if(selectedImage == null){
      return;
    }
    imageFileList.add(File(selectedImage.path));
  }

  showAddPictureBottomSheet(context) {
    if(imageFileList.value.length<5) {
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
                          onTap: (){
                            if(imageFileList.value.length<5) {
                              selectImage("CAMERA");
                            }else{
                              _showMaxPicturesToast();
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
                          onTap: (){
                            if(imageFileList.value.length<5) {
                              selectImage("Gallery");
                            }else{
                              _showMaxPicturesToast();
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
    }else{
      _showMaxPicturesToast();
    }
  }

  _showMaxPicturesToast(){
    Fluttertoast.showToast(
        msg: "Maximum number of images reached",
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