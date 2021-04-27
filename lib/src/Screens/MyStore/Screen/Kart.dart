import 'package:flutter/material.dart';
import 'package:smartfarmingservices/src/Resources/Style/styles.dart';
import 'package:smartfarmingservices/src/Screens/MyStore/Model/product.dart';
import 'package:smartfarmingservices/src/Screens/MyStore/Screen/buyAddress.dart';

class Kart extends StatefulWidget {
  final List<Product> kartProduct;

  const Kart({Key key, this.kartProduct}) : super(key: key);
  @override
  _KartState createState() => _KartState();
}

class _KartState extends State<Kart> {
  int i = 1;
  double sum = 0;
  // List<Product> kartproducts;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // kartproducts = widget.kartProduct;
    setState(() {
      for (int i = 0; i < widget.kartProduct.length; i++) {
        sum = sum + widget.kartProduct[i].Cost_store;
      }
      print("Sum of cost is " + sum.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    // kartproducts = widget.kartProduct;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: kGradientColor,
          ),
        ),
        elevation: 0.6,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Cart",
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.shopping_cart, color: Colors.black),
        //     onPressed: () {
        //       Navigator.push(context, MaterialPageRoute(builder: (context) {
        //         return Kart();
        //       }));
        //     },
        //   ),
        // ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: widget.kartProduct.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Card(
                      elevation: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        height: MediaQuery.of(context).size.height / 6,
                        width: MediaQuery.of(context).size.width,
                        child: Expanded(
                          child: Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.grey[100],
                              )
                            ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  widget.kartProduct[index].Crop_name_store
                                      .toUpperCase(),
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      fontSize: 30,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "₹" +
                                      widget.kartProduct[index].Cost_store
                                          .toString(),
                                  style: TextStyle(
                                    fontFamily: 'Varela',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                    child: Text(
                                      widget.kartProduct[index].Location_store,
                                      style: TextStyle(
                                        fontFamily: 'OpenSans',
                                        fontSize: 14,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                    alignment: Alignment.bottomCenter,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                gradient: kGradientColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("Total: ${sum}",
                        style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return BuyAddress();
                        }));
                      },
                      child: Chip(
                        padding: EdgeInsets.all(10),
                        label: Text('Buy',
                            style: TextStyle(
                                fontFamily: 'Varela',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
