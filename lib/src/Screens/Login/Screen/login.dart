import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartfarmingservices/src/Resources/Constants/constants.dart';
import 'package:smartfarmingservices/src/Resources/ImageLink/ImageLink.dart';
import 'package:smartfarmingservices/src/Resources/Style/styles.dart';
import 'package:smartfarmingservices/src/Screens/HomePage/MainHomePage/Display/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartfarmingservices/src/Screens/Signup/signup.dart';
import 'package:smartfarmingservices/src/Services/Database.dart';
import 'package:smartfarmingservices/src/Services/OfflineStore.dart';
import 'package:validators/validators.dart' as validator;

import 'package:firebase_auth/firebase_auth.dart';

import 'package:smartfarmingservices/src/Services/Auth.dart';
import 'package:smartfarmingservices/src/Model/User.dart' as UserModel;
import 'package:lottie/lottie.dart';

bool isLoading = false;

class LoginScreen extends StatelessWidget {
  static const id = "login_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ScreenBackGround), fit: BoxFit.fill)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
              child: Container(
                color: Colors.black.withOpacity(opacity),
              ),
            ),
          ),
          LoginForm(),
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String email;
  String password;

  SharedPreferences preferences;
  bool isLoading = false;
  bool isLogedin = false;

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
                return "Please enter a valid email";
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
              hintText: "Enter your Email",
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
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildLoginBtn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();

            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext contextBuilder) {
                return FutureBuilder(
                  future: FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email, password: password),
                  builder: (contextFutureBuilder, value) {
                    if (value.hasError) {
                      print('Error intercepted ' + value.error.toString());
                      String errorMessage =
                          value.error.toString().split(']')[1].substring(1);
                      print('FirebaseAuthException => ' + errorMessage);
                      return _buildPopUpMessage(contextBuilder,
                          error: errorMessage);
                    }
                    if (value.hasData)
                      return _buildPopUpMessage(contextBuilder, value: value);
                    return _buildLoadingWidget();
                  },
                );
              },
            );

            // authService
            //     .signInWithEmail(email: email, password: password)
            //     .catchError((e) {
            //   print(e);
            // }).then((user) {
            //   Navigator.pop(context);
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => Homepage(
            //         user: user,
            //       ),
            //     ),
            //   );
            // });
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
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

  Widget _buildPopUpMessage(context, {value, error}) => error != null
      ? Align(
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.all(8.0),
            height: MediaQuery.of(context).size.height * .5 >
                    MediaQuery.of(context).size.width * .7
                ? MediaQuery.of(context).size.height * .5
                : MediaQuery.of(context).size.width * .7,
            width: MediaQuery.of(context).size.width * .6,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * .4,
                  height: MediaQuery.of(context).size.width * .4,
                  child: Lottie.asset(
                    'lib/src/Resources/failed.json',
                    animate: true,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .5 >
                          MediaQuery.of(context).size.width * .7
                      ? MediaQuery.of(context).size.height * .5 -
                          MediaQuery.of(context).size.width * .4 -
                          MediaQuery.of(context).size.width * .2 +
                          -20
                      : MediaQuery.of(context).size.width * .1,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      error,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff49ffa0),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * .2,
                  child: Center(
                    child: Align(
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        color: Color(0xff49ffa0),
                        child: Text('Try again!'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      : StatefulBuilder(builder: (builderContext, stateUpdate) {
          bool processing = false;
          return Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.all(8.0),
              height: MediaQuery.of(context).size.width * .8,
              width: MediaQuery.of(context).size.width * .6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .4,
                    height: MediaQuery.of(context).size.width * .4,
                    child: Lottie.asset(
                      'lib/src/Resources/success.json',
                      animate: true,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .1,
                    child: Center(
                      child: Text(
                        'You are in!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff49ffa0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .2,
                    child: Center(
                      child: Align(
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          color: processing ? Colors.grey : Color(0xff49ffa0),
                          child: Text('Let\'s get into it.'),
                          onPressed: processing
                              ? null
                              : () async {
                                  stateUpdate(() {
                                    processing = true;
                                  });
                                  User registeredUser = value.data.user;
                                  DatabaseHelper databaseHelper =
                                      new DatabaseHelper();
                                  DocumentSnapshot userDoc =
                                      await databaseHelper.getUserByUsername(
                                          registeredUser.uid);
                                  UserModel.User userObject =
                                      new UserModel.User.fromMap(
                                          userDoc.data());
                                  OfflineStorage offlineStorage =
                                      new OfflineStorage();
                                  await offlineStorage.saveUserInfo(userObject);
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Homepage(
                                        user: userObject,
                                      ),
                                    ),
                                  );
                                },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });

  Widget _buildLoadingWidget() => Center(
        child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation(
            Color(0xfff0f696),
          ),
        ),
      );

  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'Sign in with',
          style: kLabelStyle,
        ),
      ],
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(
            () => print('Login with Facebook'),
            AssetImage(
              facebook,
            ),
          ),
          _buildSocialBtn(
            () {
              authService.googleSignIn().then((user) {
                if (user != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Homepage(
                        user: user,
                      ),
                    ),
                  );
                }
              });
            },
            AssetImage(
              google,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignupBtn(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Signup()),
      ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
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
              SizedBox(height: 10.0),
              _buildEmailTF(),
              SizedBox(
                // height: 30.0,
                height: 10,
              ),
              _buildPasswordTF(),
              _buildForgotPasswordBtn(),
              _buildLoginBtn(context),
              _buildSignInWithText(),
              _buildSocialBtnRow(),
              _buildSignupBtn(context),
            ],
          ),
        ),
      ),
    );
  }
}
