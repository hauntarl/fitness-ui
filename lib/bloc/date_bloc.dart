import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../models/custom_date.dart';

enum DateEvent {
  add,
  subtract,
}

class DateBloc {
  static final _customDate = CustomDate(DateTime.now());
  static final Map<DateEvent, Function> _actionMap = {
    DateEvent.add: _customDate.add,
    DateEvent.subtract: _customDate.subtract,
  };

  final _dateSubject = BehaviorSubject<CustomDate>();
  final _dateController = StreamController<DateEvent>();

  Stream<CustomDate> get dateStream => _dateSubject.stream;
  Sink<DateEvent> get dateSink => _dateController.sink;

  DateBloc() {
    _dateController.stream.listen(perform);
  }

  void perform(DateEvent action) {
    _actionMap[action]();
    _dateSubject.add(_customDate);
  }

  void dispose() {
    _dateSubject.close();
    _dateController.close();
  }
}

final dateBloc = DateBloc();
final initialDate = CustomDate(DateTime.now());
