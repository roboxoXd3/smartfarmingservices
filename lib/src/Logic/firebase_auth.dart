import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider {
  ///Step:1
  //creating instance of FireBase auth class for authentication purpose.
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ///Step:2
  //Creating a method for Signing in with Email having a return type of Future<bool>
  Future<bool> signInWithEmail(String Email, String Password) async {
    try {
      ///step:3
      //result will be  the autharization result of the given email and password.
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: Email, password: Password);

      ///Step:4
      //These 2 users are different, one being the local user which we have created to store the info of the result.user which we are getting from the Firebase.
      FirebaseUser user = result.user;

      ///step:5
      //If user!=null we return true or else we return false.
      if (user != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
