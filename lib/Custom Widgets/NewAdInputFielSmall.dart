import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class NewAdInputFieldSmall extends StatefulWidget {
  const NewAdInputFieldSmall({Key? key, required this.label,
    required this.textController,
    required this.function,
    this.dropdown = false, this.numeric = false,
    this.width = 0, this.height = 0, this.prefixIcon=false}) : super(key: key);

  final String label;
  final VoidCallback? function;
  final bool dropdown;
  final bool prefixIcon;
  final bool numeric;
  final double? width;
  final double? height;

  final Rx<TextEditingController> textController;

  @override
  State<NewAdInputFieldSmall> createState() => _NewAdInputFieldSmallState();
}

class _NewAdInputFieldSmallState extends State<NewAdInputFieldSmall> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height==0?0.0818.sh : widget.height,
          width: widget.width==0? 0.42.sw : widget.width,
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
                      keyboardType: widget.numeric == true? TextInputType.number:null,
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
      ],
    );
  }
}
