import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:mobileproject/screens/home/home.dart';
import 'package:mobileproject/screens/wrapper.dart';
import 'package:mobileproject/services/authservice.dart';
import 'package:provider/provider.dart';
import 'data/models/user.dart';
/*
void main() => runApp(
    DevicePreview(
        builder: (context) =>MyApp()
    )
);*/
void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
    /*
        locale: DevicePreview.of(context).locale, // <--- Add the locale
        builder: DevicePreview.appBuilder, // <--- Add the builder
    */
        //home: Wrapper(),
        home: Home(),
      ),
    );
  }
}