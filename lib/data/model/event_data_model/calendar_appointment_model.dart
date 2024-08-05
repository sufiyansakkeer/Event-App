import 'package:event_app/data/model/event_model/event_model.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalenderModel extends CalendarAppointmentDetails {
  CalenderModel(
      EventModel appointment, super.date, super.appointments, super.bounds) {
    appointment = super.appointments as EventModel;
  }
}
