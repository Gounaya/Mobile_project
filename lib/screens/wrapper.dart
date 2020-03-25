
import 'package:flutter/material.dart';
import 'package:mobileproject/screens/authenticate/authenticate.dart';
import 'package:mobileproject/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //return either home or authenticate widget
    return Authenticate();
  }
}
