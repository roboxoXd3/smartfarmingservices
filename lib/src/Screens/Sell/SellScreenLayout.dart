import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smartfarmingservices/src/Resources/Style/styles.dart';

class SellScreenLayout extends StatefulWidget {
  @override
  _SellScreenLayoutState createState() => _SellScreenLayoutState();
}

class _SellScreenLayoutState extends State<SellScreenLayout> {
  String img = 'asset/images/plant.png';
  List<String> Category = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
    'Item9',
  ];

  List<String> CategoryImg = [
    'asset/images/fruitsImageItem.png',
    'asset/images/fruitsImageItem.png',
    'asset/images/fruitsImageItem.png',
    'asset/images/fruitsImageItem.png',
    'asset/images/fruitsImageItem.png',
    'asset/images/fruitsImageItem.png',
    'asset/images/fruitsImageItem.png',
    'asset/images/fruitsImageItem.png',
    'asset/images/fruitsImageItem.png',

//    'asset/images/vegetableImageItem.png',
//    'asset/images/barleyImageItem.png',
//    'asset/images/fruitsImageItem.png',
//    'asset/images/vegetableImageItem.png',
//    'asset/images/barleyImageItem.png',
//    'asset/images/fruitsImageItem.png',
//    'asset/images/vegetableImageItem.png',
//    'asset/images/barleyImageItem.png',
//    'asset/images/fruitsImageItem.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        elevation: 0.4,
//        title: Text(
//          'Sell Item',
//          style: TextStyle(fontSize: 20, color: Colors.white),
//        ),
//        centerTitle: true,
//        flexibleSpace: kAppBarContainer,
//        actions: [
//          Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: kExpert,
//          ),
//        ],
//      ),
      body: Container(
        child: GridView.builder(
          itemCount: Category.length,
//        padding: const EdgeInsets.all(20),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, position) {
            return Center(
              child: GestureDetector(
                child: Card(
                  child: Container(
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(16.0),
                            child: Image.asset(CategoryImg[position]),
                          ),
                        ),
                        Text(Category[position])
                      ],
                    ),
                  ),
                ),
                onTap: () {},
              ),
            );
          },
        ),
      ),
    );
//    return SingleChildScrollView(
//      child: Container(
//        child: SingleChildScrollView(
//          child: SizedBox(
//            height: MediaQuery.of(context).size.height,
//            child: ScrollView(
//              child:
//            ),
//          ),
//        ),
//      ),
//    );
  }
}
