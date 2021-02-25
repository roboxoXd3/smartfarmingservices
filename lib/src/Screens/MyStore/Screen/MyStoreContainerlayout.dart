
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:smartfarmingservices/src/Screens/MyStore/Screen/ProductDetail.dart';
import 'package:smartfarmingservices/src/Services/CropManager.dart';
import 'package:smartfarmingservices/src/Services/httpServices.dart';

import '../Model/product.dart';
import 'ProductSearch.dart';

class MyStoreContainerLayout extends StatefulWidget {
  @override
  _MyStoreContainerLayoutState createState() => _MyStoreContainerLayoutState();
}

class _MyStoreContainerLayoutState extends State<MyStoreContainerLayout> {
  CropManager _cropManager = CropManager();
  List<String> filterParamenter = <String>[
   ' Location'
  ];

  @override
  void initState() {
    // TODO: implement initState
//    Category = listCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: _cropManager.productListView,
            builder:
                (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
              if (snapshot.hasData) {
                List<Product> productList = snapshot.data;
                return Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            showSearch(
                                context: context, delegate: ProductSearch());
                          },
                          child: Stack(
                            children: [
                              Container(
                                height: 60,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black38),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
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
//                            physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: productList.length,
                          itemBuilder: (BuildContext context, int index) {
                            Product buyProduct = productList[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return ItemDetail(
                                    image:
                                    "${HttpServices.itemsUrl}/${buyProduct.Crop_name_store}/image",
                                    name: buyProduct.Crop_name_store.toString()
                                        .toUpperCase(),
                                    location: buyProduct.Location_store,
                                    Category: buyProduct.Category_store,
                                    Detail: buyProduct.Detail_store,
                                    Price: buyProduct.Cost_store,
                                    rating: buyProduct.Rating_store.toString(),
                                  );
                                }));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Card(
                                  elevation: 10,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    height:
                                    MediaQuery.of(context).size.height / 6,
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          decoration: new BoxDecoration(
                                              image: new DecorationImage(
                                                fit: BoxFit.fill,
                                                image: new NetworkImage(
                                                    "${HttpServices.itemsUrl}/${buyProduct.Crop_name_store}/image"),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.white10,
                                                )
                                              ]),
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width: MediaQuery.of(context)
                                              .size
                                              .width /
                                              2.5,
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration:
                                            BoxDecoration(boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey[100],
                                              )
                                            ]),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  "₹" +
                                                      buyProduct.Cost_store
                                                          .toString(),
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
                                                  buyProduct.Crop_name_store
                                                      .toUpperCase(),
                                                  style: TextStyle(
                                                      fontFamily: 'Varela',
                                                      fontSize: 20,
                                                      fontStyle:
                                                      FontStyle.normal,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      left: 8.0),
                                                  child: Container(
                                                    child: Text(
                                                      buyProduct.Location_store,
                                                      style: TextStyle(
                                                        fontFamily: 'OpenSans',
                                                        fontSize: 14,
                                                        fontStyle:
                                                        FontStyle.normal,
                                                      ),
                                                    ),
                                                    alignment:
                                                    Alignment.bottomCenter,
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
                            );
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
            }));
  }
}
