

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobileproject/data/models/event.dart';


Widget createdByWidget(Event event) {
  return Card(
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
                          Icons.account_circle,
                          size: 18.0,
                          //color: Colors.black,
                        ),
                      ]
                  ),
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text("Created by : ",
                          style: TextStyle(
                              //color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0
                          ),
                        ),
                        new Text("Phone : ",
                          style: TextStyle(
                              //color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0
                          ),
                        ),
                      ]
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                        children: <Widget>[
                          new Text(event.createdBy,
                            style: TextStyle(
                                //color: Colors.black,
                                //fontWeight: FontWeight.bold,
                                fontSize: 18.0
                            ),
                          ),
                          new Text(event.numero,
                            style: TextStyle(
                                //color: Colors.black,
                                //fontWeight: FontWeight.bold,
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