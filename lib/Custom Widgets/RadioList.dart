import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Controllers/NewAdController.dart';
import '../app/Constants.dart';

class RadioList extends StatefulWidget {
  RadioList({Key? key, required this.textList, required this.groupValue}) : super(key: key);

  final List<String> textList;
  Rx<String> groupValue;
  @override
  State<RadioList> createState() => _RadioListState();

}

class _RadioListState extends State<RadioList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...(widget.textList).map((i) {
          bool selected = i == widget.groupValue.value;
          return GestureDetector(
            onTap: (){
              setState(() {
                widget.groupValue.value = i;
              });
              print(widget.groupValue.value);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.w),
              child: Row(
                children: [
                  Container(
                    height: 0.0772.sw,
                    width: 0.0772.sw,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: selected ? HexColor("#0066B8") :HexColor("#CCCCCC"),
                          width: selected ? 9.w : 2
                      ),
                    color: Colors.transparent,
                    shape: BoxShape.circle)
                ),
                  8.w.horizontalSpace,
                  Text(i,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal
                  ),)
                ]
              ),
            ),
          );
        }).toList()
      ],
    );
  }
}


/*return ListTile(
            title: Text(i),
            leading: Radio<String>(
              fillColor: MaterialStateColor.resolveWith((states) => Colors.blue),
              focusColor: MaterialStateColor.resolveWith((states) => Colors.green),
              value: i,
              groupValue: widget.groupValue.value,
              onChanged: (v) {
                setState(() {
                  widget.groupValue.value = v.toString();
                });
                print(widget.groupValue.value);
              },
            ),
          );*/