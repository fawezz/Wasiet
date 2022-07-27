import 'dart:io';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wasiet/Controllers/HomeNavController.dart';
import 'package:wasiet/Custom%20Widgets/ButtonOutline.dart';
import 'package:wasiet/Custom%20Widgets/CheckList.dart';
import 'package:wasiet/Custom%20Widgets/SearchField.dart';
import 'package:wasiet/app/Constants.dart';

import '../Custom Widgets/ButtonBlueGradiant.dart';
import '../Custom Widgets/RadioList.dart';


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
/*
  RxList<HexColor> colors =  [HexColor("#9E9E9E"), HexColor("#D2D2D2"),].obs;
  void updateColors(){
    switch(stepIndex.value) {
      case 0:
        if( titleController.value.text.isNotEmpty ){
          colors.value = [HexColor("#0066B8"), HexColor("#00B2EE"),];
        }else{
          colors.value = [HexColor("#9E9E9E"), HexColor("#D2D2D2"),];
        }
        break;
      case 1:
        print('one!');
        break;
      case 2:
        print('two!');
        break;
      default:
        print('choose a different number!');
    }
  }*/

  final searchController = TextEditingController().obs;

  //Step 1
  final titleController = TextEditingController().obs;
  final countryController = TextEditingController().obs;
  final regionController = TextEditingController().obs;
  final cityController = TextEditingController().obs;
  final streetController = TextEditingController().obs;
  final currencyController = TextEditingController().obs;

  //step 2
  final purposeController = TextEditingController().obs;
  final typeController = TextEditingController().obs;
  final unitController = TextEditingController().obs;
  final surfaceController = TextEditingController().obs;
  final unitPriceController = TextEditingController().obs;
  final totalPriceController = TextEditingController().obs;
      // radio buttons
  static Rx<String> purpose = purposeList.first.obs;
  static Rx<String> type = typeList.first.obs;
  //step 3
  final northController = TextEditingController().obs;
  final southController = TextEditingController().obs;
  final eastController = TextEditingController().obs;
  final westController = TextEditingController().obs;
  final detailsController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final identityController = TextEditingController().obs;
  List checkedItems = [];





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
                          onTap: () async {
                            if(await Permission.camera.request().isGranted){
                              if(imageFileList.value.length<5) {
                                selectImage("CAMERA");
                              }else{
                                _showToast("Maximum number of images reached");
                              }
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
                              if(imageFileList.value.length<5) {
                                selectImage("GALLERY");
                              }else{
                                _showToast("Maximum number of images reached");
                              }
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
    }else{
      _showToast("Maximum number of images reached");
    }
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

  //bottomSheets
  showRadioBottomSheet(context, String title,
      List<String> choicesList, Rx<String> groupValue,
      Rx<TextEditingController> textController, bool search) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Wrap(children: [
            Container(
            decoration: const BoxDecoration(
            color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
                  child: Padding(
                    padding: EdgeInsets.all(24.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(child:
                          Container(
                            height: 8.h,
                            width: 66.w,
                            decoration: BoxDecoration(
                                color: HexColor("##EBEBEB"),
                                borderRadius: BorderRadius.circular(10)
                            ),
                          )),
                        0.03.sh.verticalSpace,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(title,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: HexColor("#0A3C5F"),
                            ),
                          ),
                        ),
                        search?
                        SearchField(searchController: searchController):Container(),

                        RadioList(textList: choicesList, groupValue: groupValue),
                        ButtonBlueGradiant(text: 'Confirm',
                          function: (){
                            textController.value.text = groupValue.value;
                            Get.back();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
            ]);
        });
  }

  showCheckListBottomSheet(context, String title,
      List<String> choicesList,) {
    RxList checkedItemsTemporary = [].obs;
    checkedItemsTemporary.addAll(checkedItems);
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Wrap(children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Padding(
                  padding: EdgeInsets.all(24.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(child:
                        Container(
                          height: 8.h,
                          width: 66.w,
                          decoration: BoxDecoration(
                              color: HexColor("##EBEBEB"),
                              borderRadius: BorderRadius.circular(10)
                          ),
                        )
                      ),
                      0.03.sh.verticalSpace,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(title,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: HexColor("#0A3C5F"),
                          ),
                        ),
                      ),
                      SearchField(searchController: searchController),
                      CheckList(textList: choicesList, checkedItems: checkedItemsTemporary,),
                      ButtonBlueGradiant(text: 'Confirm',
                        function: (){
                          checkedItems = checkedItemsTemporary.value;
                          Get.back();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          );
        });
  }

  confirmCancel(context, String title, String message) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: false,
        builder: (BuildContext context) {
          return Wrap(children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))
              ),
              child: Padding(
                padding: EdgeInsets.all(24.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(child:
                      Container(
                        height: 8.h,
                        width: 66.w,
                        decoration: BoxDecoration(
                            color: HexColor("##EBEBEB"),
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    ),
                    0.03.sh.verticalSpace,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: HexColor("#0A3C5F"),
                        ),
                      ),
                    ),
                    16.h.verticalSpace,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(message,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    22.h.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonOutline(text: "No",
                          height: Get.height* 0.07,
                          width: Get.width *0.4,
                          function: () => Get.back(),
                        ),
                        16.w.horizontalSpace,
                        ButtonBlueGradiant(text: 'Yes',
                          height: Get.height* 0.07,
                          width: Get.width *0.4,
                          function: (){
                            Get.delete<HomeNavController>();
                            Get.offAllNamed("/home");
                            Get.delete<NewAdController>();
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ]);
        });
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