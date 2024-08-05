import 'dart:developer';

import 'package:event_app/core/secrets/secrets.dart';
import 'package:event_app/data/model/event_model/event_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class AppDatabase {
  Future<List<EventModel>> getAllEvents() async {
    try {
      final eventDB = await Hive.openBox<EventModel>(AppSecret.dbName);
      var list = eventDB.values.toList();
      list.sort(
        (a, b) => a.createdAt!.compareTo(b.createdAt!),
      );
      for (var data in list) {
        log("${DateFormat('dd MMM yyyy').format(data.startAt!).toString()} ",
            name: "date of ${data.title}");
      }
      return list;
    } catch (e) {
      if (kDebugMode) {
        log(e.toString(), name: "Get all events Exception");
      }
      return [];
    }
  }

  Future<int> putAllEvents({required List<EventModel> eventList}) async {
    try {
      final eventDB = await Hive.openBox<EventModel>(AppSecret.dbName);
      var res = await eventDB.addAll(eventList);
      log(res.toString(), name: "db added response");

      return 200;
    } catch (e) {
      if (kDebugMode) {
        log(e.toString(), name: "Get all events Exception");
      }
      return 500;
    }
  }

  Future<int> clearDB() async {
    try {
      final eventDB = await Hive.openBox<EventModel>(AppSecret.dbName);
      var res = await eventDB.clear();
      log(res.toString(), name: "db added response");

      return 200;
    } catch (e) {
      if (kDebugMode) {
        log(e.toString(), name: "Get all events Exception");
      }
      return 500;
    }
  }
}
