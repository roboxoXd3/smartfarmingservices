import 'package:shared_preferences/shared_preferences.dart';
import '../Model/User.dart' as UserModel;

class OfflineStorage {
  SharedPreferences pref;

  saveUserInfo(UserModel.User user) async {
    pref = await SharedPreferences.getInstance();
    await pref.setString("uid", user.uid);
    await pref.setString("name", user.name);
    await pref.setString("email", user.email);
    await pref.setString("phone", user.phone);
    await pref.setString("photo", user.photo);
    await pref.setBool("isSupport", user.isSupport);
  }

  Future<UserModel.User> getUserInfo() async {
    pref = await SharedPreferences.getInstance();
    String uid = pref.getString("uid");
    String name = pref.getString("name");
    String email = pref.getString("email");
    String phone = pref.getString("phone");
    String photo = pref.getString("photo");
    bool isSupport = pref.getBool("isSupport");
    return UserModel.User.fromMap(
      {
        'uid': uid,
        'name': name,
        'email': email,
        'phone': phone,
        'photo': photo,
        'isSupport': isSupport,
      },
    );
  }
}
