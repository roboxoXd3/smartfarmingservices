import 'package:flutter/material.dart';
import 'dart:async';

import 'package:smartfarmingservices/src/Resources/ImageLink/ImageLink.dart';

class Services extends StatefulWidget {
  createState() {
    return ServicesState();
  }
}

class ServicesState extends State<Services> {
  int _currentPage = 0;
  PageController pageController = new PageController(initialPage: 0);
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Timer.periodic(Duration(seconds: 5), (Timer timer) {
  //   if (_currentPage < 4) {
  //     _currentPage++;
  //   } else {
  //     _currentPage = 0;
  //   }

  //   pageController.animateToPage(
  //     _currentPage,
  //     duration: Duration(milliseconds: 350),
  //     curve: Curves.ease,
  //   );

  //   // pageController.addListener(() {
  //   //   if(_currentPage.)
  //   // })
  // });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      // padding: EdgeInsets.all(5.0),
      child: PageView(
        pageSnapping: true,
        controller: pageController,
        children: [
          GestureDetector(
            onTap: () {},
            child: ReusableServicesCard(
              imageurl: CropCycle,
              text: "Crop Cycle",
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: ReusableServicesCard(
              imageurl: MyStore,
              text: "My Store",
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: ReusableServicesCard(
              imageurl: SellCrop,
              text: "Sell Crop",
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: ReusableServicesCard(
              imageurl: TrackFarm,
              text: "Track Farm",
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: ReusableServicesCard(
              imageurl: TalkToExpert,
              text: "Talk to an Expert",
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableServicesCard extends StatelessWidget {
  final String text;
  final String imageurl;
  ReusableServicesCard({@required this.text, @required this.imageurl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(),
          child: Stack(
            children: [
              Container(
                // height: 200,
                // padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    image: DecorationImage(
                        image: AssetImage(imageurl), fit: BoxFit.fill)),
                // child: Image.asset(imageurl),
              ),
              // SizedBox(
              //   height: 50,
              // ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    height: MediaQuery.of(context).size.height / 15,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black26,
                    child: Center(
                      child: Text(
                        text,
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
