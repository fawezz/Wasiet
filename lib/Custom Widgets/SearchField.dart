import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class SearchField extends StatefulWidget {
  SearchField({Key? key, required this.searchController}) : super(key: key);

  Rx<TextEditingController> searchController;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  void initState() {
    widget.searchController.value.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: Container(
          width: Get.width * 0.884,
          height: Get.width * 0.13,
          decoration: BoxDecoration(
            border: widget.searchController.value.text.isEmpty
                ? null
                : Border.all(color: HexColor("#00B4EF"), width: 3),
            borderRadius: BorderRadius.circular(25),
          ),
          child: TextField(
            controller: widget.searchController.value,
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              hintText: "search for something",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: widget.searchController.value.text.isEmpty
                  ? HexColor("#F2F2F2")
                  : Colors.white,
              prefixIcon: Image.asset('assets/icons/search.png'),
            ),
          ),
        ));
  }
}
