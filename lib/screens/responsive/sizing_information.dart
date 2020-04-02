


import 'package:flutter/cupertino.dart';
import 'package:mobileproject/screens/responsive/device_screen_type.dart';

class SizingInformation {
  final Orientation orientation;
  final DeviceScreenType deviceType;
  final Size screenScreen;
  final Size localWidgetSize;

  SizingInformation({this.orientation, this.deviceType, this.screenScreen,
      this.localWidgetSize});

  @override
  String toString() {
    return 'SizingInformation{orientation: $orientation, deviceType: $deviceType, screenScreen: $screenScreen, localWidgetSize: $localWidgetSize}';
  }


}