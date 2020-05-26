import 'package:flutter/material.dart';
import 'package:mobileproject/screens/authenticate/register.dart';
import 'package:mobileproject/screens/authenticate/sign_up_view.dart';
import 'package:mobileproject/services/authservice.dart';
import 'package:mobileproject/shared/constants.dart';
import 'package:mobileproject/shared/loading.dart';
import 'package:mobileproject/shared/provider_auth.dart';
import 'package:mobileproject/shared/showlogo.dart';


class ResetPassword extends StatefulWidget {

  final Function toggleView;
  ResetPassword({this.toggleView});

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String _warning = '';


  @override
  Widget build(BuildContext context) {
    return loading? Loading() : Scaffold(
      backgroundColor: Colors.grey[200],
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text("Reset Password", style: TextStyle(color: Colors.black)),
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

                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email adrdress', icon: Icon(Icons.email)),
                  validator: (val) => val.isEmpty ? 'Email can\'t be empty' : null,
                  onChanged: (val){
                    setState(() =>
                    email = val
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
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',

                      ),
                    ),
                    onPressed: () async{

                      if(_formKey.currentState.validate()){
                        //setState(() => loading = true);
                        try{
                          final auth = ProviderAuth.of(context).auth;
                          await auth.sendPasswordResetEmail(email);

                          _warning = "A password reset link has been sent to $email";
                          //Navigator.of(context).pushReplacementNamed('/signIn');
                        }catch(e){
                          setState(() {
                            _warning = e.message;
                            loading = false;
                          });
                        }

                      }
                    },
                  ),
                ),
                _createBackLabel(context),

                SizedBox(height: 12.0),
                Text(
                  _warning,
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                  ),

                ),
              ],
            ),
          ),
        ),
      ),


    );
  }
}


Widget _createBackLabel(context) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 20),
    alignment: Alignment.bottomCenter,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/signIn');
          },
          child: Text(
            'Back to Sign In',
            style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w600),
          ),
        )
      ],
    ),
  );
}

