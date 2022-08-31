import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasiet/Custom_widgets/AdCard.dart';

import '../models/PostModel.dart';

class PostList extends StatelessWidget {
  PostList({Key? key, required this.list}) : super(key: key);

  Iterable<PostModel> list;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp),
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return AdElement(isEditable: false, post: list.elementAt(index));
          }
      ),
    );
  }
}
