import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Center(
        child: SpinKitDoubleBounce(
          color: Colors.blue,
          size: 50.0,
        ),
      ),
    );
  }
}

//https://pub.dev/packages/flutter_spinkit#-readme-tab-