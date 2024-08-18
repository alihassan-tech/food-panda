import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda_app/components/restaurent.dart';
import 'package:foodpanda_app/constats/color.dart';
import 'package:foodpanda_app/constats/constants.dart';
import 'package:foodpanda_app/model/exclusive_panda_model/exclusive_Helper.dart';
import 'package:foodpanda_app/model/exclusive_panda_model/exclusive_item_model.dart';
import 'package:foodpanda_app/pandaPickHelper/pandaPickHelper.dart';
import 'package:foodpanda_app/pandaPickHelper/pandaPickItemModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1 ;
    final width = MediaQuery.of(context).size.width * 1 ;
    return Scaffold(
      appBar: AppBar(
        title: Text('Jacobabad City'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: CupertinoTextField(
                    padding: const EdgeInsets.symmetric(
                        vertical: 13, horizontal: 10),
                    placeholder: 'Search for shop & restaurants',
                    prefix: const Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Icon(
                        Icons.search,
                        color: Color(0xff7b7b7b),
                      ),
                    ),
                    style: TextStyle(color: Color(0xff707070), fontSize: 12, fontFamily: Regular),
                    decoration: BoxDecoration(
                        color: Color(0xff707070),
                        borderRadius: BorderRadius.circular(50.0)),
                  ),
                ),
                SizedBox(width: 10,),
                Icon(Icons.filter_list_outlined, color: MyColors.primaryColor,)
              ],
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.shopping_bag_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child: Container(
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('pandapick', style: TextStyle(color: blackColor, fontSize: 15, fontFamily: Bold),),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: height * .278,
                    child: ListView.builder(
                        itemCount: PandaPickHelper.itemCount,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {

                          PandaPickItemModel model = PandaPickHelper.getStatusItem(index);
                          return RestaurentScreen(
                            name: model.name,
                            image: model.image,
                            remainingTime: model.remaingTime,
                            totalRating: model.totalRating,
                            subTitle: model.subTitle,
                            ratting: model.ratting,
                            deliveryTime: model.remaingTime,
                            deliveryPrice: model.deliveryPrice,
                          );
                        }),
                  ),
                ),

                Text('Panda exclusives', style: TextStyle(color: Color(0xff323232), fontSize: 15, fontFamily: Bold),),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: height * .278,
                    child: ListView.builder(
                        itemCount: ExclusiveHelper.itemCount,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          ExclusiveItemModel model = ExclusiveHelper.getStatusItem(index);
                          return RestaurentScreen(
                            name: model.name,
                            image: model.image,
                            remainingTime: model.remainingTime,
                            totalRating: model.totalRating,
                            subTitle: model.subTitle,
                            ratting: model.rating,
                            deliveryTime: model.remainingTime,
                            deliveryPrice: model.deliveryPrice,
                          );
                        }),
                  ),
                ),

                Text('All Restaurent', style: TextStyle(color: blackColor, fontSize: 15, fontFamily: Bold),),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: height * .278,
                    child: ListView.builder(
                        itemCount: ExclusiveHelper.itemCount,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          ExclusiveItemModel model = ExclusiveHelper.getStatusItem(index);
                          return RestaurentScreen(
                            name: model.name,
                            image: model.image,
                            remainingTime: model.remainingTime,
                            totalRating: model.totalRating,
                            subTitle: model.subTitle,
                            ratting: model.rating,
                            deliveryTime: model.remainingTime,
                            deliveryPrice: model.deliveryPrice,
                          );
                        }),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
