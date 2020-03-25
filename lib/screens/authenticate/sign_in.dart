import 'package:flutter/material.dart';
import 'package:mobileproject/services/authservice.dart';


class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Sign In"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: RaisedButton(
          child: Text('Sign in Anon'),
          onPressed: () async{
            dynamic result = await _authService.signInAnon();
            if(result==null){
              print('error');
            }else{
              print("==============>");
              print(result.uid);
            }
          },
        ),
      )

    );
  }
}
