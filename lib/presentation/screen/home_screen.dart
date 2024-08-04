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
  @override
  void initState() {
    context.read<EventsBloc>().add(GetAllEvents());
    super.initState();
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
                // resourceViewHeaderBuilder: (context, details) {
                //   return Row(
                //     children: [Text(details.resource.displayName)],
                //   );
                // },
                weekNumberStyle: const WeekNumberStyle(),
                showTodayButton: true,
                showDatePickerButton: true,
                allowAppointmentResize: false,
                showWeekNumber: false,
                view: CalendarView.month,
                allowViewNavigation: true,
                viewNavigationMode: ViewNavigationMode.snap,
                initialDisplayDate: DateTime.now(),
                allowedViews: const [
                  CalendarView.month,
                  // CalendarView.week,
                  // CalendarView.day,
                ],
                showCurrentTimeIndicator: true,
                dataSource: EventSourceModel(state.eventList),
              );
            } else {
              return SfCalendar(
                // showNavigationArrow: true,
                headerHeight: 60,
                headerStyle: const CalendarHeaderStyle(
                  textAlign: TextAlign.center,
                ),
                resourceViewHeaderBuilder: (context, details) {
                  return Row(
                    children: [Text(details.resource.displayName)],
                  );
                },
                weekNumberStyle: const WeekNumberStyle(),
                showTodayButton: true,
                showDatePickerButton: true,
                allowAppointmentResize: true,
                showWeekNumber: false,
                view: CalendarView.week,
                allowViewNavigation: true,
                viewNavigationMode: ViewNavigationMode.snap,
                initialDisplayDate: DateTime.now(),
                allowedViews: const [
                  CalendarView.week,
                  CalendarView.day,
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
