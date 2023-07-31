// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

class UserBannerModel {
  String? status;
  List<Datum>? data;
  String? message;

  UserBannerModel({
    this.status,
    this.data,
    this.message,
  });

  factory UserBannerModel.fromRawJson(String str) =>
      UserBannerModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserBannerModel.fromJson(Map<String, dynamic> json) => UserBannerModel(
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
  String? title;
  String? type;
  String? image;
  int? status;
  String? data;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? zoneId;
  int? moduleId;
  int? featured;
  dynamic? defaultLink;

  Datum({
    this.id,
    this.title,
    this.type,
    this.image,
    this.status,
    this.data,
    this.createdAt,
    this.updatedAt,
    this.zoneId,
    this.moduleId,
    this.featured,
    this.defaultLink,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        type: json["type"],
        image: json["image"],
        status: json["status"],
        data: json["data"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        zoneId: json["zone_id"],
        moduleId: json["module_id"],
        featured: json["featured"],
        defaultLink: json["default_link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "type": type,
        "image": image,
        "status": status,
        "data": data,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "zone_id": zoneId,
        "module_id": moduleId,
        "featured": featured,
        "default_link": defaultLink,
      };
}
