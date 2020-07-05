import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smartfarmingservices/src/Resources/ImageLink/ImageLink.dart';
import 'package:smartfarmingservices/src/Resources/Style/styles.dart';

class ItemDetail extends StatelessWidget {
  static const String id = "Item_detail";
//  final String name;
//  final String imageUrl;
//  final String price;
//  final String productInfo;

//  const ItemDetail(
//    this.name,
//        this.imageUrl, this.price, this.productInfo
//  );
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
        title: Text('name',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {},
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
                      Image.asset(Logo, fit: BoxFit.fill),
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
                                child: Icon(
                                  Icons.add_shopping_cart,
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
                        child: Text('₹24200000',
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
                        child: Text('SFT MEMBERSHIP',
                            style: TextStyle(
                                color: Colors.green,
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
                          'Detail1:',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 15,
//                        fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Detail2:',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 15,
//                        fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Detail3:',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 15,
//                        fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Detail4:',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 15,
//                        fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 8),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Complete Detail',
                                style: TextStyle(
                                  fontFamily: 'Varela',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                child: Icon(Icons.arrow_forward),
                              )
                            ],
                          ),
                        ),
                        onTap: () {},
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
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Rating',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: RatingBar(
                          initialRating: 0,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
//                            isFilled = true;
                          },
                        ),
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green,
                        elevation: 10,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.green,
                          ),
                          alignment: Alignment.center,
                          height: 40,
                          width: 120,
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Varela',
                                fontSize: 25),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
//      bottomNavigationBar: BottomNavBar(),
    );
  }
}
