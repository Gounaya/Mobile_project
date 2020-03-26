import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobileproject/data/models/user.dart';


class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create user obj based on firebaseuser
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  // Auth change user Stream
  Stream<User> get user{
    return _auth.onAuthStateChanged
      .map(_userFromFirebaseUser);
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

  // Sign out
  Future signOut() async {
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}