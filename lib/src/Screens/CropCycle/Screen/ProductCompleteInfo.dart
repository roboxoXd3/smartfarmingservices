// import 'package:cropcycle/CropCycle/Model/TabView/TVproduct.dart';
import 'package:flutter/material.dart';

class ProductCompleteInfo extends StatefulWidget {
  const ProductCompleteInfo({Key key, this.name, this.imageUrl})
      : super(key: key);

  @override
  _ProductCompleteInfoState createState() => _ProductCompleteInfoState();
  final String name;
  final String imageUrl;
}

class _ProductCompleteInfoState extends State<ProductCompleteInfo> {
  List<String> cropInfoHeadlines = [
    "Overview",
    "Growth Favourable Condition",
    "Favourable Weather Condition",
    "Suitable Pesticides and Fertilizers",
    "Possible Diseases",
    "Crop Result"
  ];

  _onBackPressed() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(

        ///You better use listView with widgets and "listview.builder", column will surely fuck you on the face.
        body: ListView(
      scrollDirection: Axis.vertical,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 300,
            child: Image.asset(widget.imageUrl),
          ),
        ),
        Container(
          height: 50,
          child: Text(
            "${widget.name} Info",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),
          ),
        ),
        Container(
          height: 800,
          child: ListView.builder(
            itemCount: cropInfoHeadlines.length,
            itemBuilder: (context, index) {
              return ExpansionTile(
                title: Text(cropInfoHeadlines[index]),
                children: [
                  Placeholder(),
                ],
              );
            },
          ),
        ),
      ],
    ));
  }
}
