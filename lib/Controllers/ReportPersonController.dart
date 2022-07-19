import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ReportPersonController extends GetxController with GetTickerProviderStateMixin {

  final ImagePicker _picker = ImagePicker();
  var imageFileList = [].obs;

  void selectImage() async{
    List<XFile>? selectedImages = await _picker.pickMultiImage();
    print("aaaa" + selectedImages.toString());
    if(selectedImages == null){
      return;
    }
    selectedImages.forEach((e) {
      imageFileList.add(File(e.path));
    }
    );
  }

  void sendReport() {
    // send data
    Get.offAndToNamed('/myReports');
  }

}