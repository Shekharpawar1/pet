// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

class NotificationModel {
  String? status;
  List<State>? state;
  String? message;

  NotificationModel({
    this.status,
    this.state,
    this.message,
  });

  factory NotificationModel.fromRawJson(String str) =>
      NotificationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        status: json["status"],
        state: List<State>.from(json["state"].map((x) => State.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "state": List<dynamic>.from(state!.map((x) => x.toJson())),
        "message": message,
      };
}

class State {
  int? id;
  String? title;
  String? description;
  String? image;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? tergat;
  int? zoneId;

  State({
    this.id,
    this.title,
    this.description,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.tergat,
    this.zoneId,
  });

  factory State.fromRawJson(String str) => State.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory State.fromJson(Map<String, dynamic> json) => State(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        tergat: json["tergat"],
        zoneId: json["zone_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "tergat": tergat,
        "zone_id": zoneId,
      };
}
