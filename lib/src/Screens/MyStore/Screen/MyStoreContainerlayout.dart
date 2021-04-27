import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:smartfarmingservices/src/Screens/MyStore/Screen/ProductDetail.dart';
import 'package:smartfarmingservices/src/Services/CropManager.dart';
import 'package:smartfarmingservices/src/Services/httpServices.dart';
import 'package:toast/toast.dart';

import '../Model/product.dart';
import 'Kart.dart';
import 'ProductSearch.dart';

class MyStoreContainerLayout extends StatefulWidget {
  @override
  _MyStoreContainerLayoutState createState() => _MyStoreContainerLayoutState();
}

class _MyStoreContainerLayoutState extends State<MyStoreContainerLayout> {
  CropManager cropManager = CropManager();
  List<String> filterParamenter = <String>[' Location'];
  List<Product> kartProduct = [];

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
            stream: cropManager.productListView,
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
                                // Navigator.of(context)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   return ItemDetail(
                                //     image:
                                //     "${HttpServices.itemsUrl}/${buyProduct.Crop_name_store}/image",
                                //     name: buyProduct.Crop_name_store.toString()
                                //         .toUpperCase(),
                                //     location: buyProduct.Location_store,
                                //     Category: buyProduct.Category_store,
                                //     Detail: buyProduct.Detail_store,
                                //     Price: buyProduct.Cost_store,
                                //     rating: buyProduct.Rating_store.toString(),
                                //   );
                                // }));
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
                                        MediaQuery.of(context).size.height / 4,
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
                                                Align(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 32.0,
                                                            bottom: 10),
                                                    child: Material(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      elevation: 10,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          // print(
                                                          //     "${buyProduct.Crop_name_store.toString()} Product added");
                                                          // kartProduct
                                                          //     .add(buyProduct);
                                                          // Toast.show(
                                                          //     "${buyProduct.Crop_name_store} Product added",
                                                          //     context,
                                                          //     duration: Toast
                                                          //         .LENGTH_SHORT,
                                                          //     gravity:
                                                          //         Toast.BOTTOM);
                                                        },
                                                        child: IconButton(
                                                          icon: Icon(Icons
                                                              .add_shopping_cart),
                                                          onPressed: () {
                                                            print(
                                                                "${buyProduct.Crop_name_store.toString()} Product added");
                                                            kartProduct.add(
                                                                buyProduct);
                                                            Toast.show(
                                                                "${buyProduct.Crop_name_store} Product added",
                                                                context,
                                                                duration: Toast
                                                                    .LENGTH_SHORT,
                                                                gravity: Toast
                                                                    .BOTTOM);

                                                            // Navigator.push(context,
                                                            //     MaterialPageRoute(builder: (context) {
                                                            //       return Kart(
                                                            //         image: widget.image,
                                                            //         location: widget.location,
                                                            //         name: widget.name,
                                                            //         Price: widget.Price,
                                                            //       );
                                                            //     }));
                                                          },
                                                          color: Colors.black,
                                                        ),

//                                                         child: Container(
//                                                           height: 10,
//                                                           width: 10,
//                                                           decoration:
//                                                               BoxDecoration(
//                                                                   borderRadius:
//                                                                       BorderRadius
//                                                                           .circular(
//                                                                               20),
// //                                gradient: kGradientColor,
//                                                                   color: Colors
//                                                                       .green),
//                                                           child:  ),
                                                      ),
                                                    ),
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
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FloatingActionButton(
                            child: Icon(Icons.add_shopping_cart_outlined),
                            onPressed: () {
                              print('List len : ' +
                                  kartProduct.length.toString());
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Kart(
                                  kartProduct: kartProduct,

                                  // image: widget.image,
                                  // location: widget.location,
                                  // name: widget.name,
                                  // Price: widget.Price,
                                );
                              }));
                            }),
                      ),
                    )
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
