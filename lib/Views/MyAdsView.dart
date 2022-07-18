import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Controllers/MyAdsController.dart';
import '../Custom Widgets/AdElement.dart';

class MyAdsView extends StatelessWidget {
  const MyAdsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyAdsController _myAdsx = Get.put(MyAdsController());
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/logo_bar.png',
                  width: size.width * 0.18,
                  height: size.width * 0.18,
                ),
                const Spacer(),
                FittedBox(
                  child: SizedBox(
                    height: 60.sp,
                    child: IconButton(
                      icon: Image.asset(
                        'assets/icons/bell.png',
                        fit: BoxFit.fill,
                      ),
                      iconSize: 30.sp,
                      onPressed: (){
                        Get.toNamed("/notification");
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                FittedBox(
                  child: SizedBox(
                    height: 60.sp,
                    child: IconButton(
                      icon: Image.asset(
                        'assets/icons/settings.png',
                        fit: BoxFit.fill,
                      ),
                      iconSize: size.width * 0.05,
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40.sp,
                        child: Center(
                          child: Text("My ads",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              backgroundColor: Colors.white,
                              color: HexColor("#0A3C5F"),
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                             ),
                          ),
                        ),
                      ),
                      Container(
                        height: 7.sp,
                        width: size.width*0.1,
                        decoration: BoxDecoration(
                            color: HexColor("#00B4EF"),
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Container(
                    decoration: BoxDecoration(
                      color: HexColor("#707070").withOpacity(0.08),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SizedBox(
                      height: 60.sp,
                      width: 60.sp,
                      child: FittedBox(
                        child: IconButton(
                          icon: Image.asset(
                            'assets/icons/filtre.png',
                            fit: BoxFit.fill,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              children: [ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount:2,
                  itemBuilder: (context, index) {
                    return AdElement(isEditable: true,);
                  },
                  shrinkWrap: true,
              ),]
            ),
          ),
        ],
      ),
    );
  }
}
