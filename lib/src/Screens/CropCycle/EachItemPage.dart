import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

import 'package:http_parser/http_parser.dart';

import 'package:http/http.dart' as http;
import 'package:smartfarmingservices/src/Resources/Style/styles.dart';
import 'package:smartfarmingservices/src/Services/Dialog.dart';

// import 'package:sft_admin/widgets/Reusable.dart';

class EachItemPage extends StatefulWidget {
  String name;
  String images;
//  bool downloading;
//
//  String overview = "", category = "", growthStages = "", possibleDiseases = "";
//
//  ///weather condition table part
//  String temperature = "";
//  String humidity = "";
//  String moisture = "";
//  String pH = "";
////
//  ///chemical table part
//  String nitrogen = "";
//  String phosphorus = "";
//  String potash = "";
//  String urea = "";
//
//  ///crop result tabledata
//  String farmArea = "";
//  String investmentcost = "";
//  String marketrates = "";
//  String productioncost = "";
//  String seedshown = "";
//  String totalprouctivity = "";

  EachItemPage({@required this.name, this.images});

  @override
  _EachItemPageState createState() => _EachItemPageState();
}

class _EachItemPageState extends State<EachItemPage> {
  final String url = "http://1f7f24cf9ee7.ngrok.io/product";
  final String postUrl = "http://1f7f24cf9ee7.ngrok.io/crop";

  final myController = TextEditingController();
  List newValues = new List();
  var dir;
  String filename;
  var path;
  var imageId;

  Future category;
  final _formKey = GlobalKey<FormState>();
  Map value;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
//  Crops data;

  Future listCategory() async {
    http.Response response;
    response = await http.get("${url}/${widget.name}");

    if (response.statusCode == 200) {
      value = json.decode(response.body);
    }
  }

