import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasiet/app/Constants.dart';

class ConversationListItem extends StatelessWidget {

  String name;
  String messageText;
  String imageUrl;
  DateTime time;
  bool isMessageRead = false;
  VoidCallback onClickFunction;
  ConversationListItem({required this.name,required this.messageText,required this.imageUrl,required this.time,required this.onClickFunction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClickFunction,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                    maxRadius: 30,
                  ),
                  16.w.horizontalSpace,
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(name, style: TextStyle(fontSize: 16.sp),),
                          6.h.verticalSpace,
                          Text(messageText,style: TextStyle(fontSize: 13.sp,color: Colors.grey.shade600,
                              fontWeight: isMessageRead?FontWeight.bold:FontWeight.normal),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            DateTime.now().day != time.day? //is the last message of the conversation today or an older day
            //if older than today then is it less than a week show name of day else show month and date
            (Text(
              DateTime.now().difference(time)<const Duration(days: 7) ?
              cWeekDays.elementAt(time.weekday-1):
              "${cMonths.elementAt(time.month)} ${time.day}", // if older then show the name of the weekday
              style: TextStyle(fontSize: 12.sp,fontWeight: isMessageRead?FontWeight.bold:FontWeight.normal),)):
            //today then show time //if minutes are less than 10 then add 0 before the number of minutes
            Text("${time.hour}:${time.minute > 9? time.minute.toString(): "0${time.minute}"}",
              style: TextStyle(fontSize: 12.sp,fontWeight: isMessageRead?FontWeight.bold:FontWeight.normal),),

          ],
        ),
      ),
    );
  }
}
