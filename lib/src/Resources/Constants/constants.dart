import 'package:flutter/material.dart';
import 'package:smartfarmingservices/src/Resources/Style/styles.dart';

double sigmaX = 2; // from 0-10
double sigmaY = 2; // from 0-10
double opacity = 0.1; // from 0-1.0

///About me section in profile page
final List<String> AboutMeInfo = [
  'What is your age?',
  'What is your education',
  'Do you use SFT APP regularly?',
  'How much land do you have?',
  'Do you wanna upgrade?',
];

///For the profile page
final String kProfilename = "Roboxo";
final String kProfileimageurl = "asset/images/farmer.png";
final String kCompanyName = "  SFT SERVICES  ";
final String kProfilenumber = "+91 1234567890";

///For navigation Drawer
List<String> DrawerListItem = [
  'HOME',
  'CROP CYCLE',
  'MY STORE',
  'SELL CROP',
  'TRACK FARM',
  'EXPERT',
];

List<String> category = [
  'Fruits',
  'Vegetables',
  'Cereals',
];

const Color kBackgroundcolor = Color(0xFF4A4A58);
//;

//final AppBar = MyAppBar(
//  title: Text('HomePage'),
//  centerTitle: true,
//  flexibleSpace: kAppBarContainer,
//  leading: InkWell(
//    onTap: () {
//      setState(() {
//        isCollapsed = !isCollapsed;
//      });
//    },
//    child: Icon(Icons.menu),
//  ),
//  actions: [
//    Padding(
//      padding: const EdgeInsets.all(8.0),
////                child: kExpert,
//      child: InkWell(
//        onTap: () {},
//        child: Text("Log Out"),
//      ),
//    ),
//  ],
//);
//
class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final String AppbarTitle;
  final Function onTap;
  MyAppBar({@required this.AppbarTitle, @required this.onTap});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: kGradientColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: onTap,
                child: Icon(Icons.menu),
              ),
              Text(
                AppbarTitle,
                style: kTabBarProfileText,
              ),
              kExpert,
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}
