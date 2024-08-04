import 'package:event_app/core/secrets/secrets.dart';
import 'package:event_app/data/data_source/local/app_database.dart';
import 'package:event_app/data/data_source/remote/events_api_services.dart';
import 'package:event_app/data/model/event_model/event_model.dart';
import 'package:event_app/data/repo_implementation/event_repo_implementation.dart';
import 'package:event_app/domain/repository_abstract/event_repository.dart';
import 'package:event_app/presentation/bloc/events_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

final sl = GetIt.instance;

initializeDependencies() async {
//here it will initialize the hive database
  await Hive.initFlutter();

  Hive.openBox<EventModel>(AppSecret.dbName);

  if (!Hive.isAdapterRegistered(EventModelAdapter().typeId)) {
    Hive.registerAdapter(EventModelAdapter());
  }

  sl.registerSingleton<AppDatabase>(AppDatabase());
  sl.registerSingleton<RemoteApiServices>(RemoteApiServices());

  sl.registerSingleton<EventRepository>(EventRepoImplementation(sl(), sl()));
  sl.registerFactory<EventsBloc>(
    () => EventsBloc(sl()),
  );
}
