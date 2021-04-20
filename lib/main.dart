// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:smartfarmingservices/src/Screens/HomePage/MainHomePage/Display/homepage.dart';
import 'package:smartfarmingservices/src/Screens/Login/Screen/login.dart';
// import 'package:smartfarmingservices/src/Screens/MyStore/Screen/ProductDetail.dart';
import 'package:smartfarmingservices/src/Screens/Signup/signup.dart';
import 'src/Screens/Splash/SplashScreen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      color: Colors.green,
      // builder: EasyLoading.init(),
      title: 'Smart Farming',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // initialRoute: SplashScreen.id,
      routes: {
        MainScreen.id: (context) => MainScreen(),
        SplashScreen.id: (context) => SplashScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        Homepage.id: (context) => Homepage(),
        Signup.id: (context) => Signup(),
      },
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error.toString());
            return Center(
              child: Text('Something went wrong!'),
            );
          }
          if (snapshot.connectionState == ConnectionState.done)
            return SplashScreen();
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
