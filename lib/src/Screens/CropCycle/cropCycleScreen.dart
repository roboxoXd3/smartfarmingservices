import 'package:flutter/material.dart';
import 'package:smartfarmingservices/src/Resources/Style/styles.dart';
import 'package:smartfarmingservices/src/Screens/HomePage/DisplayHomePage/Screens/MyHomePage/MyHomePage.dart';
import 'package:smartfarmingservices/src/Screens/HomePage/MainHomePage/Display/homepage.dart';

import 'CropCycleDisplayLayout.dart';

class CropCycleDisplayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        elevation: 0.4,
//        centerTitle: true,
//        title: Text(
//          'CropCycle',
//          style: TextStyle(
////            color: Colors.black,
//            fontFamily: 'Varela',
//          ),
//        ),
//        flexibleSpace: kAppBarContainer,
//        leading: IconButton(
//          icon: Icon(Icons.arrow_back, color: Colors.white),
//          onPressed: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage(),),);
//          },
//        ),
//        actions: [
//          Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: kExpert,
//          ),
//        ],
//      ),
      body: CropCycleDisplay(),
    );
  }
}
