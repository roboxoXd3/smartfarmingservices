import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:smartfarmingservices/src/Model/User.dart' as user;
import 'package:smartfarmingservices/src/Model/User.dart';
import 'package:smartfarmingservices/src/Resources/ImageLink/ImageLink.dart';
import 'package:smartfarmingservices/src/Resources/Style/styles.dart';
// import 'package:smartfarmingservices/src/Services/GetPermission.dart';
import 'Newsfeed/newsfeedLayout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'Services/Servicelayout.dart';

class DashBoard extends StatefulWidget {
  final User user;

  const DashBoard({Key key, this.user}) : super(key: key);
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  AnimationController animationController;
  Animation<double> animation;
  Position currentPosition;
  double latitude;
  double longitude;
  String currentAddress = "Fetching.....";
  Future Location;

  final firestoreInstance = FirebaseFirestore.instance;
  // final FirebaseAuth = FirebaseAuth.instance;

  Future<void> _onPressed() async {

    // String userId = (await firestoreInstance.currentUser()).uid;

    // firestoreInstance.collection("users").get().then((querySnapshot) {
    //   querySnapshot.docs.forEach((result) {
    //     print(result.data());
    //   });
    // });
  }

  Future getCurrentPosition() async {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    currentPosition = await geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      // setState(() {
      currentPosition = position;
      latitude = currentPosition.latitude;
      longitude = currentPosition.longitude;
      // });

      print(latitude);
      print(longitude);
    }).catchError((onError) {
      print(onError);
    });
  }

  Future<String> locationToAddress() async {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    try {
      List<Placemark> p =
          await geolocator.placemarkFromCoordinates(latitude, longitude);
      Placemark place = p[0];
      setState(() {
        currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
    print("Current address is" + currentAddress.toString());
    return currentAddress;
  }

  @override
  void initState() {
    // TODO: implement initState
_onPressed();
    // PermissionService().requestLocationPermission(onPermissionDenied: () {
    //   print('Permission Denied');
    // });
    // // getCurrentPosition().whenComplete(() => locationToAddress());
    // getCurrentPosition().then((value) => locationToAddress());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//   locationToAddress();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(60))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Hi, " + widget.user.name.split(' ')[0],
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontFamily: 'Lemonanda',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 40,
                                width: 40,
                                child: Image.asset(hii, color: Colors.orange),
//                                    Transform(
//                                        transform: Matrix4.translation(_shake()),
//                                        child: Image.asset(hii, color: Colors.orange),
//                                    ),
                              ),
                            ),
                          ],
                        ),
                        Card(
                          elevation: 10,
                          shape: CircleBorder(),
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              gradient: kGradientColor,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: widget.user.photo == null
                                      ? AssetImage(profilepicture)
                                      : NetworkImage(widget.user.photo),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
//                Text("Latitude is: ${latitude.toString()}"),
//                Text("Longitude is: ${longitude.toString()}"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.orange,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Location will come here",
                          style: TextStyle(
//                        fontSize: 25,
                            color: Colors.white,
                            fontFamily: 'Lemonanda',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    "News Feeds",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontFamily: 'Lemonanda',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    child: NewsFeed(),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    "Our Services and Offers",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontFamily: 'Lemonanda',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    child: Services(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




