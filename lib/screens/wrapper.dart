
import 'package:flutter/material.dart';
import 'package:mobileproject/data/models/user.dart';
import 'package:mobileproject/screens/authenticate/authenticate.dart';
import 'package:mobileproject/screens/home/home.dart';
import 'package:provider/provider.dart';
/*
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);
    print("====Wrapper====> "+user.toString());

    //return either home or authenticate widget
    if(user == null)
      return Authenticate();
    else{
      print("======> GO HOME");
      return Home();
    }
  }
}
*/