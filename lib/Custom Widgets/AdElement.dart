import 'package:flutter/material.dart';

class AdElement extends StatelessWidget {
  const AdElement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: Stack(
              children: [
                Container(  //image
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    ),
                ),
                FloatingActionButton(
                  //child: image,

                    onPressed: null)
              ],
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  //categorie
                  Container(
                    height: 20,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                    ),
                    //color: ,
                    child: Text("Rent",
                    style: TextStyle(),
                    ),
                  ),
                    // if liked
                  Image.asset("assets/icons/filledHeart.png"),
                     //else
                  Image.asset("assets/icons/outlineHeart.png"),
                  Spacer(),
                  //star
                  Image.asset("assets/icons/star.png"),
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
              Text("5 floors villa",
              style: TextStyle(),
              ),
              Text("20-07-2021",
                style: TextStyle(),
              ),
              Text("location",
                style: TextStyle(),
              ),
              Text("PRICE",
                style: TextStyle(),
              ),
            ],
          )

        ],
      ),
    );
  }
}
