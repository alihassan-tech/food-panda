

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodpanda_app/constats/color.dart';
import 'package:foodpanda_app/constats/constants.dart';
import 'package:foodpanda_app/dashboard/detail_screen.dart';

class RestaurentScreen extends StatefulWidget {
  final String name, image, remainingTime,  subTitle, ratting, deliveryTime, totalRating, deliveryPrice;
  const RestaurentScreen({Key? key, required this.name, required this.image, required this.remainingTime, required this.subTitle, required this.ratting, required this.deliveryTime, required this.deliveryPrice, required this.totalRating});

  @override
  State<RestaurentScreen> createState() => _RestaurentScreenState();
}

class _RestaurentScreenState extends State<RestaurentScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1 ;
    final width = MediaQuery.of(context).size.width * 1 ;
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(name: widget.name, image: widget.image,)));
        },
        child: Container(
          height: height * 0.3,
          width: width * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      fit: BoxFit.cover,
                      height: height * 0.19,
                      image: AssetImage(widget.image),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Container(
                      decoration: BoxDecoration(
                        color: MyColors.primaryColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, left: 5, right: 10, bottom: 7),
                        child: Text('Flash 20% off', style: TextStyle(color: Colors.white, fontSize: 10, fontFamily: Bold),),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xfffffcff),
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            child: Text(widget.remainingTime,
                              style: TextStyle(color: blackColor, fontSize: 12, fontFamily: Bold),),
                          )
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.name, style: TextStyle(color: Color(0xff323232), fontSize: 14, fontFamily: Bold),),

                  Row(
                    children: [
                      RatingBarIndicator(
                        rating: 2.75,
                        itemBuilder: (context, index) => Icon(Icons.star, color: Colors.amber,),
                        itemCount: 1,
                        itemSize: 18,
                      ),

                      Text(" "+widget.ratting, style: TextStyle(color: Color(0xff323232), fontSize: 12, fontFamily: Bold),),
                      Text(" ("+widget.totalRating+")", style: TextStyle(color: Color(0xffa9a9a9), fontSize: 12, fontFamily: Light),),
                    ],
                  )
                ],
              ),
              SizedBox(height: 6,),
              Text(r"$ . "+widget.subTitle, style: TextStyle(color: Color(0xff707070),
              fontSize: 12, fontFamily: Regular),),
              SizedBox(height: 3,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.directions_bike, size: 14, color: MyColors.primaryColor,),
                  Text(r"  Rs  "+widget.deliveryPrice, style: TextStyle(color: Color(0xff707070), fontSize: 12, fontFamily: Regular),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
