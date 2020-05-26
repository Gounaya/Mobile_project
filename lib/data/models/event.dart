

import 'package:cloud_firestore/cloud_firestore.dart';

class Event {

   String title;
   String createdBy;
   String numero;
   DateTime dayDate;
   DateTime timeDate;
   String city;
   String address;
   int minAge;
   int maxAge;
   String gender;
   String description;

   Event(this.title, this.createdBy, this.numero, this.dayDate, this.timeDate,
       this.city, this.address, this.minAge, this.maxAge, this.gender, this.description);


   Map<String, dynamic> toJson() => {
      'title': title,
      'createdBy': createdBy,
      'numero': numero,
      'dayDate': dayDate,
      'timeDate': timeDate,
      'city': city,
      'address': address,
      'minAge': minAge,
      'maxAge': maxAge,
      'gender': gender,
      'description': description,
   };

   // creating a event object from firebase snapshot
   Event.fromSnapshot(DocumentSnapshot snapshot) :
      title= snapshot['title'],
      createdBy= snapshot['createdBy'],
      numero= snapshot['numero'],
      dayDate= snapshot['dayDate'].toDate(),
      timeDate= snapshot['timeDate'].toDate(),
      city= snapshot['city'],
      address= snapshot['address'],
      minAge= snapshot['minAge'],
      maxAge= snapshot['maxAge'],
      gender= snapshot['gender'],
      description= snapshot['description'];


}