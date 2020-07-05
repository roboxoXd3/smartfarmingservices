import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smartfarmingservices/src/Resources/Constants/constants.dart';
import 'package:smartfarmingservices/src/Resources/Style/styles.dart';
import 'file:///D:/Study%20material/flutter/FreelanceProject/smartfarmingservices/lib/src/Screens/AdminPanel/Screen/AdminPanel.dart';
import 'package:smartfarmingservices/src/Screens/CropCycle/cropCycleScreen.dart';
import 'package:smartfarmingservices/src/Screens/Login/Screen/login.dart';
import 'package:smartfarmingservices/src/Screens/MyStore/Screen/MyStoreContainerlayout.dart';

import 'package:smartfarmingservices/src/Screens/ProfileScreen/profilePage.dart';
import 'package:smartfarmingservices/src/Screens/Sell/SellScreen.dart';
import 'package:smartfarmingservices/src/Screens/Splash/SplashScreen.dart';
import '../../Screens/HomePage/MainHomePage/Display/homepage.dart';
import '../../Resources/ImageLink/ImageLink.dart';

//class NavigationDrawer extends StatefulWidget {
//  final VoidCallback onSignOut;
//  NavigationDrawer({@required this.onSignOut});
//
//  ///Anonymous login functionalties will be handled by this function
//  Future<void> signOut() async {
//    try {
//      await FirebaseAuth.instance.signOut();
//      onSignOut();
//    } catch (e) {
//      print(e.toString());
//    }
//  }
//
//  @override
//  _NavigationDrawerState createState() => _NavigationDrawerState();
//}

//class _NavigationDrawerState extends State<NavigationDrawer> {
class NavigationDrawer extends StatelessWidget {
  final PageRoute = [
    'Home',
    'CropCycle',
    'MyStore',
    'Sell',
    'Home',
    'Home',
  ];

  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    bool isExpanded = true;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/Home': (context) => Homepage(),
        '/CropCycle': (context) => CropCycleDisplayScreen(),
        '/MyStore': (context) => MyStoreContainerLayout(),
        '/Sell': (context) => SellScreen(),
      },
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Colors.grey[200]),
//        width: screenwidth * 0.65,
          child: Column(
            children: [
              SizedBox(
//              flex: 1,
                height: 250,

                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                  child: DrawerHeader(
                    child: Column(
                      children: [
                        ColorizeAnimatedTextKit(
                          isRepeatingAnimation: false,
                          text: ['Smart Farming Services'],
                          textStyle: TextStyle(
                            fontFamily: 'NotoSans',
                            fontSize: 20,
                          ),
                          colors: [
                            Color(0xff56ab2f),
                            Color(0xfffffff),
                            Color(0xffa8e063),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Card(
                              elevation: 10,
                              shape: CircleBorder(),
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  gradient: kGradientColor,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(profilepicture),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "Roboxo",
                                style:
                                    kTabBarProfileText.copyWith(fontSize: 30),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
//              flex: 2,
                child: ListView.builder(
                  //"_getListItemTile" will be a seperate function which we ll be creating in order to populate the list
                  //with the list and its respective "ontap" functionality.
                  itemCount: DrawerListItem.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    DrawerListItem[index],
                                    style: TextStyle(
                                        fontFamily: 'Varela',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushReplacementNamed(
                            context, '/${PageRoute[index]}');
                      },
                    );
                  },
                ), //
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                height: 50,
                width: screenwidth,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return AdminPanel();
                        },
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Text(
                        " Admin Panel",
                        style: kTabBarProfileText.copyWith(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                height: 50,
                width: screenwidth,
                child: Row(
                  children: [
                    Image.asset(
                      Logout,
                      color: Colors.green,
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          child: AlertDialog(
                            elevation: 10,
                            title: Text(
                              "Sure to Logout?",
                              style: kLabelStyle.copyWith(color: Colors.green),
                            ),
                            actions: [
                              FlatButton(
                                color: Colors.green,
                                child: Text("Yes"),
                                onPressed: () {
                                  _auth.signOut().whenComplete(
                                    () {
                                      Navigator.pop(context);
                                      Navigator.pushNamed(
                                          context, LoginScreen.id);
                                    },
                                  );
                                },
                              ),
                              FlatButton(
                                color: Colors.green,
                                child: Text("NO"),
                                onPressed: () => Navigator.pop(context, false),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text(
                        " Logout",
                        style: kTabBarProfileText.copyWith(
                          fontSize: 30,
                          color: Colors.green,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
