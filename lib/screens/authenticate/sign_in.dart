import 'package:flutter/material.dart';
import 'package:mobileproject/screens/authenticate/register.dart';
import 'package:mobileproject/services/authservice.dart';
import 'package:mobileproject/shared/constants.dart';
import 'package:mobileproject/shared/loading.dart';
import 'package:mobileproject/shared/showlogo.dart';


class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;


  //text field state
  String email = '';
  String password = '';
  String error = '';


  @override
  Widget build(BuildContext context) {
    return loading? Loading() : Scaffold(
      backgroundColor: Colors.grey[200],
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text("Sign In", style: TextStyle(color: Colors.black)),

        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: (){
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              showLogo(),
              SizedBox(height: 50.0),

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
                decoration: textInputDecoration.copyWith(hintText: 'Password', icon: Icon(Icons.lock)),
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
                      /*
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.5,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                     */
                    ),
                    onPressed: () async{
                      print(email + " -- "+ password);
                      if(_formKey.currentState.validate()){
                        setState(() => loading = true);
                        dynamic result = await _authService.signInWithEmailAndPassword(email, password);
                        if(result == null) {
                          setState((){
                            error = 'Could not sign in with those credentials';
                            loading = false;
                          });
                        }
                      }
                    },
                ),
              ),
              _createAccountLabel(context),

              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),

              ),
            ],
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

Widget _createAccountLabel(context) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 20),
    alignment: Alignment.bottomCenter,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Don\'t have an account ?',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Register()));
          },
          child: Text(
            'Register',
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


Widget _buildSignInWithText() {
  return Column(
    children: <Widget>[
      Text(
        '- OR -',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
      SizedBox(height: 20.0),
      Text(
        'Sign in with',
      ),
    ],
  );
}



Widget _buildSignupBtn() {
  return GestureDetector(
    onTap: () => print('Sign Up Button Pressed'),
    child: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an Account? ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: 'Sign Up',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}


/*
Normal button
RaisedButton(
  color: Colors.blue,
  child: Text(
    'Sign in',
    style: TextStyle(color: Colors.white),
  ),
  onPressed: () async{
    print(email + " -- "+ password);
    if(_formKey.currentState.validate()){
      setState(() => loading = true);
      dynamic result = await _authService.signInWithEmailAndPassword(email, password);
      if(result == null) {
        setState((){
          error = 'Could not sign in with those credentials';
          loading = false;
        });
      }
    }
  },
),
 */