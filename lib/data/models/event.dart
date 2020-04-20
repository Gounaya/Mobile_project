

class Event {
  final String title;
  final DateTime date;
  final String address;
  final String dateType;
  final String personWith;
  final String description;

  Event(this.title, this.date, this.address, this.dateType, this.personWith, this.description);

  @override
  String toString() {
    return 'Event{title: $title, date: $date, address: $address, dateType: $dateType, personWith: $personWith, Description: $description}';
  }

}