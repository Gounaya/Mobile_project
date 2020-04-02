
import 'package:flutter/cupertino.dart';
import 'package:mobileproject/screens/responsive/sizing_information.dart';
import 'package:mobileproject/screens/responsive/ui_utils.dart';

class BaseWidget extends StatelessWidget {

  final Widget Function(
      BuildContext context, SizingInformation sizingInformation
      ) builder;

  const BaseWidget({Key key, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return LayoutBuilder(builder: (context, boxSizing){
      var sizingInformation = SizingInformation(
        orientation: mediaQuery.orientation,
        deviceType: UIUtils.getDeviceType(mediaQuery),
        screenScreen: mediaQuery.size,
        localWidgetSize: Size(boxSizing.maxWidth, boxSizing.maxHeight)
      );
      return builder(context, sizingInformation);
    });
  }

}

