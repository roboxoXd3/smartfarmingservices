import 'package:smartfarmingservices/src/Resources/Constants/constants.dart';
import 'package:smartfarmingservices/src/Resources/ImageLink/ImageLink.dart';
import 'package:smartfarmingservices/src/Screens/CropCycle/Model/TabBar/TBproduct.dart';
import 'package:smartfarmingservices/src/Screens/CropCycle/Widget/TVProduct_item.dart';

import '../Model/TabView/TVproduct.dart';
import 'package:flutter/material.dart';
import '../Widget/TBProduct_item.dart';

class ProductOverView extends StatefulWidget {
  // TBProduct tbproduct

  @override
  _ProductOverViewState createState() => _ProductOverViewState();
}

class _ProductOverViewState extends State<ProductOverView>
    with SingleTickerProviderStateMixin {
  String id;
  String title;
  String imageUrl;

  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: loadedproductsTB.length);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
//  List<String> category = [
//    'Fruits',
//    'Vegetables',
//    'Cereals',
//  ];

  final List<TBProduct> loadedproductsTB = [
    TBProduct(
      id: 'p1',
      imageUrl: fruit,
      name: category[0],
    ),
    TBProduct(
      id: 'p2',
      imageUrl: vegetable,
      name: category[1],
    ),
    TBProduct(
      id: 'p3',
      imageUrl: cereals,
      name: category[2],
    ),
  ];

  List<TVProduct> loadedproductsTV = [
    TVProduct(
      id: 'A1',
      imageUrl: fruit,
      name: "Item 1",
    ),
    TVProduct(
      id: 'A2',
      imageUrl: vegetable,
      name: "Item 2",
    ),
    TVProduct(
      id: 'A3',
      imageUrl: cereals,
      name: "Item 3",
    )
  ];

  Widget buildTab(TBProduct x) => new TBProductItem(x);

  Widget buildTabView(TVProduct x) => new TVProductItem(x);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            child: Column(
          children: [
            Container(
              height: 50,
              child: TabBar(
                controller: tabController,
                tabs: loadedproductsTB.map((e) => buildTab(e)).toList(),
              ),
            ),
            Expanded(
              child: Container(
                child: TabBarView(
                    controller: tabController,
                    children: loadedproductsTV.map((e) {
                      return GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 3,
                        children: loadedproductsTV
                            .map((f) => buildTabView(f))
                            .toList(),
                      );
                    }).toList()),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
