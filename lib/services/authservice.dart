import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobileproject/data/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<String> get onAuthStateChanged =>
      _auth.onAuthStateChanged.map(
            (FirebaseUser user) => user?.uid,
      );

  // Register with email & password
  Future<String> registerWithEmailAndPassword(email, password, username) async {
    final result = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim()
    );
    await updateUser(username, result.user);
    return result.user.uid;

  }

  Future updateUser(String username, FirebaseUser currentUser) async {
    var userUpdateInfo = UserUpdateInfo();
    userUpdateInfo.displayName = username;
    await currentUser.updateProfile(userUpdateInfo);
    await currentUser.reload();
  }

  // SignIn with email & password
  Future<String> SignInWithEmailAndPassword(email, password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //sign in the user here
    prefs.setString("email", email);
    prefs.setString("uid", password);

    return (await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim()
    )).user.uid;
  }

  // Reset Password
  Future sendPasswordResetEmail(String email) async {
    return _auth.sendPasswordResetEmail(email: email);
  }

  // Get Current User UID
  Future<String> getCurrentUID() async{
    return (await _auth.currentUser()).uid;
  }

  // Get Current User
  Future getCurrentUser() async{
    return await _auth.currentUser();
  }

  //Sign Out
  signOut(){
    return _auth.signOut();
  }

}

class NameValidator {
  static String validate(String value){
    if(value.isEmpty){
      return "Name can't be empty";
    }else if (value.length < 2){
      return "Name must be at least 2 characaters long";
    }else if (value.length > 20){
      return "Name must be less than 20 characters long";
    }else {
      return null;
    }
  }
}