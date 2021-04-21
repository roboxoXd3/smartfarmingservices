import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:smartfarmingservices/src/Resources/ImageLink/ImageLink.dart';
import 'package:smartfarmingservices/src/Resources/Style/styles.dart';
import 'package:smartfarmingservices/src/Screens/ChatApp/pages/chatDetailed.dart';
import 'package:smartfarmingservices/src/Screens/ChatApp/pages/conversationPage.dart';
import 'package:smartfarmingservices/src/Screens/MyStore/Screen/ProductSearch.dart';
import 'package:smartfarmingservices/src/Services/CropManager.dart';
import 'package:smartfarmingservices/src/Services/Database.dart';
import 'package:smartfarmingservices/src/Services/httpServices.dart';

import 'package:smartfarmingservices/src/Resources/Constants/constants.dart';
import 'package:smartfarmingservices/src/Model/User.dart';
import 'UserSearch.dart';
import 'package:smartfarmingservices/src/Model/User.dart' as UserModel;

class ContactsPage extends StatefulWidget {
  final UserModel.User user;

  const ContactsPage({Key key, this.user}) : super(key: key);
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  CropManager manager = CropManager();
  DatabaseHelper dbHelper;
  String number = "234232323";

  @override
  void initState() {
    super.initState();
    setState(() {
      dbHelper = new DatabaseHelper();
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.user.toMap().toString());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Experts"),
          centerTitle: true,
//          bottom: (selectedPos == 2)?SearchContainer():null,
          flexibleSpace: kAppBarContainer,
        ),
        body: widget.user.isSupport
            ? StreamBuilder(
                stream: dbHelper.getChats(widget.user.uid),
                builder: (builderContext, snapshot) {
                  if (snapshot.hasData) {
                    QuerySnapshot qSnap = snapshot.data;
                    List<DocumentSnapshot> docs = qSnap.docs;
                    if (docs.length == 0)
                      return Center(
                        child: Text('No Chats yet!'),
                      );
                    return ListView.builder(
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        List<dynamic> members = docs[index].data()['members'];
                        String userId;
                        userId = members.elementAt(0) == widget.user.uid
                            ? members.elementAt(1)
                            : members.elementAt(0);
                        return FutureBuilder(
                          future: dbHelper.getUserByUsername(userId),
                          builder: (context, _snapshot) {
                            if (_snapshot.hasData) {
                              DocumentSnapshot docSnapUser = _snapshot.data;
                              Map<String, dynamic> _user = docSnapUser.data();
                              return Card(
                                margin: EdgeInsets.all(8.0),
                                elevation: 8.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: InkWell(
                                  splashColor: Color(0xffa8e063),
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ChatDetailed(
                                        userData: _user,
                                      ),
                                    ),
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.all(10.0),
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    child: Center(
                                      child: Row(
                                        children: [
                                          Hero(
                                            tag: _user['photo'] == null
                                                ? _user['name']
                                                    .toString()
                                                    .split(' ')[0]
                                                : _user['photo'].toString(),
                                            child: _user['photo'] == null
                                                ? Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.15,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.15,
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          Color(0xff56ab2f),
                                                      child: Text(
                                                        _user['name']
                                                            .toString()
                                                            .toUpperCase()[0],
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  )
                                                : Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.15,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.15,
                                                    decoration:
                                                        new BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image:
                                                          new DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: new NetworkImage(
                                                          _user['photo']
                                                              .toString(),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.02,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.43,
                                            child: Text(
                                              _user['name'].toString(),
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: _timeDivider(docs[index]
                                                  .data()['lastActive']),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                            return Card(
                              margin: EdgeInsets.all(8.0),
                              elevation: 8.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Container(
                                margin: EdgeInsets.all(10.0),
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    valueColor: new AlwaysStoppedAnimation(
                                      Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation(
                        Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  );
                },
              )
            : FutureBuilder(
                future: dbHelper.getSupportExperts(),
                builder: (builderContext, snapshot) {
                  if (snapshot.hasData) {
                    DocumentSnapshot docSupport = snapshot.data;
                    List<dynamic> expertList = docSupport.data()['support'];
                    return Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                showSearch(
                                    context: context, delegate: UserSearch());
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black38),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Search"),
//                                      Icon(Icons.search),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: expertList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return FutureBuilder(
                                    future: dbHelper
                                        .getUserByUsername(expertList[index]),
                                    builder: (context, expertSnapshot) {
                                      if (expertSnapshot.hasData) {
                                        DocumentSnapshot docSnapUser =
                                            expertSnapshot.data;
                                        Map<String, dynamic> _user =
                                            docSnapUser.data();
                                        return Card(
                                          margin: EdgeInsets.all(8.0),
                                          elevation: 8.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: InkWell(
                                            splashColor: Color(0xffa8e063),
                                            onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ChatDetailed(
                                                  userData: _user,
                                                ),
                                              ),
                                            ),
                                            child: Container(
                                              margin: EdgeInsets.all(10.0),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.08,
                                              child: Center(
                                                child: Row(
                                                  children: [
                                                    Hero(
                                                      tag:
                                                          _user['photo'] == null
                                                              ? _user['name']
                                                                  .toString()
                                                                  .split(' ')[0]
                                                              : _user['photo']
                                                                  .toString(),
                                                      child:
                                                          _user['photo'] == null
                                                              ? Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.15,
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.15,
                                                                  child:
                                                                      CircleAvatar(
                                                                    backgroundColor:
                                                                        Color(
                                                                            0xff56ab2f),
                                                                    child: Text(
                                                                      _user['name']
                                                                          .toString()
                                                                          .toUpperCase()[0],
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ),
                                                                )
                                                              : Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.15,
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.15,
                                                                  decoration:
                                                                      new BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    image:
                                                                        new DecorationImage(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      image:
                                                                          new NetworkImage(
                                                                        _user['photo']
                                                                            .toString(),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.02,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.43,
                                                      child: Text(
                                                        _user['name']
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      return Card(
                                        margin: EdgeInsets.all(8.0),
                                        elevation: 8.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.all(10.0),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.08,
                                          child: Center(
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  new AlwaysStoppedAnimation(
                                                Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Center(
                      child: Container(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              LoadingBouncingGrid.square(
                                backgroundColor: Colors.green,
                                size: 80,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Fetching Data, thanks for your patience.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    fontFamily: 'Varela',
                                    color: Colors.green),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                }),
      ),
    );
  }

  Widget _timeDivider(Timestamp time) {
    DateTime t = time.toDate();
    String minute =
        t.minute > 9 ? t.minute.toString() : '0' + t.minute.toString();
    String ampm = t.hour >= 12 ? "PM" : "AM";
    int hour = t.hour >= 12 ? t.hour % 12 : t.hour;
    DateTime press = DateTime.now();
    if (press.year == t.year && press.month == t.month && press.day == t.day)
      return Text(hour.toString() + ':' + minute + ' ' + ampm);
    return Text(t.day.toString() +
        '/' +
        (t.month + 1).toString() +
        '/' +
        t.year.toString());
  }
}
