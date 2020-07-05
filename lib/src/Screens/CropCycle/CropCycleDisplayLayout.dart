import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartfarmingservices/src/Resources/ImageLink/ImageLink.dart';
import 'TabBarView.dart' as tbbarview;
import 'TabBarLayout.dart' as tblayout;

class CropCycleDisplay extends StatefulWidget {
  @override
  _CropCycleDisplayState createState() => _CropCycleDisplayState();
}

class _CropCycleDisplayState extends State<CropCycleDisplay>
    with SingleTickerProviderStateMixin {
  TabController tabController;

//  Post post;

  final items = [
//    Data('Grains', 'asset/images/grains.png'),
    tblayout.Data('Fruit', fruit),
    tblayout.Data('Vegetable', vegetable),
    tblayout.Data('Cereals', cereals),
    tblayout.Data('Fruit', fruit),
    tblayout.Data('Vegetable', vegetable),
    tblayout.Data('Cereals', cereals),
    tblayout.Data('Fruit', fruit),
    tblayout.Data('Vegetable', vegetable),
    tblayout.Data('Cereals', cereals),
  ];

  final itemsgrid = [
    tbbarview.Datagrid('Fruits', fruit),
    tbbarview.Datagrid('Vegetable', vegetable),
    tbbarview.Datagrid('Cereals', cereals),
    tbbarview.Datagrid('Fruits', fruit),
    tbbarview.Datagrid('Vegetable', vegetable),
    tbbarview.Datagrid('Cereals', cereals),
    tbbarview.Datagrid('Fruits', fruit),
    tbbarview.Datagrid('Vegetable', vegetable),
    tbbarview.Datagrid('Cereals', cereals),
  ];

  @override
  void initState() {
    tabController = new TabController(length: items.length, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  Widget buildMe(tblayout.Data x) =>
      new tblayout.Item(x); //item is for creating each item of tabBar.
  Widget buildgrid(tbbarview.Datagrid x) => new tbbarview.GridViewLayout(
      x); //GridViewLayout is to create each item of the GridView.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 15,
        backgroundColor: Colors.green,
        onPressed: () {},
        child: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {},
        ),
      ),
      backgroundColor: Color(0xfff5f5f5),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Card(
              elevation: 2,
              child: Container(
                margin: EdgeInsets.all(8.0),
                color: Colors.white,
                child: TabBar(
                  isScrollable: true,
                  controller: tabController,
                  tabs: items.map((e) => buildMe(e)).toList(),
                ),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                GridView.count(
                    crossAxisCount: 3,
                    children: itemsgrid.map((e) => buildgrid(e)).toList()),
                GridView.count(
                    crossAxisCount: 3,
                    children: itemsgrid.map((e) => buildgrid(e)).toList()),
                GridView.count(
                    crossAxisCount: 3,
                    children: itemsgrid.map((e) => buildgrid(e)).toList()),
                GridView.count(
                    crossAxisCount: 3,
                    children: itemsgrid.map((e) => buildgrid(e)).toList()),
                GridView.count(
                    crossAxisCount: 3,
                    children: itemsgrid.map((e) => buildgrid(e)).toList()),
                GridView.count(
                    crossAxisCount: 3,
                    children: itemsgrid.map((e) => buildgrid(e)).toList()),
                GridView.count(
                    crossAxisCount: 3,
                    children: itemsgrid.map((e) => buildgrid(e)).toList()),
                GridView.count(
                    crossAxisCount: 3,
                    children: itemsgrid.map((e) => buildgrid(e)).toList()),
                GridView.count(
                    crossAxisCount: 3,
                    children: itemsgrid.map((e) => buildgrid(e)).toList()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
