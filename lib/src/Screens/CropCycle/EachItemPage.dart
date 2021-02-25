import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:http/http.dart' as http;

import 'package:smartfarmingservices/src/Resources/Style/styles.dart';
import 'package:smartfarmingservices/src/Services/httpServices.dart';


class EachItemPage extends StatefulWidget {
  String name;
  String images;


  EachItemPage({@required this.name, this.images});

  @override
  _EachItemPageState createState() => _EachItemPageState();
}

class _EachItemPageState extends State<EachItemPage> {
  final String url = HttpServices.getProductList;
  final String postUrl = HttpServices.postUrl;
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
      // appBar: AppBar(
      //   title: Text(
      //     "${widget.name.toString().toUpperCase()}",
      //     style: kTextStyleCrop.copyWith(color: Colors.white, fontSize: 20),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Color(0xff147474),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //
      //       },
      //       icon: Icon(Icons.sort),
      //     ),
      //   ],
      // ),
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
                          BoxDecoration(
                              gradient: kGradientColor),
                          child: FlexibleSpaceBar(
                            centerTitle: true,

                            title: Text(
                              "${widget.name.toString().toUpperCase()}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Varela'),
                            ),
                            background: Container(
                              padding: EdgeInsets.all(4),
                              // color: Colors.black38,
                              width: MediaQuery.of(context).size.width,
                              height:
                              MediaQuery.of(context).size.height / 2,
                              child: Image.network(
                                widget.images,
                                fit: BoxFit.fill,
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
                                    title: Text(
                                      "Overview",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Varela',
                                          fontWeight: FontWeight.bold),
                                    ),
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
                                    title: Text(
                                      "Location",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Varela',
                                          fontWeight: FontWeight.bold),
                                    ),
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
                                    title: Text(
                                      "Growth Stages",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Varela',
                                          fontWeight: FontWeight.bold),
                                    ),
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
                                    title: Text(
                                      "Possible_diseases",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Varela',
                                          fontWeight: FontWeight.bold),
                                    ),
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
                                      "Favourable Weather Condition",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Varela',
                                          fontWeight: FontWeight.bold),
                                    ),
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
                                    title: Text(
                                      "Fertilizers/Nutrients",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Varela',
                                          fontWeight: FontWeight.bold),
                                    ),
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
                                    title: Text(
                                      "Crop Result",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Varela',
                                          fontWeight: FontWeight.bold),
                                    ),
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