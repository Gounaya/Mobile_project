
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobileproject/screens/event/details_event.dart';
import 'package:mobileproject/shared/bouncy_page_route.dart';
import 'package:mobileproject/shared/loading.dart';
import 'package:mobileproject/shared/provider_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:mobileproject/data/models/event.dart';
import 'package:google_fonts/google_fonts.dart';


class ListEvents extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: getAllEventsStreamSnapshots(context),
          builder: (context, snapshot) {
            if(!snapshot.hasData)
              //return const Text("Loading");
              return Loading();
            return new ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int index) =>
                    buildEventCard(context, snapshot.data.documents[index])
            );
          }
        ),
    );
  }

  // Get event by user UID
  Stream<QuerySnapshot> getUsersEventsStreamSnapshots(context) async*{
    final uid = await ProviderAuth.of(context).auth.getCurrentUID();
    yield* Firestore.instance.collection('userEvents').document(uid).collection('events').snapshots();  //yields* : from present to the past
  }

  // Get all events
  Stream<QuerySnapshot> getAllEventsStreamSnapshots(context) async*{
    yield* Firestore.instance.collection('events').snapshots();  //yields* : from present to the past
  }

  Widget buildEventCard(BuildContext context, DocumentSnapshot document){
    final event = Event.fromSnapshot(document);
    return new Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0,),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                        child: Row(children: <Widget>[
                          Text(event.title, style: GoogleFonts.raleway(fontSize: 30.0),), //
                          Spacer(),
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0, bottom: 40.0),
                        child: Row(children: <Widget>[
                          Text("${DateFormat('dd/MM/yyyy').format(event.dayDate).toString()} | ${DateFormat('hh:mm').format(event.timeDate).toString()}"),
                          Spacer(),
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              size: 18.0,
                            ),
                            Padding(padding: EdgeInsets.only(left: 8.0)),

                            Text(event.address, style: new TextStyle(fontSize: 15.0),overflow: TextOverflow.fade),
                            Spacer(),
                            Icon(Icons.restaurant),
                          ],
                        ),
                      )
                    ],
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    /*MaterialPageRoute(
                      builder: (context) => DetailEvent(event: event,)
                    ),*/
                    BouncyPageRoute(widget: DetailEvent(event: event,) )
                );
              },
            ),
          ),
        )
    );
  }

}
