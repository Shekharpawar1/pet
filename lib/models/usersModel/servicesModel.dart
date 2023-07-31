// To parse this JSON data, do
//
//     final servicesModel = servicesModelFromJson(jsonString);

import 'dart:convert';

class ServicesModel {
  String? status;
  List<Datum>? data;
  String? message;

  ServicesModel({
    this.status,
    this.data,
    this.message,
  });

  factory ServicesModel.fromRawJson(String str) =>
      ServicesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServicesModel.fromJson(Map<String, dynamic> json) => ServicesModel(
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

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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
