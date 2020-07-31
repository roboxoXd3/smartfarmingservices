import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smartfarmingservices/src/Resources/Constants/constants.dart';

import 'package:smartfarmingservices/src/Resources/Style/styles.dart';
import 'package:smartfarmingservices/src/Screens/HomePage/DisplayHomePage/Screens/MyHomePage/ReusableHeading.dart';

import 'Segments/Chart/ChartLayout.dart';
import 'Segments/Newsfeed/newsfeedLayout.dart';
import 'Segments/Services/Servicelayout.dart';

class MyHomePage extends StatefulWidget {
//  NavigationDrawer navigationDrawer;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Duration duration = const Duration(milliseconds: 300);
//  bool isCollapsed = false;
  double ScreenWidth;
  double ScreenHeight;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenWidth = MediaQuery.of(context).size.width;
    ScreenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBackgroundcolor,
//      appBar: isCollapsed
//          ? AppBar(
//              title: Text('HomePage'),
//              centerTitle: true,
//              flexibleSpace: kAppBarContainer,
//              leading: InkWell(
//                onTap: () {
//                  setState(() {
//                    isCollapsed = !isCollapsed;
//                  });
//                },
//                child: Icon(Icons.menu),
//              ),
//              actions: [
//                Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: kExpert,
////      child: InkWell(
////        onTap: () {},
////        child: Text("Log Out"),
////      ),
//                ),
//              ],
//            )
//          : null,
      body: Container(
        child: Dashboard(context),
      ),
    );
  }

  Widget Dashboard(context) {
    return Material(
      elevation: 10,
//        borderRadius: BorderRadius.all(
//          Radius.circular(40.0),
//        ),
      child: Scaffold(
//          AppBar(
//            title: Text('HomePage'),
//            centerTitle: true,
//            flexibleSpace: kAppBarContainer,
//            leading: InkWell(
//              onTap: () {
//                setState(() {
//                  isCollapsed = !isCollapsed;
//                });
//              },
//              child: Icon(Icons.menu),
//            ),
//            actions: [
//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: kExpert,
//              ),
//            ],
//          ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              ReusableHeadingCard(
                name: 'My Farm Live',
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 10),
                child: ChartLayout(),
              ),
              ReusableHeadingCard(name: 'Get Some Update'),
              Container(
                child: NewsFeed(),
              ),
              ReusableHeadingCard(name: 'Services'),
              Container(
                child: Services(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
