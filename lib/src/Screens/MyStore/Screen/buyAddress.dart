import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:smartfarmingservices/src/Resources/Style/styles.dart';
import 'package:smartfarmingservices/src/Screens/HomePage/MainHomePage/Display/homepage.dart';

import 'MyStoreContainerlayout.dart';

class BuyAddress extends StatefulWidget {
  @override
  _BuyAddressState createState() => _BuyAddressState();
  final _formkey = GlobalKey<FormState>();
}

class _BuyAddressState extends State<BuyAddress> {
  @override
  Widget build(BuildContext context) {
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
        title: Text("Buy",
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Form(
              key: widget._formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    child: Center(
                        child: Text(
                      "Add Info",
                      style: TextStyle(
                          fontSize: 50,
                          fontFamily: 'Varela',
                          fontWeight: FontWeight.w900),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: TextFormField(
                      onSaved: (value) {
                        // setState(() {
                        //   widget.Crop_name_store = value;
                        // });
                      },
                      decoration: InputDecoration(labelText: "Name"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      onSaved: (value) {
                        // setState(() {
                        //   widget.Cost_store = double.parse(value);
                        // });
                      },
                      decoration: InputDecoration(labelText: "Number"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      // maxLength: 10,
                      // onSaved: (value) {
                      // setState(() {
                      //   widget.Cost_store = double.parse(value);
                      // });
                      // },
                      decoration: InputDecoration(labelText: "Email"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: TextFormField(
                      // keyboardType: TextInputType.number,
                      // maxLength: 10,
                      onSaved: (value) {
                        // setState(() {
                        //   widget.Cost_store = double.parse(value);
                        // });
                      },
                      decoration: InputDecoration(labelText: "Address"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: GestureDetector(
                      onTap: () {
                        widget._formkey.currentState.save();
                        CoolAlert.show(
                          context: context,
                          type: CoolAlertType.success,
                          text: "Order Placed Successfully!",
                        ).then((_) => Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) {
                              return MyStoreContainerLayout();
                            })));
                      },
                      child: Material(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        elevation: 10,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: kGradientColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          width: double.infinity,
                          height: 60,
                          child: Center(
                            child: Text(
                              "Buy",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
