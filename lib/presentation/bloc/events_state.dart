part of 'events_bloc.dart';

sealed class EventsState extends Equatable {
  const EventsState();

  @override
  List<Object> get props => [];
}

final class EventsInitial extends EventsState {}

final class EventsLoading extends EventsState {}

final class EventsLoaded extends EventsState {
  final List<EventModel> eventList;

  const EventsLoaded({required this.eventList});
}

final class EventsLoadError extends EventsState {}
