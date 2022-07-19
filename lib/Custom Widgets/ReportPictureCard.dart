import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class ReportPictureCard extends StatelessWidget {
  ReportPictureCard({Key? key, required this.image}) : super(key: key);

  File image;
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
