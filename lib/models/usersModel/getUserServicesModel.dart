// To parse this JSON data, do
//
//     final userServicesModel = userServicesModelFromJson(jsonString);

import 'dart:convert';

UserServicesModel userServicesModelFromJson(String str) =>
    UserServicesModel.fromJson(json.decode(str));

String userServicesModelToJson(UserServicesModel data) =>
    json.encode(data.toJson());

class UserServicesModel {
  String? status;
  List<Datum>? data;
  String? message;

  UserServicesModel({
    this.status,
    this.data,
    this.message,
  });

  factory UserServicesModel.fromJson(Map<String, dynamic> json) =>
      UserServicesModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  int? id;
  String? name;
  String? image;
  int? status;
  int? priority;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.name,
    this.image,
    this.status,
    this.priority,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        status: json["status"],
        priority: json["priority"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "status": status,
        "priority": priority,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
