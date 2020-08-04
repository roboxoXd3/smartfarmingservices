import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';


import 'package:smartfarmingservices/src/Screens/MyStore/Model/product.dart';
import 'package:smartfarmingservices/src/Services/CropManager.dart';
import 'package:smartfarmingservices/src/Services/httpServices.dart';

import 'ProductDetail.dart';

class ProductSearch extends SearchDelegate {
  final HttpServices httpServices = HttpServices();
  final CropManager cropManager = new CropManager();

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return (query.length < 3)
        ? Center(
            child: Text("Type more than 3 letters to search"),
          )
        : StreamBuilder(
            stream: cropManager.filteredproductListView(query: query),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Product> productList = snapshot.data;

                return Container(
                  child: ListView.builder(
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
                              height: MediaQuery.of(context).size.height / 6,
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
                                    height: MediaQuery.of(context).size.height,
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
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
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Container(
                                              child: Text(
                                                buyProduct.Location_store,
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
                      );
                    },
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
            });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Container();
  }
}
