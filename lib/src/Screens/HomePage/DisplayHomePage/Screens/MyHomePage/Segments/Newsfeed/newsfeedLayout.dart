import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartfarmingservices/src/Resources/ImageLink/ImageLink.dart';
import 'package:intl/intl.dart';
import 'package:smartfarmingservices/src/Screens/ChatApp/config/Palette.dart';

class NewsFeed extends StatefulWidget {
  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,

      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(

              elevation: 5,
              child: Container(
                width: MediaQuery.of(context).size.width*0.6,
                padding: EdgeInsets.all(8.0),
                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ///Always remember if you want to have text to take multiple lines the column in which the text is must be wrapped with flexible widget.
                    Flexible(
                      child: SingleChildScrollView(
                        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                "News Heading",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Varela'
                                ),
                              ),
                            ),
                        SizedBox(height: 10,),
                            Text("The style property of Text widget can be used to apply various styles to a text, but a limitation of it is, the style gets applied to the entire text irrespective of whether the text is a single line or multiline",
                                 maxLines: 2,overflow: TextOverflow.ellipsis,style: Theme.of(context)
                                    .primaryTextTheme
                                    .subhead
                                    .copyWith(
                                  color: Colors.black,
                                ),
                                ),
                            SizedBox(height: 10,),
                            Container(
                              child: Text(
                                DateFormat('dd MMM kk:mm').format(DateTime.now()),
                                style: TextStyle(
                                    color: Palette.greyColor,
                                    fontSize: 12.0,
                                    fontStyle: FontStyle.normal),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(child: Image.asset(newspaper)),
                    ),
                  ],
                ),
              ),
            ), //this container is to display each news
          );
        },
      ),
    );
  }
}
