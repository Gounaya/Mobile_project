import 'package:flutter/material.dart';
import 'package:mobileproject/screens/authenticate/sign_in.dart';
import 'package:mobileproject/services/authservice.dart';
import 'package:mobileproject/shared/constants.dart';
import 'package:mobileproject/shared/loading.dart';
import 'package:mobileproject/shared/provider_auth.dart';
import 'package:mobileproject/theme/theme_changer.dart';
import 'package:provider/provider.dart';


class SignUpView extends StatefulWidget {

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '',
         password = '',
         username = '',
         _error = '';


  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);

    return loading? Loading() : Scaffold(
        backgroundColor: Colors.grey[200],
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          title: Text("Sign up", style: TextStyle(color: Colors.blue)),
          automaticallyImplyLeading: false, // Used for removing back buttoon.
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[

                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Username', icon: Icon(Icons.person)),
                  validator: NameValidator.validate,

                  onChanged: (val){
                    setState(() =>
                    username = val
                    );
                  },
                ),

                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email adrdress', icon: Icon(Icons.email)),
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val){
                    setState(() =>
                    email = val
                    );
                  },
                ),

                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Password minimum 8 characters', icon: Icon(Icons.lock)),
                  obscureText: true,
                  validator: (val) => val.length <8 ? 'Enter a password 8+ chars long' : null,
                  onChanged: (val){
                    setState(() =>
                    password = val
                    );
                  },
                ),

                SizedBox(height: 20.0),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 25.0),
                  width: double.infinity,
                  child: RaisedButton(
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Colors.blue,
                    child: Text(
                      'REGISTER',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',

                      ),
                    ),
                    onPressed: () async {
                      print(email + " -- "+ password);
                      if(_formKey.currentState.validate()){
                        setState(() =>
                          loading = true
                        );
                        try{
                          final _auth = ProviderAuth.of(context).auth;
                          String uid = await _auth.registerWithEmailAndPassword(email, password, username);
                          print("Sign Up with ID : $uid");
                          Navigator.of(context).pushReplacementNamed('/home');
                        }catch(error){
                          setState(() {
                            _error = error.message;
                          });
                        }
                      }
                    },
                  ),
                ),

                _haveAnaccount(context),

                SizedBox(height: 12.0),
                Text(
                  _error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),

              ],
            ),
          ),
        )

    );
  }
}

Widget _haveAnaccount(context) {
  final themeChanger = Provider.of<ThemeChanger>(context);


  return Container(
    margin: EdgeInsets.symmetric(vertical: 20),
    alignment: Alignment.bottomCenter,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Have an Account ?',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/signIn');
          },
          child: Text(
            'Sign In.',
            style: TextStyle(
                color: Color(0xfff79c4f),
                fontSize: 13,
                fontWeight: FontWeight.w600),
          ),
        )
      ],
    ),
  );
}