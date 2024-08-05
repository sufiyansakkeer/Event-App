import 'package:event_app/data/model/event_model/event_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventSourceModel extends CalendarDataSource {
  EventSourceModel(List<EventModel> events) {
    appointments = events;
  }

  EventModel getEvent(int index) => appointments![index] as EventModel;

  // @override
  // String? getStartTimeZone(int index) =>
  //     DateFormat.jm().format(getEvent(index).startAt!);

  @override
  DateTime getStartTime(int index) => getEvent(index).startAt!;

  @override
  String? getNotes(int index) => getEvent(index).description;

  @override
  String getSubject(int index) => getEvent(index).title ?? "";
  @override
  Color getColor(int index) {
    return getEvent(index).status == "Confirmed" ? Colors.green : Colors.red;
  }

  @override
  DateTime getEndTime(int index) {
    return getEvent(index).startAt!.add(const Duration(minutes: 10));
  }

  @override
  bool isAllDay(int index) {
    return true;
  }
}
