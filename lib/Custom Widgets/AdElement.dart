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

              ],
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  //categorie
                  //heart icon
                  //star
                  //rating
                  //number of raters
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
