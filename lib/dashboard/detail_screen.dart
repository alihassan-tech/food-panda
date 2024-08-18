import 'package:flutter/material.dart';
import 'package:foodpanda_app/constats/color.dart';
import 'package:foodpanda_app/constats/constants.dart';
import 'package:scrollable_list_tabview/scrollable_list_tabview.dart';

class DetailScreen extends StatefulWidget {
  final String name, image;
  const DetailScreen({Key? key, required this.name, required this.image}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: NestedScrollView(headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: false,
                snap: false,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  stretchModes: [
                    StretchMode.blurBackground
                  ],
                  title: Text(
                    widget.name,
                    style: TextStyle(color: MyColors.primaryColor),
                    textAlign: TextAlign.left,
                  ),
                  background: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      Container(
                        height: 200.0,
                        width: double.infinity,
                        color: Colors.grey,
                        child: Image(
                          fit: BoxFit.cover,
                            image: AssetImage(widget.image)),
                      )
                    ],
                  ),
                ),
                expandedHeight: 250.0,
              ),
            ];
          },

          body: ScrollableListTabView(
              tabHeight: 50,
            bodyAnimationDuration: const Duration(milliseconds: 800),
            tabAnimationCurve: Curves.ease,
            tabAnimationDuration: const Duration(milliseconds: 150),
            style: TextStyle(color: Colors.green, fontFamily: Bold, fontSize: 25),
            tabs: [
              ScrollableListTab(
                  tab: const ListTab(
                      label: Text('Popular', style: TextStyle(fontFamily: Bold),),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    activeBackgroundColor: MyColors.navy,
                    borderColor: MyColors.navy,
                  ),
                  body: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (_, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text('Chicken Tikka Pizza', style: const TextStyle(fontFamily: Bold),),
                          subtitle: Text('Onion, Capsicum, Tomato, & Olive'),
                          trailing: Container(
                            height: 80,
                            width: 80,
                            alignment: Alignment.center,
                            child: Image(image: AssetImage('assets/pizza.jpg')),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text('RS. 120.00'),
                            ),
                            Container(
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xffeab676).withOpacity(0.5)),
                              child: Center(
                                child: Text('Popular', style: TextStyle(fontSize: 14, color: blackColor),),
                              ),
                            ),
                          ],
                        ),
                        Divider()
                      ],
                    ),
                  )
              ),
              ScrollableListTab(

                tab: const ListTab(

                    label: Text('Favourite'),

                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  activeBackgroundColor: MyColors.navy,
                  borderColor: MyColors.navy,
                  inactiveBackgroundColor: Colors.white,
                ),
                body: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (_, index) => Card(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [

                        Padding(
                            padding: const EdgeInsets.all(8.0),
                          child: Text('Favourite Deal 1', style: TextStyle(color: Colors.white, fontFamily: Bold),),
                        ),
                        Positioned(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                children: [
                                  Image(image: AssetImage('assets/food.jpg',)),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xfffffcff),
                                      borderRadius: BorderRadius.circular(20.0)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                      child: Text('Rs. 180.00', style: TextStyle(color: blackColor, fontFamily: Light),),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),

      ),
    ),

    );
  }
}
