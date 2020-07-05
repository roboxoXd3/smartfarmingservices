import 'package:flutter/material.dart';
import 'package:smartfarmingservices/src/Screens/MyStore/Screen/ProductDetail.dart';

class ProductContainer extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String name;
  final double price;
  final String location;

  const ProductContainer(
      this.id, this.imageUrl, this.name, this.price, this.location);

  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[400],
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 4.0, right: 4.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  ItemDetail.id,
                  arguments: id,
                );
              },
              child: Card(
                elevation: 4,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xfffdfdfd),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.grey[200].withOpacity(0.2),
                        blurRadius: 20.0,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: <Widget>[
                      Container(
                        decoration: new BoxDecoration(
                            image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new AssetImage(imageUrl),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white10,
                              )
                            ]),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width / 2.5,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Colors.grey[100],
//                                  spreadRadius: 3,
//                                  blurRadius: 10,
                            )
                          ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '₹$price',
                                style: TextStyle(
                                  fontFamily: 'Varela',
                                  fontSize: 20,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                name,
                                style: TextStyle(
                                  fontFamily: 'Varela',
                                  fontSize: 20,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  child: Text(
                                    location,
                                    style: TextStyle(
                                      fontFamily: 'OpenSans',
                                      fontSize: 14,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                  alignment: Alignment.bottomCenter,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
//    return Container(
//      child: Row(
//        children: [
//          Container(
//            child: Image.asset(imageUrl),
//            width: MediaQuery.of(context).size.width * 30,
//            height: MediaQuery.of(context).size.height,
//          ),
//          Container(
//            child: Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Text(
//                  '₹$price',
//                  style: TextStyle(
//                    fontFamily: 'Varela',
//                    fontSize: 20,
//                    fontStyle: FontStyle.normal,
//                  ),
//                ),
//                SizedBox(
//                  height: 5,
//                ),
//                Text(
//                  name,
//                  style: TextStyle(
//                    fontFamily: 'Varela',
//                    fontSize: 20,
//                    fontStyle: FontStyle.normal,
//                  ),
//                ),
//                SizedBox(
//                  height: 20,
//                ),
//                Padding(
//                  padding: const EdgeInsets.only(left: 8.0),
//                  child: Container(
//                    child: Text(
//                      location,
//                      style: TextStyle(
//                        fontFamily: 'OpenSans',
//                        fontSize: 14,
//                        fontStyle: FontStyle.normal,
//                      ),
//                    ),
//                    alignment: Alignment.bottomCenter,
//                  ),
//                ),
//              ],
//            ),
//          )
//        ],
//      ),
//    );
  }
}
