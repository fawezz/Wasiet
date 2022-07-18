import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class ReportPictureCard extends StatelessWidget {
  const ReportPictureCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.2.sh,
      width: 0.42.sw,
      decoration: BoxDecoration(
        color: HexColor("#0066B8").withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container()

    );
  }
}