  @override
  void initState() {
    super.initState();
    category = listCategory();
//    downloadFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: category,
          builder: (context, snapshot) {
            return (value == null)
                ? Center(
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
                  )
                : Scaffold(
                    body: SafeArea(
                      child: NestedScrollView(
                        headerSliverBuilder:
                            (BuildContext context, bool innerBoxIsScrolled) {
                          return <Widget>[
                            SliverAppBar(
                              expandedHeight: 300.0,
                              floating: false,
                              pinned: true,
                              flexibleSpace: Container(
                                decoration:
                                    BoxDecoration(gradient: kGradientColor),
                                child: FlexibleSpaceBar(
                                  centerTitle: true,
                                  title: Text(
                                    "${widget.name.toString().toUpperCase()}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Varela'),
                                  ),
                                  background: Container(
                                    padding: EdgeInsets.all(4),
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height / 2,
                                    child: (widget.images != null)
                                        ? Image.network(
                                            widget.images,
                                            fit: BoxFit.fill,
                                          )
                                        : Chip(
                                            label:
                                                Text("Fetching the image..."),
                                          ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 4,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ];
                        },
                        body: Expanded(
                          child: SingleChildScrollView(
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      Card(
                                        color: Colors.green,
                                        child: ExpansionTile(
                                          title: Text("Overview"),
                                          children: [
                                            Text(
                                              value['Overview'].toString(),
                                              maxLines: 6,
                                            )
                                          ],
                                        ),
                                      ),
                                      Card(
                                        color: Colors.green,
                                        child: ExpansionTile(
                                          title: Text("Location"),
                                          children: [
                                            Text(
                                              value['Location'].toString(),
                                              maxLines: 6,
                                            )
                                          ],
                                        ),
                                      ),
                                      Card(
                                        color: Colors.green,
                                        child: ExpansionTile(
                                          title: Text("Growth Stages"),
                                          children: [
                                            Text(
                                              value['Crop_cycle'].toString(),
                                              maxLines: 6,
                                            )
                                          ],
                                        ),
                                      ),
                                      Card(
                                        color: Colors.green,
                                        child: ExpansionTile(
                                          title: Text("Possible_diseases"),
                                          children: [
                                            Text(
                                              value['Possible_disease']
                                                  .toString(),
                                              maxLines: 6,
                                            )
                                          ],
                                        ),
                                      ),
                                      Card(
                                        color: Colors.green,
                                        child: ExpansionTile(
                                          title: Text(
                                              "Favourable Weather Condition"),
                                          children: [
                                            DataTable(columns: [
                                              DataColumn(
                                                label: Text(
                                                  'Parameter',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black,
                                                      fontSize: 15),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Text(
                                                  'Value',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black,
                                                      fontSize: 15),
                                                ),
                                              ),
                                            ], rows: [
                                              DataRow(cells: [
                                                DataCell(Text(
                                                  'Temperature',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    // _displayDialog(context);
                                                  },
                                                  child: Text(
                                                      value['Temperature']
                                                          .toString()),
                                                )),
                                              ]),
                                              DataRow(cells: [
                                                DataCell(Text(
                                                  'Humidity',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    // _displayDialog(context);
                                                  },
                                                  child: Text(value['Humidity']
                                                      .toString()),
                                                )),
                                              ]),
                                              DataRow(cells: [
                                                DataCell(Text(
                                                  'Moisture',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    // _displayDialog(context);
                                                  },
                                                  child: Text(value['Moisture']
                                                      .toString()),
                                                )),
                                              ]),
                                              DataRow(cells: [
                                                DataCell(Text(
                                                  'Ph_value',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    // _displayDialog(context);
                                                  },
                                                  child: Text(value['Ph_value']
                                                      .toString()),
                                                )),
                                              ]),
                                            ]),
                                          ],
                                        ),
                                      ),
                                      Card(
                                        color: Colors.green,
                                        child: ExpansionTile(
                                          title: Text("Fertilizers/Nutrients"),
                                          children: [
                                            DataTable(columns: [
                                              DataColumn(
                                                label: Text(
                                                  'Parameter',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black,
                                                      fontSize: 15),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Text(
                                                  'Value',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black,
                                                      fontSize: 15),
                                                ),
                                              ),
                                            ], rows: [
                                              DataRow(cells: [
                                                DataCell(Text(
                                                  'Nitrogen',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    // _displayDialog(context);
                                                  },
                                                  child: Text(value['Nitrogen']
                                                      .toString()),
                                                )),
                                              ]),
                                              DataRow(cells: [
                                                DataCell(Text(
                                                  'Phosphorus',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    // _displayDialog(context);
                                                  },
                                                  child: Text(
                                                      value['Phosphorus']
                                                          .toString()),
                                                )),
                                              ]),
                                              DataRow(cells: [
                                                DataCell(Text(
                                                  'Potash',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    // _displayDialog(context);
                                                  },
                                                  child: Text(value['Potash']
                                                      .toString()),
                                                )),
                                              ]),
                                              DataRow(cells: [
                                                DataCell(Text(
                                                  'Urea',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                                DataCell(GestureDetector(
                                                    onTap: () {
                                                      // _displayDialog(context);
                                                    },
                                                    child: Text(value['Urea']
                                                        .toString()))),
                                              ]),
                                            ]),
                                          ],
                                        ),
                                      ),
                                      Card(
                                        color: Colors.green,
                                        child: ExpansionTile(
                                          title: Text("Crop Result"),
                                          children: [
                                            DataTable(columns: [
                                              DataColumn(
                                                label: Text(
                                                  'Parameter',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black,
                                                      fontSize: 15),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Text(
                                                  'Value',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black,
                                                      fontSize: 15),
                                                ),
                                              ),
                                            ], rows: [
                                              DataRow(cells: [
                                                DataCell(Text(
                                                  'Area_of_farm',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    // _displayDialog(context);
                                                  },
                                                  child: Text(
                                                      value['Area_of_farm']
                                                          .toString()),
                                                )),
                                              ]),
                                              DataRow(cells: [
                                                DataCell(Text(
                                                  'Investment_cost',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    // _displayDialog(context);
                                                  },
                                                  child: Text(
                                                      value['Investment_cost']
                                                          .toString()),
                                                )),
                                              ]),
                                              DataRow(cells: [
                                                DataCell(Text(
                                                  'Average_market_rates',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    // _displayDialog(context);
                                                  },
                                                  child: Text(value[
                                                          'Average_market_rates']
                                                      .toString()),
                                                )),
                                              ]),
                                              DataRow(cells: [
                                                DataCell(Text(
                                                  'Production_Cost',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    // _displayDialog(context);
                                                  },
                                                  child: Text(
                                                      value['Production_Cost']
                                                          .toString()),
                                                )),
                                              ]),
                                              DataRow(cells: [
                                                DataCell(Text(
                                                  'Seed_Sown',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    // _displayDialog(context);
                                                  },
                                                  child: Text(value['Seed_Sown']
                                                      .toString()),
                                                )),
                                              ]),
                                              DataRow(cells: [
                                                DataCell(Text(
                                                  'Total_productivity',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                                DataCell(GestureDetector(
                                                  onTap: () {
                                                    // _displayDialog(context);
                                                  },
                                                  child: Text(value[
                                                          'Total_productivity']
                                                      .toString()),
                                                )),
                                              ]),
                                            ]),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

//                                    RaisedButton(
//                                      onPressed: putData,
//                                      child: Text("SaveData"),
//                                    )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
          }),
    );
  }

//  displayDialog(BuildContext context) async {
//    return showDialog(
//        context: context,
//        builder: (context) {
//          return AlertDialog(
//            title: Text('Enter the new Value'),
//            content: TextField(
//              // controller: myController,
//              decoration: InputDecoration(hintText: "Enter Value here"),
//            ),
//            actions: <Widget>[
//              new FlatButton(
//                child: new Text('SUBMIT'),
//                onPressed: () {
//                  widget.name = myController.text;
//                  Dialogs.showLoadingDialog(context, _keyLoader);
////                  putData();
//                  // newValues.add(myController.text);
//                  // print(newValues);
//                  Navigator.of(context).pop();
//                  // myController.clear();
//                },
//              )
//            ],
//          );
//        });
//  }

}
