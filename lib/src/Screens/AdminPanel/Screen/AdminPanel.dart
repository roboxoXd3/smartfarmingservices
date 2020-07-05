import 'package:flutter/material.dart';
import 'package:smartfarmingservices/src/Resources/Constants/constants.dart';
import 'package:smartfarmingservices/src/Resources/Style/styles.dart';

import 'package:smartfarmingservices/src/Screens/HomePage/MainHomePage/Display/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:validators/validators.dart' as validator;

class AdminPanel extends StatefulWidget {
//  var categories = [
//    'Fruits',
//    'Vegetables',
//    'Cereals',
//  ];
//  AdminPanel({@required this.categories});
  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  final categoryController = TextEditingController();
  var categories = [
    'Fruits',
    'Vegetables',
    'Cereals',
  ];
  String name;
  String imageUrl;

  /// Create databaseReference object to work with database.
  final databaseReference = Firestore.instance;
  var newCategory = "";
  final _formKey = GlobalKey<FormState>();

  var _selectedCategory = 'Fruits';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Info'),
        centerTitle: true,
        flexibleSpace: kAppBarContainer,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Homepage();
            }));
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: kExpert,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Select Category",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Varela',
                            ),
                          ),
                          DropdownButton<String>(
                            elevation: 10,
                            value: _selectedCategory,
                            items: categories.map((String category) {
                              return DropdownMenuItem<String>(
                                value: category,
                                child: new Text(category),
                              );
                            }).toList(),
                            onChanged: (String CategorySelected) {
                              _onDropDownItemSelected(CategorySelected);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "OR",
                        style: TextStyle(
                          fontFamily: 'Varela',
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Text(
                            "Add Category",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Varela',
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 120.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Category",
                                hintStyle: TextStyle(
                                    color: Colors.black38,
                                    fontFamily: 'Varela'),
                              ),
                              controller: categoryController,
                              validator: (String value) {
                                if (!validator.isAlpha(value)) {
                                  return "Enter a valid String ";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                setState(() {
                                  newCategory = value;
                                });
                              },
                            ),
                          ),
                          RaisedButton(
                            color: Colors.green,
                            child: Text("Add"),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                              }
                              categories.add(newCategory);
                              categoryController.clear();
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Colors.green,
                      ),
                      Text(
                        "Add Product Inside the Category",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 20,
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Varela',
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Column(
                          children: [
                            ProductInputField(
                              labelText: "Enter the product name",
                              hintText: "Ex: Apple",
//                              validator: () {},
//                              onSaved: () {},
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            ProductInputField(
                              labelText: "Enter the product name",
                              hintText: "Apple",
//                              validator: () {},
//                              onSaved: () {},
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
//      if (newCategory != null) {
//        newValueSelected = this.newCategory;
//      }
      this._selectedCategory = newValueSelected;
    });
  }
}

class ProductInputField extends StatelessWidget {
  final Function validator;
  final String hintText;
  final String labelText;
  final Function onSaved;

  const ProductInputField(
      {@required this.validator,
      @required this.hintText,
      @required this.labelText,
      @required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      alignment: Alignment.centerLeft,
      decoration: kAdminPanelDecorationStyle,
      height: 60.0,
      child: TextFormField(
        validator: validator,
        onSaved: onSaved,
        keyboardType: TextInputType.name,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'OpenSans',
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),

          hintText: hintText,
          labelText: labelText,
//                                hintStyle: kHintTextStyle,
        ),
      ),
    );
  }
}
