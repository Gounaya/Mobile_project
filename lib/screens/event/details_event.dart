import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobileproject/data/models/event.dart';
import 'package:mobileproject/screens/event/detailEventContent/city_address_widget.dart';
import 'package:mobileproject/screens/event/detailEventContent/date_widget.dart';
import 'package:mobileproject/screens/event/detailEventContent/description_widget.dart';
import 'package:mobileproject/screens/event/detailEventContent/target_data_widget.dart';
import 'package:mobileproject/theme/theme_changer.dart';
import 'package:provider/provider.dart';

import 'detailEventContent/created_by_widget.dart';


class DetailEvent extends StatelessWidget {

  final Event event;
  const DetailEvent({Key key, @required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 70.0),
        Icon(
          Icons.restaurant,
          color: Colors.white,
          size: 40.0,
        ),
        Container(
          width: 100.0,
          child: new Divider(
            color: Colors.white,
            thickness: 2,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          event.title,
          style: TextStyle(color: Colors.white, fontSize: 35.0),
        ),
      ],
    );



    //I should add an image under the blue
    final topContent = Stack(

      children: <Widget>[

        Padding(
          padding: const EdgeInsets.only(top:30.0),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Center(
                child: topContentText,
              ),
            ),
          ),
        ),
      ],
    );

    final bottomContentText = Text(
      event.description,
      style: TextStyle(fontSize: 18.0),
    );

    final bottomContent = Expanded(
      flex: 1,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[

              dateWidget(event, context),
              cityAddressWidget(event, context),
              Divider(
                height: 50,
              ),
              createdByWidget(event, context),
              targetDataWidget(event, context),
              descriptionWidget(event, context),
            ],
          ),
        ),
      ),
    );

    final buttonsContent = Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25.0),
                        child: MaterialButton(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text('Go back!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
    );

    return Scaffold(
      backgroundColor: themeChanger.theme.backgroundColor,
      body: Column(
        children: <Widget>[
          topContent,
          SizedBox(height: 30.0),
          bottomContent,
          buttonsContent
        ],
      ),
    );
  }
}