import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:foodpanda_app/components/restaurent.dart';
import 'package:foodpanda_app/constats/color.dart';
import 'package:foodpanda_app/constats/constants.dart';
import 'package:foodpanda_app/dashboard/home_screen.dart';
import 'package:foodpanda_app/pandaPickHelper/pandaPickHelper.dart';
import 'package:foodpanda_app/pandaPickHelper/pandaPickItemModel.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Jacobabad City')),
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
                    decoration: BoxDecoration(
                        color: Color(0xfff7f7f7),
                        borderRadius: BorderRadius.circular(50.0)),
                  ),
                )
              ],
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.shopping_bag_outlined),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: MyColors.primaryColor,
              ),
              child: CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage('assets/ali.jpg'),
              ),
            ),
            ListTile(
              title: Text(
                'Setting',
                style: TextStyle(fontFamily: Medium, color: Colors.black),
              ),
              leading: Icon(Icons.settings_outlined),
            ),
            ListTile(
              title: Text(
                'Help center 2',
                style: TextStyle(fontFamily: Medium, color: Colors.black),
              ),
              leading: Icon(Icons.help_outline),
            ),
            ListTile(
              title: Text(
                'More',
                style: TextStyle(fontFamily: Medium, color: Colors.black),
              ),
              leading: Icon(Icons.more_horiz),
            ),
            ListTile(
              title: Text(
                'Sign up or Log in',
                style: TextStyle(fontFamily: Medium, color: Colors.black),
              ),
              leading: Icon(Icons.login_outlined),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Container(
                    height: height * .18,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: MyColors.primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Image(
                            fit: BoxFit.fitWidth,
                            width: double.infinity,
                            image: AssetImage('assets/chicken.jpg')),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Food delivery',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: Bold,
                                    fontSize: 18),
                              ),
                              Text(
                                'Order from your favourite \n restaurants and home chefs',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    height: 1,
                                    fontFamily: Medium,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: height * .25,
                        decoration: BoxDecoration(
                          color: Color(0xfffed271),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Stack(
                            alignment: Alignment.center,
                            children:  [
                              CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage('https://images.deliveryhero.io/image/nv/Pakistan/dummy.png?height=480'),
                              ),

                              Positioned(
                                bottom: 15,
                                  left: 0,
                                  child: Text('pandamart', style: TextStyle(color: blackColor, fontFamily: Bold, fontSize: 18),)),

                              Positioned(
                                  bottom: 0,
                                  left: 0,
                                  child: Text('panda20 for 20% off', style: TextStyle(color: blackColor, fontWeight: FontWeight.w500, fontFamily: Medium, fontSize: 14),)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                        child: Column(
                          children: [
                            Container(
                              height: height * .15,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xffef9fc4),
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                    image: AssetImage('assets/food.jpg')),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Text('Pick up', style: TextStyle(color: blackColor, fontFamily: Bold ),),
                                    Text('Upto 50% off', style: TextStyle(color: blackColor, fontFamily: Bold, fontWeight: FontWeight.w500),)
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              height: height * .1,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xff85bfff),
                                borderRadius: BorderRadius.circular(10),

                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Text('Shops', style: TextStyle(color: blackColor, fontFamily: Bold ),),
                                    Text('Everyday assentials', style: TextStyle(color: blackColor, fontFamily: Bold, fontWeight: FontWeight.w500),)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                    ),
                  ],
                ),
              ),
              Text('Your daily deals', style: TextStyle(color: blackColor, fontSize: 15, fontFamily: Bold),),
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
            ],
          ),
        ),
      ),
    );
  }
}
