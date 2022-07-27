import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class NewAdInputField extends StatefulWidget {
  NewAdInputField({Key? key, required this.text,
    required this.dropdown, required this.textController,
    required this.obligatory,
    this.width = 0, this.height = 0, this.label = true,
    this.numeric = false, this.multiline = false, this.prefixIcon=false,
    required this.function }) : super(key: key);

  final String text;
  final VoidCallback? function;
  final bool dropdown;
  final bool obligatory;
  final bool label;
  final bool numeric;
  final bool prefixIcon;
  final bool multiline;
  final double width;
  final double height;

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
        if(widget.label)...[
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Text(
                widget.obligatory? '*${widget.text}' : widget.text,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
        SizedBox(
          height: widget.height==0?0.0818.sh : widget.height,
          width: widget.width==0? 0.88.sw : widget.width,
          child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: BoxDecoration(
                  border: widget.textController.value.text.isEmpty? null : Border.all(
                    color: HexColor("#00B4EF"),
                      width: 2
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: FocusScope(
                  onFocusChange: (value){
                    setState(() {});
                    },
                  child: TextField(
                    maxLines: widget.multiline? 8 : 1,
                    minLines: widget.multiline? 6 : 1,
                    onEditingComplete: (){setState(() {});},
                    controller: widget.textController.value,
                    readOnly: widget.dropdown,
                    keyboardType: widget.numeric ? TextInputType.number:null,
                    decoration: InputDecoration(
                      hintText: widget.text,
                      filled: widget.textController.value.text.isEmpty? true : false,
                      fillColor: HexColor("#F2F2F2"),
                      prefix: widget.prefixIcon==true?
                      Container(
                        margin: EdgeInsets.only(right: 8),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                          child: Image.asset("assets/icons/x-white.png", scale: 3,)
                      ) :null,
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
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
                    ),
                    style: TextStyle(
                        height: widget.multiline? 1.3 : 0.8,
                        decoration: TextDecoration.none,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp),
                    onTap: widget.function,
                    onChanged: null,
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
