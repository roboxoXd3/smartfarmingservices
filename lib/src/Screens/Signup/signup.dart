import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:smartfarmingservices/src/Resources/Constants/constants.dart';
import 'package:smartfarmingservices/src/Resources/ImageLink/ImageLink.dart';
import 'package:smartfarmingservices/src/Screens/HomePage/MainHomePage/Display/homepage.dart';
import '../../Resources/Style/styles.dart';
import 'package:validators/validators.dart' as validator;

import 'package:smartfarmingservices/src/Services/Auth.dart';

class Signup extends StatelessWidget {
  static const id = "sign_up";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
              child: Container(
                color: Colors.black.withOpacity(opacity),
              ),
            ),
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ScreenBackGround), fit: BoxFit.fill)),
          ),
          SignUpForm(),
        ],
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  String email;
  String password;
  String phone;
  String name;
  bool isObscure = false;
  var signupError;
  bool isError = false;
  final _formKey = GlobalKey<FormState>();

  Widget _buildNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Name',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            validator: (String name) {
              if (!validator.isLength(name, 4, 20)) {
                return "Enter a valid Name";
              }
              return null;
            },
            onSaved: (value) {
              setState(() {
                name = value;
              });
            },
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your Name',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            validator: (String email) {
              if (!validator.isEmail(email)) {
                return "Enter a valid mail";
              }
              return null;
            },
            onSaved: (value) {
              setState(() {
                email = value;
              });
            },
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            validator: (String password) {
              if (password.length < 5) {
                return "Password length must be greater than 5";
              }
              _formKey.currentState.save();
              return null;
            },
            onSaved: (value) {
              setState(() {
                password = value;
              });
            },
            obscureText: isObscure ? true : false,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: GestureDetector(
                onTap: () {
                  isObscure = !isObscure;
                },
                child: Icon(
                  Icons.lock_open,
                  color: Colors.white,
                ),
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNumberTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Number',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            keyboardType: TextInputType.number,
            validator: (String number) {
              if (number.length != 10) {
                return "Enter a valid number";
              }
              _formKey.currentState.save();
              return null;
            },
            onSaved: (value) {
              setState(() {
                phone = value;
              });
            },
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.confirmation_number,
                color: Colors.white,
              ),
              hintText: 'Enter your Number',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignupBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            authService
                .registerWithEmail(
                    email: email, password: password, phone: phone, name: name)
                .then((user) {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Homepage(
                    user: user,
                  ),
                ),
              );
            });
            Navigator.pushNamed(context, Homepage.id);
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'SIGNUP',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: 40.0,
//                    vertical: 120.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 20,
                ),
                height: 200,
                width: 200,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new AssetImage(sft),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            _buildNameTF(),
            SizedBox(height: 30.0),
            _buildEmailTF(),
            SizedBox(height: 30.0),
            _buildNumberTF(),
            SizedBox(height: 30.0),
            _buildPasswordTF(),
            _buildSignupBtn(),
//            StreamBuilder(
//                stream: signupError,
//                builder: (context, snapshot) {
//                  if (snapshot.hasData) {
//                    return Container(
//                      height: 40,
//                      child: Text(snapshot.data[0].toString()),
//                    );
//                  } else {
//                    return Container(
//                      child: Text(
//                        "Waiting for the request..",
//                        style: kTabBarProfileText.copyWith(fontSize: 30),
//                      ),
//                    );
//                  }
//                }),
          ],
        ),
      ),
    );
  }
}
