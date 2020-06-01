import 'package:flutter/material.dart';
import 'package:mobileproject/screens/authenticate/register.dart';
import 'package:mobileproject/screens/authenticate/sign_up_view.dart';
import 'package:mobileproject/services/authservice.dart';
import 'package:mobileproject/shared/constants.dart';
import 'package:mobileproject/shared/loading.dart';
import 'package:mobileproject/shared/provider_auth.dart';
import 'package:mobileproject/shared/showlogo.dart';
import 'package:mobileproject/theme/theme_changer.dart';
import 'package:provider/provider.dart';


class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String _error = '';


  @override
  Widget build(BuildContext context) {
    //final themeChanger = Provider.of<ThemeChanger>(context);

    return loading? Loading() : Scaffold(
      backgroundColor: Colors.grey[200],//themeChanger.theme.backgroundColor,//Colors.grey[200],
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.grey[200],// themeChanger.theme.backgroundColor,
        //title: Text("Sign In", style: TextStyle(color: themeChanger.theme.accentColor)),
        automaticallyImplyLeading: false, // Used for removing back buttoon.
        elevation: 0.0,

      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                showLogo(),
                SizedBox(height: 20.0),

                TextFormField(
                  decoration: textInputDecoration.copyWith(
                    hintText: 'Email adrdress',
                    icon: Icon(Icons.email),
                  ),
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val){
                    setState(() =>
                      email = val
                    );
                  },
                ),

                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                    hintText: 'Password',
                    icon: Icon(Icons.lock),
                  ),
                  validator: (val) => val.length <8 ? 'Enter a password 8+ chars long' : null,
                  obscureText: true,
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
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',

                        ),
                      ),
                      onPressed: () async{
                        if(_formKey.currentState.validate()){
                          setState(() => loading = true);

                          try{
                            final _auth = ProviderAuth.of(context).auth;
                            String uid = await _auth.SignInWithEmailAndPassword(email, password);
                            print("Signed In with ID : $uid");
                            Navigator.of(context).pushReplacementNamed('/home');
                          }catch(e){
                            setState(() {
                              _error = e.message;
                              loading = false;
                            });
                          }

                        }
                      },
                  ),
                ),
                _createResetPasswordLabel(context),
                _createAccountLabel(context),

                SizedBox(height: 12.0),
                Text(
                  _error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),

                ),
              ],
            ),
          ),
        ),
      ),


    );
  }
}

Widget _buildLoginBtn() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25.0),
    width: double.infinity,
    child: RaisedButton(
      elevation: 5.0,
      onPressed: () => print('Login Button Pressed'),
      padding: EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.white,
      child: Text(
        'LOGIN',
        style: TextStyle(
          color: Color(0xFF527DAA),
          letterSpacing: 1.5,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
    ),
  );
}

Widget _createResetPasswordLabel(context) {
  //final themeChanger = Provider.of<ThemeChanger>(context);

  return Container(
    alignment: Alignment.bottomCenter,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/forgetPassword');
          },
          child: Text(
            'Forgot Password?',
            style: TextStyle(
                //color: themeChanger.theme.accentColor,
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
        )
      ],
    ),
  );
}



Widget _createAccountLabel(context) {
  //final themeChanger = Provider.of<ThemeChanger>(context);

  return Container(
    margin: EdgeInsets.symmetric(vertical: 20),
    alignment: Alignment.bottomCenter,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Don\'t have an account ?',
          //style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: themeChanger.theme.primaryColor),
        ),
        SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/signUp');
          },
          child: Text(
            'Sign up',
            style: TextStyle(
                color: Color(0xfff79c4f),
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
        )
      ],
    ),
  );
}

