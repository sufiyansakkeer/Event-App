import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Container(),
      body: SfCalendar(
        view: CalendarView.month,
        initialDisplayDate: DateTime.now(),
      ),
    );
  }
}
