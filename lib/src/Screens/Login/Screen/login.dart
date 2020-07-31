import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:smartfarmingservices/src/Logic/firebase_auth.dart';
import 'package:smartfarmingservices/src/Resources/Constants/constants.dart';
import 'package:smartfarmingservices/src/Resources/ImageLink/ImageLink.dart';
import 'package:smartfarmingservices/src/Resources/Style/styles.dart';
import 'package:smartfarmingservices/src/Screens/HomePage/MainHomePage/Display/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartfarmingservices/src/Screens/Signup/signup.dart';
import 'package:validators/validators.dart' as validator;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

bool isLoading = false;

class LoginScreen extends StatelessWidget {
  static const id = "login_screen";

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
  String Email;
  String Password;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
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
                Email = value;
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
                Password = value;
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
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              });
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();

            _firebaseAuth
                .signInWithEmailAndPassword(email: Email, password: Password)
                .catchError((e) {
              print(e);
            }).then((user) {
              if (user != null) {
                Navigator.pushNamed(context, Homepage.id);
              } else if (user == null) {
                return null;
              }
            });
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
              signInWithGoogle();
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

  Future<FirebaseUser> signInWithGoogle() async {
    ///TODO:(Step:1) Creating a refrence for google signinaccount in order to use it further for google authentication
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();

    ///TODO:(Step:2) Now using that refrence i.e, googleSignInAccount and use it for the authentication of the entered user, as it is availabe or not.
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    ///TODO:(Step:3) After the authentication has been received we save the credential of that user, ie., his id_token and his access_token
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    ///TODO:(Step:4) And when we have saved those credentials, we use it to signInWithCredential passing those credential and saving that output inside the authresult so we can actually access the info of that user and further show it on his profile we can also save that info inside firebase.
    final AuthResult authResult =
        await _firebaseAuth.signInWithCredential(credential);

    ///TODO:(Step:5) With authResult variable we access the user and save this info inside the user.
    final FirebaseUser user = authResult.user;

    ///TODO:(Step:6) And inside the variable currentUser we will save the info of the current signedin user by method provided by the firebase in the method currentUSer which we access with the FireBaseAuthentication refrence i.e., _firebaseAuth
    final FirebaseUser currentUser = await _firebaseAuth.currentUser();

    ///TODO: (Step:7) From here we start saving the info inside the firestore.
    if (currentUser != null) {
      ///TODO: (Step:8) [A QuerySnapshot contains the results of a query. It can contain zero or more DocumentSnapshot objects]. With the help of this only we create the collections inside the firestore.
      final QuerySnapshot result = await Firestore.instance
          .collection('users')
          .where("id", isEqualTo: currentUser.uid)

          /// This is the id that we create in order to segregate each user from the other.
          .getDocuments();

      /// It fetch document from that query and in this document we fetch the id that we created of the user.
      ///After this we create a variable of type List<DocumentSnapshot> in order the save all and all info received from that document, when we fetched it.
      final List<DocumentSnapshot> document = result.documents;

      ///Then after we check if the document is not created in the firestore i.e., the document length is 0, we create the instance of collection.
      if (document.length == 0) {
        Firestore.instance
            .collection('users')
            .document(currentUser.uid)
            .setData({
          /// here then we setData i.e, we can say we push the data unto the firebase of the user info.
          'id': currentUser.uid,
          'username': currentUser.displayName,
          'profilePicture': currentUser.photoUrl
        });
      } else {}
    }
    return user;
  }
}
