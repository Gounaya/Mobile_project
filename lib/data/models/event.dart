

class Event {
  final String title;
  final DateTime date;
  final String address;
  final String dateType;
  final String personWith;

  Event(this.title, this.date, this.address, this.dateType, this.personWith);

  @override
  String toString() {
    return 'Event{title: $title, date: $date, place: $address, dateType: $dateType, personWith: $personWith}';
  }


}