import 'package:flutter/material.dart';
import 'package:smartfarmingservices/src/Screens/CropCycle/Model/TabView/TVproduct.dart';
import 'package:smartfarmingservices/src/Screens/CropCycle/Screen/ProductCompleteInfo.dart';

class TVProductItem extends StatelessWidget {
  final TVProduct tvProduct;
  TVProductItem(this.tvProduct);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ProductCompleteInfo(
              name: tvProduct.name,
              imageUrl: tvProduct.imageUrl,
            );
          }));
        },
        child: GridTile(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(tvProduct.imageUrl),
          ),
          footer: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Container(
              // padding: EdgeInsets.all(10),
              color: Colors.black38,
              child: Text(
                tvProduct.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
