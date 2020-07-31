import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart';
import 'package:loading_animations/loading_animations.dart';

import 'package:smartfarmingservices/src/Services/CropManager.dart';
import 'package:smartfarmingservices/src/Services/httpServices.dart';

import 'CropSearch.dart';
import 'EachItemPage.dart';
import 'Model/crop_model.dart';

class CropInfoDisplay extends StatefulWidget {
  @override
  _CropInfoDisplayState createState() => _CropInfoDisplayState();
}

class _CropInfoDisplayState extends State<CropInfoDisplay> {
  final HttpServices httpServices = HttpServices();
  final CropManager cropManager = new CropManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: cropManager.cropListView,
          builder: (context, AsyncSnapshot<List<CropModel>> snapshot) {
            if (snapshot.hasData) {
              List<CropModel> cropsList = snapshot.data;

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          showSearch(context: context, delegate: CropSearch());
                        },
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black38),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Search"),
                                Icon(Icons.search),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemCount: cropsList.length,
                          itemBuilder: (context, index) {
//                            CropModel _cropIndex = ;
                            return GestureDetector(
//                              onLongPress: () async {
//                                showSnackBar() {
//                                  Scaffold.of(context).showSnackBar(SnackBar(
//                                    content:
//                                        Text('Item Deleted from the Database'),
//                                    duration: Duration(seconds: 3),
//                                  ));
//                                }
//
//                                final ConfirmAction action =
//                                    await _asyncConfirmDialog(context);
//
//                                if ('$action' ==
//                                    ConfirmAction.values[1].toString()) {
//                                  Response response;
//                                  response = await delete(
//                                          "${HttpServices.url}/${cropsList[index].Crop_name}")
//                                      .whenComplete(() {
//                                    showSnackBar();
//                                  });
//                                }
//                              },
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return EachItemPage(
                                    name: cropsList[index].Crop_name,
                                    images:
                                        "${HttpServices.url}/${cropsList[index].Crop_name}/image",
                                  );
                                }));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GridTile(
                                  child: Image.network(
                                    "${HttpServices.url}/${cropsList[index].Crop_name}/image",
                                    fit: BoxFit.cover,
                                  ),
                                  footer: Container(
                                    height: 40,
                                    color: Colors.black38,
                                    child: Center(
                                      child: Text(
                                        cropsList[index].Crop_name,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontFamily: 'Varela'),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              );
            } else
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
          }),
    );
  }
}

//enum ConfirmAction { Cancel, Accept }
//Future<ConfirmAction> _asyncConfirmDialog(BuildContext context) async {
//  return showDialog<ConfirmAction>(
//    context: context,
//    barrierDismissible: false, // user must tap button for close dialog!
//    builder: (BuildContext context) {
//      return AlertDialog(
//        title: Text('Delete This Product'),
//        content: const Text('This will delete the Product from your Database.'),
//        actions: <Widget>[
//          FlatButton(
//            child: const Text('Cancel'),
//            onPressed: () {
//              Navigator.of(context).pop(ConfirmAction.Cancel);
//            },
//          ),
//          FlatButton(
//            child: const Text('Delete'),
//            onPressed: () async {
//              Navigator.of(context).pop(ConfirmAction.Accept);
//            },
//          )
//        ],
//      );
//    },
//  );
//}
