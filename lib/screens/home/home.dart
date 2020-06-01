import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobileproject/services/authservice.dart';
import 'package:mobileproject/shared/provider_auth.dart';
import 'package:mobileproject/theme/app_themes.dart';
import 'package:mobileproject/theme/theme_changer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../event/create_event.dart';
import '../event/list_events.dart';
import '../profil/profil_view.dart';
import 'package:mobileproject/data/models/event.dart';
import 'package:mobileproject/theme/bloc/theme_bloc.dart';
import 'package:mobileproject/theme/bloc/theme_state.dart';
import 'package:mobileproject/theme/bloc/theme_event.dart';


class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {

  final newEvent = new Event(null, null, null, null, null, null, null, null, null, null, null);

  int _currentIndex = 0;
  final List<Widget> _children = [
    ListEvents(),
    CreateEvent(functionEvent:(newEvent){
      print("===>"+newEvent.title);
    },),
    ProfilView()
  ];


  final List<String> _title = [
    "Home",
    "New Event",
    "Profil"
  ];

  final AuthService _auth = AuthService();

  //change the index when is tapped
  void onTapTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    //final themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,

      appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          title: Text(_title[_currentIndex], style: TextStyle(color: Colors.blue)),
          elevation: 0.0, //we dont

          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: IconButton(
                  onPressed: () {
                    BlocProvider.of<ThemeBloc>(context).add(ThemeChanged(theme: AppTheme.Dark));
                    //ThemeChanger();

                    //themeChanger.switchTheme();
                  },
                  icon: Theme.of(context).backgroundColor==Colors.black12
                      ? Icon(
                    Icons.brightness_3,
                    color: Theme.of(context).backgroundColor==Colors.black12 ? Colors.grey[200] : Colors.grey[850],
                  )
                      : Icon(
                    Icons.wb_sunny,
                    color: Theme.of(context).backgroundColor==Colors.black12 ? Colors.grey[200] : Colors.grey[850],
                  ),
                ),
            ),
          ]
        ),
        body : _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).accentColor,
          onTap: onTapTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.add_circle),
              title: new Text("Add Event"),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.person),
              title: new Text("Profil"),
            ),
          ],
        ),
    );
  }
}
