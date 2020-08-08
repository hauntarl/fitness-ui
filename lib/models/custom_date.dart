import 'package:intl/intl.dart';

class CustomDate {
  DateTime date;
  CustomDate(this.date);

  static final _weekdayFormat = DateFormat('EEEE');
  static final _dayFormat = DateFormat('MMM d y');

  String get weekday => _weekdayFormat.format(date).toUpperCase();
  String get formatted => _dayFormat.format(date).toUpperCase();

  void add() => date = date.add(Duration(days: 1));
  void subtract() => date = date.subtract(Duration(days: 1));
}
