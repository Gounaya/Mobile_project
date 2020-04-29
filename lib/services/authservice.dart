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
  Future signInWithEmailAndPassword(email, password) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
      FirebaseUser user = result.user;
      print("===> User IN registerWithEmailAndPassword "+user.toString() + "result = "+result.toString());
      return _userFromFirebaseUser(user);
    }catch(error){
      print(error.toString());
      return null;
    }
  }

  // Register with email & password
  Future registerWithEmailAndPassword(email, password) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email.trim(),
          password: password.trim()
      );
      //Update the username
      

      FirebaseUser user = result.user;
      print("===> User IN registerWithEmailAndPassword "+user.toString() + "result = "+result.toString());
      return _userFromFirebaseUser(user);
    }catch(error){
      print(error.toString());
      return null;
    }
  }

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

/*
  //Current user
  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _auth.currentUser();
    return user;
  }

  Future<void> sendEmailVerification() async {
    FirebaseUser user = await _auth.currentUser();
    user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    FirebaseUser user = await _auth.currentUser();
    return user.isEmailVerified;
  }
  */