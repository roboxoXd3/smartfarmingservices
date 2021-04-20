import 'package:flutter/material.dart';

class User {
  String uid, name, email, phone, photo;
  bool isSupport;

  User({
    @required String uid,
    @required String name,
    @required String email,
    @required String phone,
    String photo,
    bool isSupport = false,
  }) {
    this.uid = uid;
    this.name = name;
    this.email = email;
    this.phone = phone;
    if (photo != null) this.photo = photo;
    this.isSupport = isSupport;
  }

  User.fromMap(Map<String, dynamic> map) {
    uid = map['uid'];
    name = map['name'];
    email = map['email'];
    phone = map['phone'];
    photo = map['photo'];
    isSupport = map['isSupport'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map<String, dynamic>();
    map['uid'] = this.uid;
    map['name'] = this.name;
    map['email'] = this.email;
    map['phone'] = this.phone;
    map['isSupport'] = this.isSupport;
    if (photo != null) map['photo'] = this.photo;
    return map;
  }
}
