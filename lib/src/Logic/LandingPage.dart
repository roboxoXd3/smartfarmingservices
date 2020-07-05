import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smartfarmingservices/src/Screens/HomePage/MainHomePage/Display/homepage.dart';
import 'package:smartfarmingservices/src/Screens/Login/Screen/login.dart';
import 'package:smartfarmingservices/src/Screens/Splash/SplashScreen.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return SplashScreen();
        if (!snapshot.hasData || snapshot.data == null) return LoginScreen();

        return Homepage();
      },
    );
  }
}
