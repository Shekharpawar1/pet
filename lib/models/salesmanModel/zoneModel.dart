// To parse this JSON data, do
//
//     final zoneModel = zoneModelFromJson(jsonString);

import 'dart:convert';

class ZoneModel {
  String? status;
  List<Zone>? data;
  String? message;

  ZoneModel({
    this.status,
    this.data,
    this.message,
  });

  factory ZoneModel.fromRawJson(String str) =>
      ZoneModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ZoneModel.fromJson(Map<String, dynamic> json) => ZoneModel(
        status: json["status"],
        data: List<Zone>.from(json["data"].map((x) => Zone.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class Zone {
  int? id;
  String? name;

  Zone({
    this.id,
    this.name,
  });

  factory Zone.fromRawJson(String str) => Zone.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Zone.fromJson(Map<String, dynamic> json) => Zone(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
