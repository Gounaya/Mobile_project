import 'package:firebase_auth/firebase_auth.dart';


class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in anon
  Future signInAnon() async {
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return user;
    }catch(error){
      print(error.toString());
      return null;
    }
  }

  // Sign in with email and password

  // Register with email & password

  // Sig out

}