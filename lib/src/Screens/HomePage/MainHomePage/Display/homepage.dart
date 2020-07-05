///This is the home page that is having bottom navigation drawer and in the other homepage the screen overlays will be shown.

import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/services.dart';
import 'package:smartfarmingservices/src/Resources/Constants/constants.dart';
import 'package:smartfarmingservices/src/Resources/Style/styles.dart';
import 'package:smartfarmingservices/src/Screens/AdminPanel/Screen/AdminPanel.dart';
import 'package:smartfarmingservices/src/Screens/CropCycle/Screen/ProductOverView.dart';
import 'package:smartfarmingservices/src/Screens/CropCycle/cropCycleScreen.dart';
import 'package:smartfarmingservices/src/Screens/HomePage/DisplayHomePage/Screens/MyHomePage/MyHomePage.dart';
import 'package:smartfarmingservices/src/Screens/MyStore/Screen/MyStoreContainerlayout.dart';
import 'package:smartfarmingservices/src/Screens/NavigationDrawer/NavigationDrawer.dart';
import 'package:smartfarmingservices/src/Screens/Sell/SellScreen.dart';

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

  List<TabItem> tabitem = List.of([
    new TabItem(Icons.home, "Home", Colors.green[700],
        labelStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
    new TabItem(Icons.loop, "Cropcycle", Colors.green[700],
//        labelStyle:
//            TextStyle(color: Colors.black38, fontWeight: FontWeight.bold)),
//    new TabItem(Icons.contact_phone, "Expert", Colors.green[800],
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
      child: AlertDialog(
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
    ScreenWidth = MediaQuery.of(context).size.width;
    ScreenHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text(!isCollapsed
              ? "Navigation Drawer"
              : (selectedPos == 0)
                  ? 'HomePage'
                  : (selectedPos == 1)
                      ? "CropCycle"
                      : (selectedPos == 2)
                          ? "MyStore"
                          : (selectedPos == 3) ? "SellCrop" : "TrackFarm"),
          centerTitle: true,
          flexibleSpace: kAppBarContainer,
          leading: (selectedPos == 0)
              ? IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    setState(() {
                      isCollapsed = !isCollapsed;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Homepage();
                    }));
                  },
                ),
//          InkWell(
//            onTap: () {
//              setState(() {
//                isCollapsed = !isCollapsed;
//              });
//            },
//            child: Icon(Icons.menu),
//          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
//              child: kExpert,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AdminPanel();
                  }));
                },
                child: Text("Admin Panel"),
              ),
            ),
          ],
        ),
        body: Container(
          child: Stack(
            children: [
              NavigationDrawer(),
              HomePageDashBoard(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget HomePageDashBoard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: isCollapsed ? 0 : 0.2 * ScreenHeight,
      left: isCollapsed ? 0 : 0.6 * ScreenWidth,
      right: isCollapsed ? 0 : -0.4 * ScreenWidth,
      bottom: isCollapsed ? 0 : 0.1 * ScreenHeight,
      child: Stack(
        children: <Widget>[
          Padding(
            child: bodyContainer(),
            padding: EdgeInsets.only(bottom: bottomNavBarHeight),
          ),
          Align(alignment: Alignment.bottomCenter, child: bottomNav()),
        ],
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
            child: MyHomePage(),
          ),
        );
        break;
      case 1:
        container = CustomContainer(
          container: Container(
//            child: CropCycleDisplayScreen(),
            child: ProductOverView(),
          ),
        );
        break;
//      case 2:
//        // slogan = "Receive, Review, Rip";
//        container = CustomContainer(
////          text: 'Expert',
//          appbarText: 'Expert',
//        );
//        break;
      case 2:
        container = CustomContainer(
//          text: 'MyStore',
//          appbarText: 'MyStore',
          container: Container(child: MyStoreContainerLayout()),
        );
        break;
      case 3:
        container = CustomContainer(
//          text: 'SellCrop',
//          appbarText: 'SellCrop',
          container: Container(
            child: SellScreen(),
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
//          print(_navigationController.value);
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
