import 'package:flutter/material.dart';
import 'package:smartfarmingservices/src/Resources/Style/styles.dart';
import 'package:smartfarmingservices/src/Screens/HomePage/DisplayHomePage/Screens/MyHomePage/ReusableHeading.dart';
import 'TabBarView.dart';
import 'EachitemPageLayout.dart';

class EachItemPage extends StatefulWidget {
  Datagrid obj;
  EachItemPage(this.obj, this.myList);
  List<DataItem> myList;

  @override
  _EachItemPageState createState() => _EachItemPageState();
}

class _EachItemPageState extends State<EachItemPage> {
  List itemImage = [
    'asset/images/vegetableImagesItem.png',
    'asset/images/fruitsImageitem.png',
    'asset/images/barleyImageItem.png',
    'asset/images/vegetableImagesItem.png',
    'asset/images/fruitsImageitem.png',
    'asset/images/barleyImageItem.png',
    'asset/images/vegetableImagesItem.png',
    'asset/images/fruitsImageitem.png',
    'asset/images/barleyImageItem.png',
  ];

  List<TileType> tiletype = [
    TileType('Overview', 'para'),
    TileType('Growth cycle', 'list'),
    TileType('Favorable weather conditions', 'table'),
    TileType('Suitable pesticides and fertilizers', 'table'),
    TileType('Possible diseases', 'list'),
    TileType('Crop results', 'table'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.4,
        title: Text(
          widget.obj.name,
          style: TextStyle(fontFamily: 'Varela'),
        ),
        flexibleSpace: kAppBarContainer,
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 3,
            child: Image.asset(
              widget.obj.imagelink,
//              widget.obj.bigImagelink,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                width: 4,
                color: Colors.grey[400],
              ),
            ),
          ),
          ReusableHeadingCard(
            name: "${widget.obj.name} Info",
          ),
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: tiletype.map(
                    (tt) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Card(
                          elevation: 3,
                          child: ExpansionTile(
                            title: Text(
                              tt.title,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  // fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w500),
                            ),
                            backgroundColor: Colors.green[50],
                            children: [
                              Container(
                                child: (tt.inputType == "para")
                                    ? Container(
                                        padding: EdgeInsets.all(4),
                                        child: Text(
                                          kOverView,
                                          style: TextStyle(
                                            fontFamily: 'Varela',
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      )
                                    : (tt.inputType == "list")
                                        ? Container(
                                            height: 250,
                                            child: (tt.title == "Growth cycle")
                                                ? ListView.builder(
                                                    itemCount:
                                                        kGrowthCycle.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Container(
                                                        margin:
                                                            EdgeInsets.all(5.0),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    10.0),
                                                        child: Text(
                                                          "${index + 1}" +
                                                              ")" +
                                                              " " +
                                                              kGrowthCycle[
                                                                  index],
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Varela',
                                                            fontSize: 15.0,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                        ),
                                                      );
                                                    },
                                                  )
                                                : ListView.builder(
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: kDiseases.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Container(
                                                        margin:
                                                            EdgeInsets.all(5.0),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    10.0),
                                                        child: Text(
                                                          "${index + 1}" +
                                                              ")" +
                                                              " " +
                                                              kDiseases[index],
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Varela',
                                                            fontSize: 15.0,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                          )
                                        : Container(
                                            height: 400,
                                            child: (tt.title == "Crop results")
                                                ? DataTable(
                                                    columns: [
                                                      DataColumn(
                                                        label: Text(
                                                          "Parameter",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Varela',
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                      DataColumn(
                                                        label: Text(
                                                          "Value",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Varela',
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      )
                                                    ],
                                                    rows: [
                                                      DataRow(
                                                        cells: [
                                                          DataCell(
                                                            Text(
                                                                "Area of farm (hector)"),
                                                          ),
                                                          DataCell(
                                                            Text(""),
                                                          ),
                                                        ],
                                                      ),
                                                      DataRow(
                                                        cells: [
                                                          DataCell(
                                                            Text(
                                                                "Seed shown (in kg)"),
                                                          ),
                                                          DataCell(
                                                            Text(""),
                                                          ),
                                                        ],
                                                      ),
                                                      DataRow(
                                                        cells: [
                                                          DataCell(
                                                            Text(
                                                                "Total productivity (in kg)"),
                                                          ),
                                                          DataCell(
                                                            Text(""),
                                                          ),
                                                        ],
                                                      ),
                                                      DataRow(
                                                        cells: [
                                                          DataCell(
                                                            Text(
                                                                "Investment Cost"),
                                                          ),
                                                          DataCell(
                                                            Text(""),
                                                          ),
                                                        ],
                                                      ),
                                                      DataRow(
                                                        cells: [
                                                          DataCell(
                                                            Text(
                                                                "Production cost"),
                                                          ),
                                                          DataCell(
                                                            Text(""),
                                                          ),
                                                        ],
                                                      ),
                                                      DataRow(
                                                        cells: [
                                                          DataCell(
                                                            Text(
                                                                "Average  market rates"),
                                                          ),
                                                          DataCell(
                                                            Text(""),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                : (tt.title ==
                                                        "Favorable weather conditions")
                                                    ? DataTable(
                                                        columns: [
                                                          DataColumn(
                                                            label: Text(
                                                              "Parameter",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'Varela',
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                          DataColumn(
                                                              label: Text(
                                                            "Value",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Varela',
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ))
                                                        ],
                                                        rows: [
                                                          DataRow(
                                                            cells: [
                                                              DataCell(
                                                                Text(
                                                                    "Temperature"),
                                                              ),
                                                              DataCell(
                                                                Text(""),
                                                              ),
                                                            ],
                                                          ),
                                                          DataRow(
                                                            cells: [
                                                              DataCell(
                                                                Text(
                                                                    "Humidity"),
                                                              ),
                                                              DataCell(
                                                                Text(""),
                                                              ),
                                                            ],
                                                          ),
                                                          DataRow(
                                                            cells: [
                                                              DataCell(
                                                                Text(
                                                                    "Moisture"),
                                                              ),
                                                              DataCell(
                                                                Text(""),
                                                              ),
                                                            ],
                                                          ),
                                                          DataRow(
                                                            cells: [
                                                              DataCell(
                                                                Text(
                                                                    "pH Value"),
                                                              ),
                                                              DataCell(
                                                                Text(""),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    : DataTable(
                                                        columns: [
                                                          DataColumn(
                                                            label: Text(
                                                              "Fertilizer/Nutrients",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'Varela',
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                          DataColumn(
                                                            label: Text(
                                                              "Requirement(kg/acre)",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'Varela',
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          )
                                                        ],
                                                        rows: [
                                                          DataRow(
                                                            cells: [
                                                              DataCell(
                                                                Text("Urea"),
                                                              ),
                                                              DataCell(
                                                                Text(""),
                                                              ),
                                                            ],
                                                          ),
                                                          DataRow(
                                                            cells: [
                                                              DataCell(
                                                                Text(
                                                                    "Nitrogen"),
                                                              ),
                                                              DataCell(
                                                                Text(""),
                                                              ),
                                                            ],
                                                          ),
                                                          DataRow(
                                                            cells: [
                                                              DataCell(
                                                                Text(
                                                                    "Phosphorus"),
                                                              ),
                                                              DataCell(
                                                                Text(""),
                                                              ),
                                                            ],
                                                          ),
                                                          DataRow(
                                                            cells: [
                                                              DataCell(
                                                                Text("Potash"),
                                                              ),
                                                              DataCell(
                                                                Text(""),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                          ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TileType {
  final String title;
  final String inputType;
  TileType(this.title, this.inputType);
}
