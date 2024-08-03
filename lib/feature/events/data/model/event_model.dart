import 'dart:convert';

class EventModel {
  final List<Data>? data;

  EventModel({
    this.data,
  });

  factory EventModel.fromRawJson(String str) =>
      EventModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        data: json["data"] == null
            ? []
            : List<Data>.from(json["data"]!.map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Data {
  final DateTime? createdAt;
  final String? title;
  final String? description;
  final String? status;
  final DateTime? startAt;
  final int? duration;
  final String? id;

  Data({
    this.createdAt,
    this.title,
    this.description,
    this.status,
    this.startAt,
    this.duration,
    this.id,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
