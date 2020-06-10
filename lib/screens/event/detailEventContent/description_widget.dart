

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobileproject/data/models/event.dart';
import 'package:mobileproject/theme/theme_changer.dart';
import 'package:provider/provider.dart';


Widget descriptionWidget(Event event, BuildContext context) {
  final themeChanger = Provider.of<ThemeChanger>(context);

  return Card(
    color: themeChanger.theme.cardColor,

      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,

            children: <Widget>[
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                  child: Row(

                    children: <Widget>[

                      Icon(
                        Icons.description,
                        size: 18.0,
                        color: themeChanger.theme.primaryColor,
                      ),

                      //Padding(padding: EdgeInsets.only(left: 10.0)),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Description : ",
                                  style: TextStyle(
                                      color: themeChanger.theme.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  event.description,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  maxLines: 6,
                                  style: TextStyle(
                                      color: themeChanger.theme.primaryColor,
                                      //fontWeight: FontWeight.bold,
                                      fontSize: 18.0
                                  ),
                                ),
                              ]
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
  );
}