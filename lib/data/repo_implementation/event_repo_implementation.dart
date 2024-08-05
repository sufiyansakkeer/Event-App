import 'package:event_app/core/constants/strings.dart';
import 'package:event_app/core/secrets/secrets.dart';
import 'package:event_app/data/data_source/local/app_database.dart';
import 'package:event_app/data/data_source/remote/events_api_services.dart';
import 'package:event_app/data/model/event_model/event_model.dart';
import 'package:event_app/domain/repository_abstract/event_repository.dart';

class EventRepoImplementation extends EventRepository {
  final RemoteApiServices _remoteApiServices;
  final AppDatabase _appDatabase;

  EventRepoImplementation(this._remoteApiServices, this._appDatabase);
  @override
  getAllEvents() async {
    (String, List<EventModel>?) res = await _remoteApiServices.getAllEvents(
        token: AppSecret.token, url: Urls.getEventUrl);
    return res;
  }

  @override
  getAllSavedEvents() async {
    var res = await _appDatabase.getAllEvents();
    return res;
  }

  @override
  saveAllEvents({required List<EventModel> eventList}) async {
    var res = await _appDatabase.putAllEvents(eventList: eventList);
    return res;
  }

  @override
  Future<int> clearDB() async {
    var res = await _appDatabase.clearDB();
    return res;
  }
}
