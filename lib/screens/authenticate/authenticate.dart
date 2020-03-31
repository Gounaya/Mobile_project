
import 'package:flutter/material.dart';
import 'package:mobileproject/screens/authenticate/register.dart';
import 'package:mobileproject/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView(){
    setState(()
       => showSignIn = !showSignIn
    );
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      print("===> ShowSignIn = "+showSignIn.toString());
      return SignIn(toggleView: toggleView);
    }
    else{
      print("===> ShowSignIn = "+showSignIn.toString());
      return Register(toggleView: toggleView);
    }

  }
}

