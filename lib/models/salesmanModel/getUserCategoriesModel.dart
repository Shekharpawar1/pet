// To parse this JSON data, do
//
//     final SalesCategoriesModel = SalesCategoriesModelFromJson(jsonString);

import 'dart:convert';

SalesCategoriesModel salesCategoriesModelFromJson(String str) =>
    SalesCategoriesModel.fromJson(json.decode(str));

String salesCategoriesModelToJson(SalesCategoriesModel data) =>
    json.encode(data.toJson());

class SalesCategoriesModel {
  String? status;
  List<Datum>? data;
  String? message;

  SalesCategoriesModel({
    this.status,
    this.data,
    this.message,
  });

  factory SalesCategoriesModel.fromJson(Map<String, dynamic> json) =>
      SalesCategoriesModel(
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
  int? parentId;
  int? position;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? priority;
  int? moduleId;
  List<dynamic>? translations;

  Datum({
    this.id,
    this.name,
    this.image,
    this.parentId,
    this.position,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.priority,
    this.moduleId,
    this.translations,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        parentId: json["parent_id"],
        position: json["position"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        priority: json["priority"],
        moduleId: json["module_id"],
        translations: List<dynamic>.from(json["translations"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "parent_id": parentId,
        "position": position,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "priority": priority,
        "module_id": moduleId,
        "translations": List<dynamic>.from(translations!.map((x) => x)),
      };
}
