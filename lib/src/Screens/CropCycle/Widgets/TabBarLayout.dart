import 'package:flutter/material.dart';

class TabBarProduct {
  String name;
//      imagelink;

  TabBarProduct(
    this.name,
//  this.imagelink,
  );
}

class Item extends StatefulWidget {
//  TabBarProduct obj;
  String obj;
  Item(this.obj);

  @override
  _ItemState createState() => _ItemState(obj);
}

class _ItemState extends State<Item> {
//  TabBarProduct obj;
  String obj;
  _ItemState(this.obj);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
//          Padding(
//            padding: const EdgeInsets.only(top: 8),
//            child: Container(
//              height: 40,
//              child: Image.asset(obj.imagelink),
//            ),
//          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              child: Text(
                obj,
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
