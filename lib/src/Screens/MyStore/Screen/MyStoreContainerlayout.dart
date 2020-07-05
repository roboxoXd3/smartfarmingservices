import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:smartfarmingservices/src/Resources/ImageLink/ImageLink.dart';
import 'package:smartfarmingservices/src/Resources/Style/styles.dart';
import 'package:smartfarmingservices/src/Screens/MyStore/Widget/ProductContainer.dart';
import 'file:///D:/Study%20material/flutter/FreelanceProject/smartfarmingservices/lib/src/Screens/MyStore/Model/product.dart';

class MyStoreContainerLayout extends StatelessWidget {
  final List<Product> items = [
    Product(
      id: '1',
      image: Logo,
      name: "Logo 1",
      price: 1600.0,
//      productInfo: "ye wala logo maine bnaya hai",
      location: "Maruasthal",
    ),
    Product(
      id: '2',
      image: sft,
      name: "Logo 2",
      price: 2000.0,
//      productInfo: "Ye wala logo kisi designer ne bnaya hai",
      location: "Desert",
    ),
    Product(
        id: '3',
        image: profilepicture,
        name: "Logo 3",
        price: 2600.0,
//        productInfo: "Ye ek mast buddhe ki photo hai",
        location: "Registaan"),
    Product(
      id: '1',
      image: Logo,
      name: "Logo 1",
      price: 1600.0,
//      productInfo: "ye wala logo maine bnaya hai",
      location: "Maruasthal",
    ),
    Product(
      id: '2',
      image: sft,
      name: "Logo 2",
      price: 2000.0,
//      productInfo: "Ye wala logo kisi designer ne bnaya hai",
      location: "Desert",
    ),
    Product(
        id: '3',
        image: profilepicture,
        name: "Logo 3",
        price: 2600.0,
//        productInfo: "Ye ek mast buddhe ki photo hai",
        location: "Registaan"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text('My Store'),
//        centerTitle: true,
//        flexibleSpace: kAppBarContainer,
//        actions: [
//          Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: kExpert,
//          ),
//        ],
//        leading: IconButton(
//          icon: Icon(
//            Icons.sort,
//            color: Colors.black,
//          ),
//        ),
////        AppBarItemsContainer(
////          icon: Icons.sort,
////        ),
//      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductContainer(
            items[index].id,
            items[index].image,
            items[index].name,
            items[index].price,
            items[index].location,
          );
        },
      ),
    );
  }
}
