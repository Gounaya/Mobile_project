import 'package:flutter/material.dart';
import 'package:mobileproject/screens/authenticate/reset_password.dart';
import 'package:mobileproject/screens/authenticate/sign_in.dart';
import 'package:mobileproject/screens/authenticate/sign_up_view.dart';
import 'package:mobileproject/screens/event/list_events.dart';
import 'package:mobileproject/screens/firstview/first_view.dart';
import 'package:mobileproject/screens/home/home.dart';
import 'package:mobileproject/services/authservice.dart';
import 'package:mobileproject/shared/loading.dart';
import 'package:mobileproject/shared/provider_auth.dart';
import 'package:mobileproject/theme/theme_changer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_preview/device_preview.dart';

void main() => runApp(
      ChangeNotifierProvider<ThemeChanger>(
        create: (_) => ThemeChanger(),
        child: DevicePreview(
            builder: (context) =>MyApp()
        ),
      ),
);
//void main() => runApp(MyApp());

final lightTheme = ThemeData.light().copyWith(
  primaryColor: Colors.white,
  accentColor: Colors.blue,
  primaryIconTheme: IconThemeData(color: Colors.black),
);

final darkTheme = ThemeData.dark().copyWith(
  primaryColor: Colors.white,
  accentColor: Colors.blue,
  primaryIconTheme: IconThemeData(color: Colors.white),
);

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return ProviderAuth(
      auth: AuthService(),
      child: MaterialApp(

        theme: themeChanger.theme,

          locale: DevicePreview.of(context).locale, // <--- Add the locale
          builder: DevicePreview.appBuilder, // <--- Add the builder

          //home: Wrapper(),
          //home: Home(),
        home: HomeController(),
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder> {
          '/listEvents': (BuildContext context) => ListEvents(),
          '/forgetPassword': (BuildContext context) => ResetPassword(),
          '/signUp': (BuildContext context) => SignUpView(),
          '/signIn': (BuildContext context) => SignIn(),
          '/home': (BuildContext context) => HomeController(),
        },
      ),
    );
  }
}




// Controle If we show SignInPage or homePage
class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = ProviderAuth.of(context).auth;
    return StreamBuilder<String>(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        print(snapshot.hasData);
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          return signedIn ? Home() : FirstView();
        }
        return Loading();
      },
    );
  }
}

