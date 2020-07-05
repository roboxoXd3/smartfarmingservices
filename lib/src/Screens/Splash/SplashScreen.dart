import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartfarmingservices/main.dart';
import 'package:smartfarmingservices/src/Logic/LandingPage.dart';

import 'dart:ui';
import 'package:smartfarmingservices/src/Resources/Constants/constants.dart';
import 'package:smartfarmingservices/src/Screens/HomePage/MainHomePage/Display/homepage.dart';
import 'package:smartfarmingservices/src/Screens/Login/Screen/login.dart';

import '../../Resources/ImageLink/ImageLink.dart';

class SplashScreen extends StatefulWidget {
  static const String id = "splash_screen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationPage);
  }

  Widget navigationPage() {
    Navigator.pushNamed(context, MainScreen.id);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ScreenBackGround), fit: BoxFit.fill)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
              child: Container(
                color: Colors.black.withOpacity(opacity),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 15),
                      height: 250,
                      width: 250,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        //0xff08C933
                        image: new DecorationImage(
                          fit: BoxFit.fill,
//                          colorFilter: ColorFilter.mode(
//                              Colors.black.withOpacity(0.7), BlendMode.dstATop),
                          image: new AssetImage(sft),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'SFT SERVICES',
                  style: TextStyle(
                      fontFamily: 'NotoSans',
                      fontSize: 30,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                ColorizeAnimatedTextKit(
                  text: ['FOR GREENER FUTURE'],
                  textStyle: TextStyle(
                    fontFamily: 'NotoSans',
                    fontSize: 30,
                  ),
                  colors: [Colors.green, Colors.white, Colors.green],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  static const id = "Main_screen";

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
        if (snapshot.hasData) {
          return Homepage();
        } else {
          return LoginScreen();
        }
//        if (!snapshot.hasData || snapshot.data == null) {
//          return LoginScreen();
//        } else {
//          return Homepage();
//        }
      },
    );
  }
}
