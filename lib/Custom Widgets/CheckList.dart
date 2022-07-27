import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class CheckList extends StatefulWidget {
  CheckList({Key? key, required this.textList, required this.checkedItems}) : super(key: key);

  final List<String> textList;
  RxList checkedItems ;
  @override
  State<CheckList> createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: [
            ...(widget.checkedItems).map((i) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: HexColor("#AD46CB").withOpacity(0.1)
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Wrap(
                      direction: Axis.horizontal,
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                                widget.checkedItems.remove(i);
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: HexColor("#AD46CB").withOpacity(0.14),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(7),
                              child: Image.asset("assets/icons/x-white.png",
                                scale: 3.7,
                              ),
                            ),
                          ),
                        ),
                        8.w.horizontalSpace,
                        Text(i,
                          style: TextStyle(
                              color: HexColor("#AD46CB"),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500
                          ),)
                      ]
                  ),
                ),
              );
            }).toList()
          ],
        ),
        ...(widget.textList).map((i) {
          bool checked = widget.checkedItems.value.contains(i);
          return GestureDetector(
            onTap: (){
              setState(() {
                if(checked) {
                  widget.checkedItems.remove(i);
                }else{
                  widget.checkedItems.add(i);
                }
              });
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
                                color: checked ? HexColor("#0066B8") :HexColor("#CCCCCC"),
                                width: checked ? 0 : 2
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: checked?HexColor("#0066B8"):Colors.transparent,
                        ),
                      child: checked?Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Image.asset("assets/icons/checkmark-white.png",
                        scale: 3.5,
                        ),
                      ):null,
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