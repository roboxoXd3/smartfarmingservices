import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:smartfarmingservices/src/Screens/HomePage/MainHomePage/Display/homepage.dart';
import 'package:smartfarmingservices/src/Screens/Login/Screen/login.dart';
import 'package:smartfarmingservices/src/Screens/MyStore/Screen/ProductDetail.dart';
import 'package:smartfarmingservices/src/Screens/Signup/signup.dart';
import 'src/Screens/Splash/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      color: Colors.green,
      title: 'Smart Farming',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: SplashScreen.id,
      routes: {
        MainScreen.id: (context) => MainScreen(),
        SplashScreen.id: (context) => SplashScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        Homepage.id: (context) => Homepage(),
        Signup.id: (context) => Signup(),
      },
    );
  }
}
