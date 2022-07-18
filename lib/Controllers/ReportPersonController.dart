import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ReportPersonController extends GetxController with GetTickerProviderStateMixin {

  final ImagePicker _picker = ImagePicker();
  var imageFileList = [].obs;

  void selectImage() async{
    List<XFile>? selectedImages = await _picker.pickMultiImage();
    if(selectedImages == null){
      return;
    }
    else{
      imageFileList.addAll(selectedImages);
    }

  }

}