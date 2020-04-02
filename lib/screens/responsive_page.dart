

import 'package:flutter/material.dart';
import 'package:mobileproject/shared/widget/base_widget.dart';

class ResponsivePage extends StatelessWidget {
  const ResponsivePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, sizingInformation){
      return Scaffold(
        body: Center(
          child: Text(sizingInformation.toString()),
        )
      );
    });
  }

}