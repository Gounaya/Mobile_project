import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobileproject/data/models/user.dart';


class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create user obj based on firebaseuser
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  // Sign in anon
  Future signInAnon() async {
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(error){
      print(error.toString());
      return null;
    }
  }

  // Sign in with email and password

  // Register with email & password

  // Sig out

}