

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobileproject/data/models/event.dart';


Widget descriptionWidget(Event event) {
  return SingleChildScrollView(
    //scrollDirection: Axis.horizontal,

    child: Card(

      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,

            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                child: Row(

                  children: <Widget>[
                    Column(
                        children: <Widget>[
                          Icon(
                            Icons.description,
                            size: 18.0,
                            //color: Colors.black,
                          ),
                        ]
                    ),
                    //Padding(padding: EdgeInsets.only(left: 10.0)),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Description : ",
                              style: TextStyle(
                                  //color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(event.description,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
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
    ),
  );
}