import 'package:event_app/data/model/event_model/event_model.dart';

abstract class EventRepository {
// from remote
  Future<(String, List<EventModel>?)> getAllEvents();
//  To save all the events in database
  Future<int> saveAllEvents({required List<EventModel> eventList});
  // to get all events that saved in database
  Future<List<EventModel>> getAllSavedEvents();

  Future<int> clearDB();
}
