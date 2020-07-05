//import 'dart:html';

import 'package:flutter/material.dart';

import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:smartfarmingservices/src/Resources/Constants/constants.dart';

class AboutME extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Text(
                "Lets Update the profile",
                style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 16, right: 26),
                  child: Container(
//                      padding: EdgeInsets.only(top: 20),
//                      margin: EdgeInsets.only(top: 20),
                      height: 50,
                      child: FAProgressBar(
                        displayText: '%',
                        size: 10,
                        backgroundColor: Color(0xffffffff),
                        borderRadius: 20,
                        currentValue: 20,
                        // changeProgressColor: Colors.red,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0, top: 8),
                child: Container(
                  height: 40,
                  width: 40,
                  child: Image.asset('asset/images/award.png'),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
//              width: 200,
              child: ListView.builder(
//        semanticChildCount: AboutMeInfo.length,
                itemCount: AboutMeInfo.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Card(
                          elevation: 6,
                          borderOnForeground: false,
                          child: new Container(
                            padding: EdgeInsets.all(8),
                            color: Colors.white,
                            height: 150,
                            width: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    AboutMeInfo[index],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Varela'),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: RaisedButton(
                                    color: Colors.green[600],
                                    child: Text('Submit'),
                                    onPressed: () {},
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
