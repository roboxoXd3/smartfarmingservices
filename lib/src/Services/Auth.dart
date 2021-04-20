import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smartfarmingservices/src/Services/Database.dart';
import '../Model/User.dart' as UserModel;
import 'package:flutter/material.dart';

import 'OfflineStore.dart';

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  OfflineStorage offlineStorage = new OfflineStorage();

  Stream<User> user;
  Stream<Map<String, dynamic>> profile;
  PublishSubject loading = PublishSubject();

  AuthService() {
    user = _auth.authStateChanges();
    profile = user.switchMap(
      (User u) {
        if (u != null)
          return _db
              .collection('users')
              .doc(u.uid)
              .snapshots()
              .map((snap) => snap.data());
        return Stream.empty();
      },
    );
  }

  Future<UserModel.User> googleSignIn() async {
    loading.add(true);
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    User user = (await _auth.signInWithCredential(credential)).user;
    DatabaseHelper databaseHelper = new DatabaseHelper();
    DocumentSnapshot userDoc = await databaseHelper.getUserByUsername(user.uid);
    UserModel.User userObject;
    if (!userDoc.exists)
      userObject = new UserModel.User(
        uid: user.uid,
        name: user.displayName,
        email: user.email,
        phone: user.phoneNumber,
        photo: user.photoURL,
      );
    else
      userObject = new UserModel.User.fromMap(userDoc.data());
    if (!userDoc.exists) saveUserData(userObject);
    await offlineStorage.saveUserInfo(userObject);
    return userObject;
  }

  Future<UserModel.User> signInWithEmail({@required String email, @required String password}) async {
    UserCredential userCred = await _auth.signInWithEmailAndPassword(
        email: email, password: password).onError((error, stackTrace) => null);
    User registeredUser = userCred.user;
    DatabaseHelper databaseHelper = new DatabaseHelper();
    DocumentSnapshot userDoc =
        await databaseHelper.getUserByUsername(registeredUser.uid);
    UserModel.User userObject = new UserModel.User.fromMap(userDoc.data());
    await offlineStorage.saveUserInfo(userObject);
    return userObject;
  }

  Future<UserModel.User> registerWithEmail({
    @required String email,
    @required String password,
    @required String phone,
    @required String name,
  }) async {
    UserCredential userCred = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    User registeredUser = userCred.user;
    UserModel.User user = new UserModel.User(
        uid: registeredUser.uid, name: name, email: email, phone: phone);
    await offlineStorage.saveUserInfo(user);
    saveUserData(user);
    return user;
  }

  void saveUserData(UserModel.User user) async {
    DocumentReference ref = _db.collection('users').doc(user.uid);
    profile = _auth.authStateChanges().switchMap(
      (User u) {
        if (u != null)
          return _db
              .collection('users')
              .doc(u.uid)
              .snapshots()
              .map((snap) => snap.data());
        return Stream.empty();
      },
    );
    _db.collection('users').doc(user.uid).get().then((doc) async {
      if (!doc.exists) {
        print('Doc not found, writing new doc for user : ' + user.name);
        await ref.set(user.toMap(), SetOptions(merge: true));
      }
    });
  }

  void signOut() => _auth.signOut();
}

final AuthService authService = AuthService();
