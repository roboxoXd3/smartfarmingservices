import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//import 'package:smartfarmingservices/src/Resources/ImageLink/ImageLink.dart';
import 'package:smartfarmingservices/src/Resources/Style/styles.dart';
import 'package:http/http.dart' as http;
import 'package:smartfarmingservices/src/Screens/MyStore/Screen/Kart.dart';

class ItemDetail extends StatefulWidget {
  final String name;
  final String Category;
  final double Price;
  final String Detail;
  final String location;
  final String rating;
  final String image;

  const ItemDetail(
      {Key key,
      @required this.name,
      @required this.Category,
      @required this.Price,
      @required this.Detail,
      @required this.location,
      @required this.rating,
      @required this.image})
      : super(key: key);
  @override
  _ItemDetailState createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  List CropData;
  String url = 'http://b4ce39101fc3.ngrok.io/buy';

  double Rating;
  List StoreData;
  Future Item;

  Future listCategory() async {
    http.Response response;

    response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        StoreData = json.decode(response.body);
        print("Length of the list is: ${StoreData.length}");
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    Item = listCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ///This will give us the id and this is the way we are using because we have passed id as an argument whenever we have navigated to this screen.
    final productID = ModalRoute.of(context).settings.arguments as String;
    //TODO: Here we will get all of the data just with the id, and here the concept of stateManagement will come into picture.

    bool isFilled = false;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: kGradientColor,
          ),
        ),
        elevation: 0.6,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(widget.name,
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Kart();
              }));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: <Widget>[
//            SizedBox(height: 5.0),
            Container(
//              height: 400,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 0, right: 0),
                child: Card(
                  borderOnForeground: true,
                  child: Column(
                    children: [
                      Container(
                          height: 400,
                          width: MediaQuery.of(context).size.width,
                          child: Image.network(widget.image, fit: BoxFit.fill)),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(50),
                            elevation: 10,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
//                                gradient: kGradientColor,
                                    color: Colors.green),
                                child: IconButton(
                                  icon: Icon(Icons.add_shopping_cart),
                                  onPressed: () {
                                    // Navigator.push(context,
                                    //     MaterialPageRoute(builder: (context) {
                                    //   return Kart(
                                    //     image: widget.image,
                                    //     location: widget.location,
                                    //     name: widget.name,
                                    //     Price: widget.Price,
                                    //   );
                                    // }));
                                  },
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  elevation: 5,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Card(
                elevation: 5,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
//                        margin: EdgeInsets.only(),
                        alignment: Alignment.centerLeft,
                        child: Text('₹' + widget.Price.toString(),
                            style: TextStyle(
                                fontFamily: 'Varela',
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.green)),
                      ),
                      SizedBox(height: 6.0),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 8),
                        child: Text(widget.name.toString(),
                            style: TextStyle(
                                color: Colors.green[800],
                                fontFamily: 'Varela',
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Card(
                elevation: 5,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Product Detail:',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.Detail,
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 15,
//                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
//             Padding(
//               padding: const EdgeInsets.only(left: 8.0),
//               child: Card(
//                 child: Container(
//                   alignment: Alignment.centerLeft,
//                   child: Column(
//                     children: <Widget>[
//                       Text(
//                         'Rating',
//                         style: TextStyle(
//                           fontFamily: 'Varela',
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 15,
//                       ),
//                       Container(
//                         alignment: Alignment.center,
//                         child: RatingBar(
//                           initialRating: double.parse(widget.rating),
//                           minRating: 1,
//                           direction: Axis.horizontal,
//                           allowHalfRating: true,
//                           itemCount: 5,
//                           itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
//                           //Temporarily commenting.. as per discussed with Rishav
//                           // itemBuilder: (context, _) => Icon(
//                           //   Icons.star,
//                           //   color: Colors.amber,
//                           // ),
//                           onRatingUpdate: (rating) {
//                             Rating = rating;
// //                            isFilled = true;
//                           },
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () {
// //                          updateRating().whenComplete(() {
// //                            print("Rating has been updated");
// //                          });
//                         },
//                         child: Material(
//                           borderRadius: BorderRadius.circular(20),
//                           color: Colors.green,
//                           elevation: 10,
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color: Colors.green,
//                             ),
//                             alignment: Alignment.center,
//                             height: 40,
//                             width: 120,
//                             child: Text(
//                               "Submit",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w500,
//                                   fontFamily: 'Varela',
//                                   fontSize: 25),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 50,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//
          ]),
        ),
      ),
//      bottomNavigationBar: BottomNavBar(),
    );
  }
}
