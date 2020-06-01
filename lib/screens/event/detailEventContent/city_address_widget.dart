

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobileproject/data/models/event.dart';


Widget cityAddressWidget(Event event) {
  return Card(
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
                      Icons.location_on,
                      size: 18.0,
                      //color: Colors.black54,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          event.address+", "+event.city,
                          style: TextStyle(
                              //color: Colors.black45,
                              //fontWeight: FontWeight.bold,
                              fontSize: 18.0
                          ),
                          softWrap: true,
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
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