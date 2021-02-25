import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:smartfarmingservices/src/Resources/Constants/constants.dart';
import 'package:smartfarmingservices/src/Resources/ImageLink/ImageLink.dart';
import 'package:smartfarmingservices/src/Resources/Style/styles.dart';
import 'package:smartfarmingservices/src/Screens/Login/Screen/login.dart';

import 'AboutMe.dart';
import 'ContactUs.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  TabController _tabController;
  double _sigmaX = 2; // from 0-10
  double _sigmaY = 2; // from 0-10
  double _opacity = 0.1; // from 0-1.0

//  final GoogleSignIn googleSignIn = GoogleSignIn();
//  final FirebaseAuth _auth = FirebaseAuth.instance;

  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        centerTitle: true,
        flexibleSpace: kAppBarContainer,
        actions: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Tooltip(
              message: "Logout",
              preferBelow: false,
              decoration: BoxDecoration(color: Colors.white),
              textStyle: TextStyle(fontFamily: 'Varela'),
              child: GestureDetector(
                child: Image.asset(
                  Logout,
                  color: Colors.white,
                ),
                onTap: () {
//                  googleSignIn.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },

//                print("Logout pressed");
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Stack(children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(profilepicture),
                    fit: BoxFit.cover,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
                  child: Container(
                    color: Colors.black.withOpacity(_opacity),
                  ),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width / 4,
                top: 20,
                child: Container(
                  child: Column(children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(profilepicture),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Text(
                      kProfilename,
                      style: TextStyle(
                          fontSize: 30.0,
                          fontFamily: 'Varela',
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      kProfilenumber,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Varela',
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        Text(
                          'Kharar, Punjab.',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Varela',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )),
                  ]),
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: DefaultTabController(
                length: 7,
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      child: TabBar(
                          isScrollable: true,
                          indicatorColor: Colors.green[900],
                          tabs: [
                            Container(
                              child: Text(
                                'About me',
                                style: kTabBarProfileText,
                              ),
                            ),
                            Container(
                              child: Text(
                                'My Questions',
                                style: kTabBarProfileText,
                              ),
                            ),
                            Container(
                              child: Text(
                                'My Advertisments',
                                style: kTabBarProfileText,
                              ),
                            ),

                            Container(
                              child: Text(
                                'My Refrence Code',
                                style: kTabBarProfileText,
                              ),
                            ),
                            Container(
                              child: Text(
                                'My Answers',
                                style: kTabBarProfileText,
                              ),
                            ),
                            Container(
                              child: Text(
                                'My Interests',
                                style: kTabBarProfileText,
                              ),
                            ),
                            Container(
                              child: Text(
                                'Contact us',
                                style: kTabBarProfileText,
                              ),
                            ),
                          ]),
                    ),
                    Expanded(
                      child: Container(
                          // height: 200,
                          child: TabBarView(
                        children: [
                          AboutME(),
                          Center(
                            child: Container(
                              child: Text('MY QUESTIONS'),
                            ),
                          ),
                          Center(
                            child: Container(
                              child: Text('MY ADDS'),
                            ),
                          ),
                          Center(
                            child: Container(
                              child: Text('MY REFRENCE CODE'),
                            ),
                          ),

                          Center(
                            child: Container(
                              child: Text('MY ANSWERS'),
                            ),
                          ),
                          Center(
                            child: Container(
                              child: Text('MY INTERESTS'),
                            ),
                          ),
                          ContactUs(),
                        ],
                      )),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget alertBox() {
    return AlertDialog(
      title: Text("Are you sure you wanna logout?"),
      content: new SingleChildScrollView(
        child: new ListBody(
          children: [
            new Text('This is a Dialog Box. Click OK to Close.'),
          ],
        ),
      ),
      actions: [
        FlatButton(
          child: Text("Yes"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text("No"),
          onPressed: () {
            return null;
          },
        )
      ],
    );
  }
}

