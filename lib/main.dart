import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobileproject/screens/authenticate/reset_password.dart';
import 'package:mobileproject/screens/authenticate/sign_in.dart';
import 'package:mobileproject/screens/authenticate/sign_up_view.dart';
import 'package:mobileproject/screens/event/list_events.dart';
import 'package:mobileproject/screens/firstview/first_view.dart';
import 'package:mobileproject/screens/home/home.dart';
import 'package:mobileproject/services/authservice.dart';
import 'package:mobileproject/shared/loading.dart';
import 'package:mobileproject/shared/provider_auth.dart';
import 'package:mobileproject/testCat/listing_pictures.dart';
import 'package:mobileproject/theme/theme_changer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_preview/device_preview.dart';
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobileproject/theme/bloc/theme_bloc.dart';
import 'package:mobileproject/theme/bloc/theme_state.dart';

/*
void main() => runApp(
      ChangeNotifierProvider<ThemeChanger>(
        create: (_) => ThemeChanger(),
        child: DevicePreview(
            builder: (context) =>MyApp()
        ),
      ),
);

 */
void main() => runApp(MyApp());


class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //final themeChanger = Provider.of<ThemeChanger>(context);
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: _buildWithTheme,
      ),
    );
  }
}

Widget _buildWithTheme(BuildContext context, ThemeState state) {
  return ProviderAuth(
    auth: AuthService(),
    child: MaterialApp(

      theme: state.themeData,

      //locale: DevicePreview.of(context).locale, // <--- Add the locale
      //builder: DevicePreview.appBuilder, // <--- Add the builder

      //home: Wrapper(),
      //home: Home(),
      home: HomeController(),
      //home: ListingPictures(),

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


class Bloc{
  final _themeController = StreamController<bool>();
  get changeTheme => _themeController.sink.add;
  get darkThemeEnabled => _themeController.stream;
}

final bloc = Bloc();



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

