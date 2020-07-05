import 'package:flutter/material.dart';
import 'package:smartfarmingservices/src/Screens/CropCycle/Model/TabBar/TBproduct.dart';

class TBProductItem extends StatelessWidget {
  TBProduct tbproduct;
  TBProductItem(this.tbproduct);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(tbproduct.imageUrl),
      ),
      footer: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Container(
          // padding: EdgeInsets.all(10),
          color: Colors.black38,
          child: Text(
            tbproduct.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
