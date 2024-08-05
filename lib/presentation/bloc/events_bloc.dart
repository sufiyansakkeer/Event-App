import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:event_app/data/model/event_model/event_model.dart';
import 'package:event_app/domain/repository_abstract/event_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final EventRepository _eventRepository;
  EventsBloc(this._eventRepository) : super(EventsInitial()) {
    on<GetAllEvents>((event, emit) async {
      try {
        var dbDataRes = await _eventRepository.getAllSavedEvents();
        log(dbDataRes.length.toString(), name: "db data length");
        if (dbDataRes.isEmpty) {
          (String, List<EventModel>?) res =
              await _eventRepository.getAllEvents();
          if (res.$1 == "success") {
            log(res.$2?.length.toString() ?? '', name: "data length");
            await _eventRepository.saveAllEvents(eventList: res.$2 ?? []);
          }
          var list = await _eventRepository.getAllSavedEvents();
          emit(EventsLoaded(eventList: list));
          log(list.length.toString(), name: "database list length");
        } else {
          emit(EventsLoaded(eventList: dbDataRes));
        }
      } catch (e) {
        log(e.toString(), name: "event bloc exception");
      }
    });
  }
}
