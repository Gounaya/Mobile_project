import 'package:flutter/material.dart';

Widget showPrimaryButton() {
  return new Padding(
      padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
      child: SizedBox(
        height: 40.0,
        child: new RaisedButton(
          elevation: 5.0,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          color: Colors.blue,
          child: new Text('Login',
              style: new TextStyle(fontSize: 20.0, color: Colors.white)),
        ),
      ));
}