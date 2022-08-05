import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class OTPField extends StatelessWidget {
  const OTPField({Key? key, required this.textController, required this.first,
    required this.last, required this.callValidator }) : super(key: key);

  final Rx<TextEditingController> textController;
  final bool first;
  final bool last;
  final VoidCallback callValidator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45.w,
      child: TextFormField(
        cursorHeight: 2,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style: TextStyle(
              color: HexColor("#0066B8"),
              fontSize: 32.sp,
              fontWeight: FontWeight.bold
          ),

          controller: textController.value,
          textInputAction: TextInputAction.next,
          maxLength: 1,
          decoration: InputDecoration(
              border: InputBorder.none,
              counter: const Offstage(),
              hintText: "----",
              hintStyle: TextStyle(
                letterSpacing: -3.24,
                  fontSize: 30.sp
              ),
            errorStyle: const TextStyle(height: 0),
          ),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ],
          onChanged: (value) {
            callValidator.call();
            if (value.isNotEmpty && !last) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && !first) {
              FocusScope.of(context).previousFocus();
            }
          },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '' ;
          }
          return null;
        },
      ),
    );
  }
}
