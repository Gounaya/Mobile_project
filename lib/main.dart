import 'package:flutter/material.dart';
import 'package:mobileproject/screens/responsive_page.dart';
import 'package:mobileproject/screens/wrapper.dart';
import 'package:mobileproject/services/authservice.dart';
import 'package:provider/provider.dart';
import 'data/models/user.dart';
import 'package:device_preview/device_preview.dart';


//void main() => runApp(MyApp());
void main() => runApp(DevicePreview(builder: (context) =>MyApp())); //responsive

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        locale: DevicePreview.of(context).locale, //responsive
        builder: DevicePreview.appBuilder,
        //home: Wrapper(),
        home: ResponsivePage(), //responsive
      ),
    );
  }
}