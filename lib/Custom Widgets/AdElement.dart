import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class AdElement extends StatelessWidget {
  const AdElement({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 8, right: 8),
      child: GestureDetector(
        onTap: ()=>{print("a")},
        child: Container(
          color: Colors.transparent,
          height: size.height * 0.19,
          width: size.width *0.9,
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
                          onTap: ()=>{print("b")},
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
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: size.width*0.52,
                      child: Row(
                        children: [
                          //categorie
                          Padding(
                            padding: const EdgeInsets.only(right:10),
                            child: Container(
                              //test which color
                              height: 30,
                              width: 60,
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: HexColor("#00B4EF"),
                                borderRadius: BorderRadius.circular(45),
                              ),
                              //color: ,
                              child: Text("Rent",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),
                              ),
                            ),
                          ),
                            // if liked
                          Image.asset("assets/icons/filledHeart.png",
                            scale: 2.5,
                          ),
                             //else
                          //Image.asset("assets/icons/outlineHeart.png"),
                          const Spacer(),
                          //star
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Image.asset("assets/icons/star.png",
                              scale: 2.5,
                            ),
                          ),
                          //rating
                          Text("4.5",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),

                          //number of raters
                          Text("(12)",
                            style: TextStyle(fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                    ),
                    Text("5 floors villa",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("20-07-2021",
                      style: TextStyle(
                        fontSize: 16,
                        color: HexColor("#999999")
                      ),
                    ),
                    Text("Al Bukayriyah - Al Bukayriyah",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(r"150,000$",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: HexColor("#0066B8"),
                      ),
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
