import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class NewAdInputField extends StatefulWidget {
  NewAdInputField({Key? key, required this.label, required this.function,
    required this.dropdown, required this.textController, required this.obligatory, this.numeric}) : super(key: key);

  final String label;
  final VoidCallback? function;
  final bool dropdown;
  final bool obligatory;
  final bool? numeric;
  Rx<TextEditingController> textController;

  @override
  State<NewAdInputField> createState() => _NewAdInputFieldState();
}

class _NewAdInputFieldState extends State<NewAdInputField> {
  //final String hint;
  /*
  @override
  void initState() {
    widget.textController.value.addListener(() {
        setState(() {});
      });
    super.initState();
  }*/
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Text(
              widget.obligatory? '*${widget.label}' : widget.label,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 0.0818.sh,
          width: 0.88.sw,
          child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: BoxDecoration(
                  border: widget.textController.value.text.isEmpty? null : Border.all(
                    color: HexColor("#00B4EF"),
                      width: 2
                  ),
                  borderRadius: BorderRadius.circular(25)
                ),
                child: FocusScope(
                  onFocusChange: (value){
                    setState(() {});
                    },
                  child: Obx(() =>  TextField(
                    onEditingComplete: (){setState(() {});},
                    controller: widget.textController.value,
                    readOnly: widget.dropdown,
                    keyboardType: widget.numeric != null? TextInputType.number:null,
                    decoration: InputDecoration(
                      hintText: widget.label,
                      filled: widget.textController.value.text.isEmpty? true : false,
                      fillColor: HexColor("#F2F2F2"),
                      hintStyle: TextStyle(
                        color: HexColor("#707070")
                      ),
                      suffixIcon: widget.dropdown?Image.asset(
                        "assets/icons/arrow-down.png",
                        scale: 3.5,
                        )
                          :null,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          borderSide: BorderSide.none),
                      /*focusedBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                          borderSide: BorderSide(
                              color: HexColor("#00B4EF"),
                              width: 3
                          )),*/
                    ),
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp),
                    onTap: widget.function,
                    onChanged: null,
                  ),
                  ),
                )
              )),
        ),
        widget.obligatory?Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(left: 0.05.sw, bottom: 8),
            child: Text(
              '*Compulsory Field',
              style: TextStyle(
                color: HexColor("#707070"),
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ):Container(),
      ],
    );
  }
}
