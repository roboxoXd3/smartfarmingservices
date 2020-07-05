import 'package:flutter/material.dart';
import 'package:smartfarmingservices/src/Resources/ImageLink/ImageLink.dart';
//import 'EachItemDescription.dart';
import 'EachItemPage.dart';
import 'EachitemPageLayout.dart';

class   Datagrid {
  String name, imagelink;

  Datagrid(
    this.name,
    this.imagelink,
  );
}

class GridViewLayout extends StatefulWidget {
  Datagrid obj;

  GridViewLayout(this.obj);

  @override
  _GridViewLayoutState createState() => _GridViewLayoutState(obj);
}

class _GridViewLayoutState extends State<GridViewLayout> {
  Datagrid obj;
  List<DataItem> myList;
  _GridViewLayoutState(this.obj);

  final itemsgrid = [
    Datagrid(
      'Fruits',
      fruit,
//      'asset/images/vegetableImageItem.png',
    ),
    Datagrid('Vegetable', vegetable
//      'asset/images/vegetablegrid.png',
//      'asset/images/fruitsImageItem.png',
        ),
    Datagrid('Cereals', cereals
//      'asset/images/cerealsgrid.png',
//      'asset/images/barleyImageItem.png',
        ),
    Datagrid('Fruits', fruit
//      'asset/images/fruitsgrid.png',
//      'asset/images/vegetableImageItem.png',
        ),
    Datagrid('Vegetable', vegetable
//      'asset/images/vegetablegrid.png',
//      'asset/images/fruitsImageItem.png',
        ),
    Datagrid('Cereals', cereals
//      'asset/images/cerealsgrid.png',
//      'asset/images/barleyImageItem.png',
        ),
    Datagrid('Fruits', fruit
//      'asset/images/fruitsgrid.png',
//      'asset/images/vegetableImageItem.png',
        ),
    Datagrid('Vegetable', vegetable
//      'asset/images/vegetablegrid.png',
//      'asset/images/fruitsImageItem.png',
        ),
    Datagrid('Cereals', cereals
//      'asset/images/cerealsgrid.png',
//      'asset/images/barleyImageItem.png',
        ),
  ];

//  EachItemDescription eachItemDescription;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 100,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                height: 80,
//                width: 100,
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
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EachItemPage(obj, myList),
          ),
        );
      },
    );
  }
}
