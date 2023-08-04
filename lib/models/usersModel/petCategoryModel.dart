// To parse this JSON data, do
//
//     final petCategoryModel = petCategoryModelFromJson(jsonString);

import 'dart:convert';

PetCategoryModel petCategoryModelFromJson(String str) =>
    PetCategoryModel.fromJson(json.decode(str));

String petCategoryModelToJson(PetCategoryModel data) =>
    json.encode(data.toJson());

class PetCategoryModel {
  String? status;
  List<Pet>? data;
  String? message;

  PetCategoryModel({
    this.status,
    this.data,
    this.message,
  });

  factory PetCategoryModel.fromJson(Map<String, dynamic> json) =>
      PetCategoryModel(
        status: json["status"],
        data: List<Pet>.from(json["data"].map((x) => Pet.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class Pet {
  int? id;
  String? name;
  String? type;
  String? image;
  int? parentId;
  int? position;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? priority;
  int? moduleId;
  List<dynamic>? translations;

  Pet({
    this.id,
    this.name,
    this.type,
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

  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
        id: json["id"],
        name: json["name"],
        type: json["type"],
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
        "type": type,
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
