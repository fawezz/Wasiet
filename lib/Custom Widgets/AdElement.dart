import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class AdElement extends StatelessWidget {
  const AdElement({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 4, right: 4),
      child: GestureDetector(
        onTap: ()=>{print("a")},
        child: Container(
          color: Colors.transparent,
          height: size.height * 0.19,
          width: size.width *0.9,
          child: FittedBox(
            child: Row(
              children: [
                Container(
                  child: Stack(
                    children: [
                      Container(  //image
                        height: size.height*0.18,
                        width: size.height*0.18,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: Image.asset("assets/icons/sale.jpg",).image,
                            )
                          ),
                      ),
                      Positioned(
                        left: size.width*0.021,
                        bottom: size.width*0.021,
                        child: SizedBox(
                          width: size.width*0.1,
                          height: size.width*0.1,
                          child: GestureDetector(
                            onTap: ()=>{print("c")},
                            child: Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40)
                              ),
                              child: CircleAvatar(
                                child: Image.asset("assets/icons/user.png"),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned( ///////////////////edit button
                        left: size.width*0.021,
                        bottom: size.width*0.15,
                        child: SizedBox(
                          width: size.width*0.1,
                          height: size.width*0.1,
                          child: GestureDetector(
                            onTap: ()=>{print("c")},
                            child: Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(40)
                              ),
                              child: CircleAvatar(
                                child: IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: (){},
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  child: FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: size.width*0.6,
                            child: Row(
                              children: [
                                //categorie
                                Padding(
                                  padding: const EdgeInsets.only(right:10),
                                  child: Container(
                                    //test which color
                                    height: size.width*0.07,
                                    width: size.width*0.12,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: HexColor("#00B4EF"),
                                      borderRadius: BorderRadius.circular(45),
                                    ),
                                    //color: ,
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Text("Rent",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                  // if liked
                                SizedBox(
                                  height: 28.sp,
                                  child: Image.asset("assets/icons/filledHeart.png",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                   //else
                                //Image.asset("assets/icons/outlineHeart.png"),
                                const Spacer(),
                                //star
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                  child: SizedBox(
                                    height: 28.sp,
                                    child: Image.asset("assets/icons/star.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                //rating
                                Text("4.5",
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                    fontSize: 18.sp,
                                  ),
                                ),
                                //number of raters
                                Text("(12)",
                                  style: TextStyle(fontWeight: FontWeight.normal,
                                    fontSize: 16.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Text("5 floors villa",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("20-07-2021",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: HexColor("#999999")
                            ),
                          ),
                          FittedBox(
                            child: Text("Al Bukayriyah - Al Bukayriyah",
                              style: TextStyle(
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                          Text(r"150,000$",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              color: HexColor("#0066B8"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
