import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';

///This is the home page that is having bottom navigation drawer and in the other homepage the screen overlays will be shown.

import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/services.dart';
import 'package:smartfarmingservices/src/Resources/ImageLink/ImageLink.dart';
import 'package:smartfarmingservices/src/Resources/Style/styles.dart';
import 'package:smartfarmingservices/src/Screens/ChatApp/pages/ContactsPage.dart';
import 'package:smartfarmingservices/src/Screens/CropCycle/CropInfoDisplay.dart';
import 'package:smartfarmingservices/src/Screens/HomePage/DisplayHomePage/Screens/MyHomePage/Segments/DashBoard.dart';
import 'package:smartfarmingservices/src/Screens/Login/Screen/login.dart';
import 'package:smartfarmingservices/src/Screens/MyStore/Screen/MyStoreContainerlayout.dart';

import 'package:smartfarmingservices/src/Screens/ProfileScreen/profilePage.dart';

import 'package:smartfarmingservices/src/Screens/Sell/SellScreenLayout.dart';

import '../../DisplayHomePage/HomePageDisplayHolder/customContainer.dart';

class Homepage extends StatefulWidget {
  static const id = "home_page";

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedPos = 0;
  double bottomNavBarHeight = 60;
  double fab = 120.0;
  Duration duration = const Duration(milliseconds: 300);
  bool isCollapsed = true;
  double ScreenWidth;
  double ScreenHeight;
  FirebaseAuth _auth = FirebaseAuth.instance;

  List<TabItem> tabitem = List.of([
    new TabItem(Icons.home, "Home", Colors.green[700],
        labelStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
    new TabItem(Icons.loop, "Cropcycle", Colors.green[700],
        labelStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
    new TabItem(Icons.shopping_cart, "MyStore", Colors.green[700],
        labelStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
    new TabItem(Icons.add_shopping_cart, "SellCrop", Colors.green[700],
        labelStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
    new TabItem(
      Icons.dehaze,
      "Track",
      Colors.green[700],
      labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    )
  ]);
  CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = new CircularBottomNavigationController(selectedPos);
  }

  //TODO: Back press functionality in order to exit the app on back pressed
  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (_)=>AlertDialog(
        elevation: 10,
        title: Text(
          "Exiting So Soon?",
          style: kLabelStyle.copyWith(color: Colors.green),
        ),
        actions: [
          FlatButton(
            color: Colors.green,
            child: Text("Yes"),
            onPressed: () => SystemNavigator.pop(),
          ),
          FlatButton(
            color: Colors.green,
            child: Text("NO"),
            onPressed: () => Navigator.pop(context, false),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        drawer: Drawer(
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Material(
                  elevation: 10,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 15,
                    decoration: BoxDecoration(gradient: kGradientColor),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                          child: ColorizeAnimatedTextKit(
                            duration: Duration(seconds: 3),
                            isRepeatingAnimation: false,
                            text: ['Smart Farming Services'],
                            textStyle: TextStyle(
                                fontFamily: 'Lemonanda',
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                            colors: [
                              Colors.green[800],
                              Color(0xff56ab2f),
                              Color(0xfffffff),
                              Colors.green[800]
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Column(
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
                Divider(
                  height: 20,
                  color: Colors.black12,
                  thickness: 2,
                ),
                Expanded(
                  flex: 4,
                  child: ListView(
                    children: [
                      DrawerItems(
                        icon: Icons.home,
                        name: "Home",
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      DrawerItems(
                        icon: Icons.info,
                        name: "My Profile",
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilePage()));
                        },
                      ),
                      DrawerItems(
                        onTap: null,
                        icon: Icons.language,
                        name: "Language",
                      ),
                      DrawerItems(
                        onTap: null,
                        icon: Icons.live_help,
                        name: "Expert",
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 20,
                  color: Colors.black12,
                  thickness: 2,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 50,
                  child: Row(
                    children: [
                      Image.asset(
                        Logout,
                        color: Colors.black,
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_)=>AlertDialog(
                              elevation: 10,
                              title: Text(
                                "Sure to Logout?",
                                style:
                                    kLabelStyle.copyWith(color: Colors.green),
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
                                  onPressed: () =>
                                      Navigator.pop(context, false),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Text(
                          " Logout",
                          style: kTabBarProfileText.copyWith(
                            fontSize: 30,
                            color: Colors.black,
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
        appBar: AppBar(
          title: Text(
            !isCollapsed
                ? "Navigation Drawer"
                : (selectedPos == 0)
                    ? 'HomePage'
                    : (selectedPos == 1)
                        ? "CropCycle"
                        : (selectedPos == 2)
                            ? "MyStore"
                            : (selectedPos == 3)
                                ? "SellCrop"
                                : "TrackFarm",
            style: TextStyle(fontFamily: 'Varela', fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
//          bottom: (selectedPos == 2)?SearchContainer():null,
          flexibleSpace: kAppBarContainer,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ContactsPage()),
                  );
                },
                child: Image.asset(
                  expert,
                ),
              ),
            ),
          ],
        ),
        body: Container(
          child: Stack(
            children: <Widget>[
              Padding(
                child: bodyContainer(),
                padding: EdgeInsets.only(bottom: bottomNavBarHeight),
              ),
              Align(alignment: Alignment.bottomCenter, child: bottomNav()),
            ],
          ),
        ),
      ),
    );
  }

  Widget bodyContainer() {
    Color selectedColor = tabitem[selectedPos].circleColor;
    // String slogan;
    CustomContainer container;

    switch (selectedPos) {
      case 0:
        container = CustomContainer(
          container: Container(
            child: DashBoard(),
          ),
        );
        break;
      case 1:
        container = CustomContainer(
          container: Container(
            child: CropInfoDisplay(),
          ),
        );
        break;

      case 2:
        container = CustomContainer(
          container: Container(child: MyStoreContainerLayout()),
        );
        break;
      case 3:
        container = CustomContainer(
          container: Container(
            child: SellScreenLayout(),
          ),
        );
        break;
      case 4:
        container = CustomContainer();
        break;
    }

    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: selectedColor,
        child: Center(child: container),
      ),
      onTap: () {
        if (_navigationController.value == tabitem.length - 1) {
          _navigationController.value = 0;
        } else {
          _navigationController.value++;
        }
      },
    );
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabitem,
      controller: _navigationController,
      barHeight: bottomNavBarHeight,
      barBackgroundColor: Colors.white,
      animationDuration: Duration(milliseconds: 300),
      selectedCallback: (int selectedPos) {
        setState(() {
          this.selectedPos = selectedPos;
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}

class DrawerItems extends StatelessWidget {
  final String name;
  final Function onTap;
  final IconData icon;

  const DrawerItems(
      {Key key, @required this.name, @required this.onTap, @required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: Colors.green[800],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        name,
                        style: kLabelStyle.copyWith(
                            color: Colors.green[800],
                            fontSize: 20,
                            fontFamily: 'Lemonanda'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Icon(Icons.chevron_right),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
