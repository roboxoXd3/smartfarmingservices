import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smartfarmingservices/src/Resources/Style/styles.dart';
import 'package:smartfarmingservices/src/Screens/Sell/ItemDetailPage.dart';

class SellScreenLayout extends StatefulWidget {
  @override
  _SellScreenLayoutState createState() => _SellScreenLayoutState();
}

class _SellScreenLayoutState extends State<SellScreenLayout> {
  String Category = "Category";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              child: Chip(
                  label: Text(
                "Categories",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Varela',
                  fontSize: 30,
                ),
              )),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, position) {
                    return Center(
                      child: GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black38),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              )),
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color:
                                          Colors.blueGrey[400].withOpacity(0.2),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            "https://images.unsplash.com/photo-1472141521881-95d0e87e2e39?ixlib=rb-1."
                                            "2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80",
                                          ),
                                          fit: BoxFit.fill),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      )),
                                ),
                              ),
                              Text(Category)
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ItemDetailPage(
                                        Category_store: Category,
                                      )));
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
