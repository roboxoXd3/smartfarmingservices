import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
//      elevation: 100,
      child: Container(
        decoration: BoxDecoration(),
        height: MediaQuery.of(context).size.height / 16,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                child: Container(
                  height: double.infinity,
                  child: Center(
                    child: Text(
                      'ADD TO CART',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 20,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                ),
                onTap: () {},
              ),
            ),
            Expanded(
              child: GestureDetector(
                child: Container(
                  color: Color(0xFFF17532),
                  child: Center(
                    child: Text(
                      'BUY NOW',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 20,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
