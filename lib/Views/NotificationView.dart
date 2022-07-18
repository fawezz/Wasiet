import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wasiet/Controllers/NotificationController.dart';

import '../models/NotificationModel.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NotificationController _xController = Get.put(NotificationController());

    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leadingWidth: 100,
            automaticallyImplyLeading: false,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Image.asset(
                    "assets/icons/arrowBack.png",
                    fit: BoxFit.fill,
                  )),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(top:8.0, right: 14.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 40.sp,
                      child: Center(
                        child: Text("Notifications",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            backgroundColor: Colors.white,
                            color: HexColor("#0A3C5F"),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 6.sp,
                      width: Get.width*0.1,
                      decoration: BoxDecoration(
                          color: HexColor("#00B4EF"),
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ],
                ),
              ),
            ],
            backgroundColor: Colors.white,
          ),
          body: Center(
            child: Padding(
              padding: EdgeInsets.only(top:16.sp, left: 16.sp, right: 16.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: Get.width *0.8816,
                    height: Get.height* 0.0675,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          shape: MaterialStateProperty
                              .all(RoundedRectangleBorder(side: BorderSide(width: 2, color: HexColor("#0A3C5F")),
                              borderRadius: BorderRadius.circular(16))),
                        ),
                        child: Text("Delete all notifications",
                          style: TextStyle(
                            color: HexColor("#0A3C5F"),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 24.sp, left: 8, right: 8),
                    child: SizedBox(
                        height: Get.height * 0.78,
                        child:
                        ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: _xController.list.length,
                        itemBuilder: (context, index) {
                          NotificationModel notif = _xController.list.elementAt(index);
                          return Column(
                            children: [
                              Text("${_xController.fWeekDays.elementAt(notif.date.weekday-1)} ${notif.date.day} "
                                  "${_xController.fMonths.elementAt(notif.date.month-1)}."
                                  " ${notif.date.hour<10? "0${notif.date.hour}" :notif.date.hour }:"
                                  "${notif.date.minute<10? "0${notif.date.minute}": notif.date.minute}",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: HexColor("#ABABAC"),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 8.sp, bottom: 16.sp),
                                padding: EdgeInsets.all(11.sp),
                                decoration: BoxDecoration(
                                  color: HexColor("#0066B8").withOpacity(0.06),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0, bottom: 2),
                                      child: Text(notif.title,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        fontSize: 14.sp,
                                        ),
                                      ),
                                    ),
                                Text(notif.body,
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                ]
                                )
                              ),
                            ],
                          );
                        }
                      ,)
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
