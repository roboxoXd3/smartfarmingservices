import 'package:flutter/material.dart';

class ReusableHeadingCard extends StatelessWidget {
  final String name;
  ReusableHeadingCard({@required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.orange[50],
          boxShadow: [
            BoxShadow(
              color: Colors.green,
              blurRadius: 1,
            )
          ]),
      height: 50,
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.only(bottom: 8.0, top: 4.0),
      child: Text(
        name,
        style: TextStyle(
            fontFamily: 'Varela', fontSize: 30, fontWeight: FontWeight.w900),
        textAlign: TextAlign.center,
      ),
      alignment: Alignment.center,
    );
  }
}
