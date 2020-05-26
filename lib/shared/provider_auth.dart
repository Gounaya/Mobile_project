import 'package:flutter/cupertino.dart';
import 'package:mobileproject/services/authservice.dart';


// To acces the information from anywhere.
class ProviderAuth extends InheritedWidget {
  final AuthService auth;

  ProviderAuth({Key key, Widget child, this.auth}) : super(key: key, child: child);

  //useless
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  //will call the inheritWidget of exact method for me.
  static ProviderAuth of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(ProviderAuth) as ProviderAuth);
}