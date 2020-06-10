

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobileproject/data/models/event.dart';
import 'package:mobileproject/theme/theme_changer.dart';
import 'package:provider/provider.dart';


Widget targetDataWidget(Event event, BuildContext context) {
  final themeChanger = Provider.of<ThemeChanger>(context);

  return Card(
    color: themeChanger.theme.cardColor,

    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Column(
                      children: <Widget>[
                        Icon(
                          Icons.person,
                          size: 18.0,
                          color: themeChanger.theme.primaryColor,
                        ),
                      ]
                  ),
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text("Gender : ",
                          style: TextStyle(
                              color: themeChanger.theme.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0
                          ),
                        ),
                        new Text("Age between : ",
                          style: TextStyle(
                              color: themeChanger.theme.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0
                          ),
                        ),
                      ]
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        children: <Widget>[
                          new Text(event.gender,
                            style: TextStyle(
                                color: themeChanger.theme.primaryColor,
                                //fontWeight: FontWeight.bold,
                                fontSize: 18.0
                            ),
                          ),
                          new Text(event.minAge.toString()+ " - "+event.maxAge.toString(),
                            style: TextStyle(
                                color: themeChanger.theme.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0
                            ),
                          ),
                        ]
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}