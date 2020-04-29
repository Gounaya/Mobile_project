

class Event {

   String title;
   String createdBy;
   String numero;
   DateTime dayDate;
   DateTime timeDate;
   String address;
   int minAge;
   int maxAge;
   String gender;
   String description;

   Event(this.title, this.createdBy, this.numero, this.dayDate, this.timeDate,
       this.address, this.minAge, this.maxAge, this.gender, this.description);


   Map<String, dynamic> toJson() => {
      'title': title,
      'createdBy': createdBy,
      'numero': numero,
      'dayDate': dayDate,
      'timeDate': timeDate,
      'address': address,
      'minAge': minAge,
      'maxAge': maxAge,
      'gender': gender,
      'description': description,
   };

}