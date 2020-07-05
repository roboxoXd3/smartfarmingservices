import 'package:flutter/material.dart';

class Data {
  String name, imagelink;

  Data(this.name, this.imagelink);
}

class Item extends StatefulWidget {
  Data obj;
  Item(this.obj);
  @override
  _ItemState createState() => _ItemState(obj);
}

class _ItemState extends State<Item> {
  Data obj;
  _ItemState(this.obj);
  @override
  Widget build(BuildContext context) {
    return Container(
//      color: Colors.grey[200],
//      height: MediaQuery.of(context).size.height / 20,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Container(
              height: 40,
              child: Image.asset(obj.imagelink),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              child: Text(
                obj.name,
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
