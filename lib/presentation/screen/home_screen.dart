import 'package:event_app/data/model/event_data_model/event_source_model.dart';
import 'package:event_app/presentation/bloc/events_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CalendarController _calendarController;
  @override
  void initState() {
    _calendarController = CalendarController();
    context.read<EventsBloc>().add(GetAllEvents());
    super.initState();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<EventsBloc, EventsState>(
          builder: (context, state) {
            if (state is EventsLoaded) {
              return SfCalendar(
                // showNavigationArrow: true,
                headerHeight: 60,
                headerStyle: const CalendarHeaderStyle(
                  textAlign: TextAlign.center,
                ),
                scheduleViewSettings:
                    const ScheduleViewSettings(hideEmptyScheduleWeek: true),
                timeRegionBuilder: (context, timeRegionDetails) =>
                    Text(timeRegionDetails.date.minute.toString()),

                showTodayButton: true,
                showDatePickerButton: true,
                allowAppointmentResize: false,
                showWeekNumber: false,
                todayHighlightColor: Colors.blueAccent,
                view: CalendarView.week,
                allowViewNavigation: true,
                viewNavigationMode: ViewNavigationMode.snap,
                initialDisplayDate: DateTime.now(),
                allowedViews: const [
                  // CalendarView.week,
                  CalendarView.week,
                ],
                showCurrentTimeIndicator: true,
                dataSource: EventSourceModel(state.eventList),
                monthViewSettings: const MonthViewSettings(
                  showAgenda: true,
                  appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
                  showTrailingAndLeadingDates: false,
                ),

                onTap: (calendarTapDetails) {},
              );
            } else {
              return SfCalendar(
                // showNavigationArrow: true,
                headerHeight: 60,
                headerStyle: const CalendarHeaderStyle(
                  textAlign: TextAlign.center,
                ),
                scheduleViewSettings:
                    const ScheduleViewSettings(hideEmptyScheduleWeek: true),
                timeRegionBuilder: (context, timeRegionDetails) =>
                    Text(timeRegionDetails.date.minute.toString()),

                showTodayButton: true,
                showDatePickerButton: true,
                allowAppointmentResize: false,
                showWeekNumber: false,
                todayHighlightColor: Colors.blueAccent,
                view: CalendarView.week,
                allowViewNavigation: true,
                viewNavigationMode: ViewNavigationMode.snap,
                initialDisplayDate: DateTime.now(),
                allowedViews: const [
                  // CalendarView.week,
                  CalendarView.week,
                ],
                showCurrentTimeIndicator: true,
                dataSource: EventSourceModel([]),
                monthViewSettings: const MonthViewSettings(
                  showAgenda: true,
                  appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
                  showTrailingAndLeadingDates: false,
                ),

                onTap: (calendarTapDetails) {},
              );
            }
          },
        ),
      ),
    );
  }
}
