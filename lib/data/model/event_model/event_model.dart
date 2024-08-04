import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

part 'event_model.g.dart';

class Model {
  final List<EventModel>? data;

  Model({
    this.data,
  });

  factory Model.fromRawJson(String str) => Model.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        data: json["data"] == null
            ? []
            : List<EventModel>.from(
                json["data"]!.map((x) => EventModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

@HiveType(typeId: 1)
class EventModel {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final DateTime? createdAt;
  @HiveField(2)
  final String? title;
  @HiveField(3)
  final String? description;
  @HiveField(4)
  final String? status;
  @HiveField(5)
  final DateTime? startAt;
  @HiveField(6)
  final int? duration;

  EventModel({
    this.createdAt,
    this.title,
    this.description,
    this.status,
    this.startAt,
    this.duration,
    this.id,
  });

  factory EventModel.fromRawJson(String str) =>
      EventModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        title: json["title"],
        description: json["description"],
        status: json["status"],
        startAt:
            json["startAt"] == null ? null : DateTime.parse(json["startAt"]),
        duration: json["duration"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "title": title,
        "description": description,
        "status": status,
        "startAt": startAt?.toIso8601String(),
        "duration": duration,
        "id": id,
      };
}
