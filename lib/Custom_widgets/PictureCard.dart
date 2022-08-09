import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class PictureCard extends StatelessWidget {
  const PictureCard({Key? key, required this.image, required this.onCancel}) : super(key: key);

  final File image;
  final VoidCallback onCancel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.22.sh,
      width: 0.42.sw,
      child: Stack(
        fit: StackFit.loose,
        children: [
          Container(
            height: 0.2.sh,
            width: 0.42.sw,
            decoration: BoxDecoration(
              color: HexColor("#0066B8").withOpacity(0.08),
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(image:
                  Image.file(
                    image,
                    fit: BoxFit.fill,
                  ).image,
                fit: BoxFit.fill,
              )
            ),
        ),
          Positioned(
            right: 0,
            top: 0,
            child: GestureDetector(
              onTap: onCancel,
              child: SizedBox(
                height: 30.w,
                width: 30.w,
                child: CircleAvatar(
                  radius: 12.5.w,
                  backgroundColor: Colors.black.withOpacity(0.4),
                  child: Image.asset("assets/icons/x-white.png",
                    scale: 3.2,
                  ),
                ),
              ),
            ),
          ),
        ]
      ),
    );
  }
}
