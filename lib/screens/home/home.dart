import 'package:flutter/material.dart';
import 'package:mobileproject/services/authservice.dart';
import '../event/create_event.dart';
import '../event/list_events.dart';
import '../profil/profil_page.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}
class _HomeState extends State<Home> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    ListEvents(),
    CreateEvent(), //
    ProfilPage()
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
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          title: Text('Event Date', style: TextStyle(color: Colors.black)),
          elevation: 0.0, //we dont have drop shadow
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text('Logout')
            )
          ],
        ),
        body : _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
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
