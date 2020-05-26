

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobileproject/data/models/event.dart';


Widget dateWidget(Event event) {
  return Card(
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.date_range,
                    size: 18.0,
                    //color: Colors.black54,
                  ),
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  Text(
                    "${DateFormat('dd/MM/yyyy').format(event.dayDate).toString()} - ${DateFormat('hh:mm').format(event.timeDate).toString()}",
                    style: TextStyle(
                        //color: Colors.black54,
                        //fontWeight: FontWeight.bold,
                        fontSize: 18.0),
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