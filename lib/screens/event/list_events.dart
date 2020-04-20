
import 'package:flutter/material.dart';
import 'package:mobileproject/data/models/event.dart';
import 'package:intl/intl.dart';

class ListEvents extends StatelessWidget {

  final List<Event> eventsList = [
    Event("date Lille", DateTime.now(), "45 Boulevard Carnot, 59800 Lille", "Drink", "max",""),
    Event("restaurant labo", DateTime.now(), "45 Boulevard Carnot, 59800 Lille", "Party", "max",""),
    Event("TacosLille", DateTime.now(), "45 Boulevard Carnot, 59800 Lille", "Party", "max",""),
    Event("Gare Flandre Rest", DateTime.now(), "45 Boulevard Carnot, 59800 Lille", "Party", "max",""),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
        new ListView.builder(
            itemCount: eventsList.length,
            itemBuilder: (BuildContext context, int index) =>
                buildTripCard(context, index)
        ),
    );
  }
  Widget buildTripCard(BuildContext contex, int index){
    final event = eventsList[index];
    return new Container(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                    child: Row(children: <Widget>[
                      Text(event.title, style: new TextStyle(fontSize: 30.0),),
                      Spacer(),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, bottom: 40.0),
                    child: Row(children: <Widget>[
                      Text("${DateFormat('dd/MM/yyyy').format(event.date).toString()} | ${DateFormat('hh:mm').format(event.date).toString()}"),
                      Spacer(),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Row(
                      children: <Widget>[
                        Text(event.address, style: new TextStyle(fontSize: 15.0),),
                        Spacer(),
                        Icon(Icons.restaurant),
                      ],
                    ),
                  )
                ],
            ),
          ),
        )
    );
  }

}
