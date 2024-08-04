import 'dart:convert';
import 'dart:developer';

import 'package:event_app/data/model/event_model/event_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class RemoteApiServices {
  Future<(String, List<EventModel>?)> getAllEvents(
      {required String token, required String url}) async {
    try {
      Map<String, String> headers = {"Authorization": "Bearer $token"};
      var uri = Uri.parse(
        url,
      );
      var res = await http.get(
        uri,
        headers: headers,
      );
      log("${res.statusCode} ${res.body}", name: "response of all events");
      if (res.statusCode == 200) {
        Model model = Model.fromJson(jsonDecode(res.body));
        return ("success", model.data ?? []);
      } else {
        return ("error", null);
      }
    } catch (e) {
      if (kDebugMode) {
        log(e.toString(), name: "Get all events Exception");
      }
      return ("error", null);
    }
  }
}
