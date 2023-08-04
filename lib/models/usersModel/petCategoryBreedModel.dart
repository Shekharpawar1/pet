// To parse this JSON data, do
//
//     final petCategoryBreedModel = petCategoryBreedModelFromJson(jsonString);

import 'dart:convert';

PetCategoryBreedModel petCategoryBreedModelFromJson(String str) =>
    PetCategoryBreedModel.fromJson(json.decode(str));

String petCategoryBreedModelToJson(PetCategoryBreedModel data) =>
    json.encode(data.toJson());

class PetCategoryBreedModel {
  String? status;
  List<State>? state;
  String? message;

  PetCategoryBreedModel({
    this.status,
    this.state,
    this.message,
  });

  factory PetCategoryBreedModel.fromJson(Map<String, dynamic> json) =>
      PetCategoryBreedModel(
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
  int? categoryId;
  String? name;
  int? status;
  dynamic? createdAt;
  dynamic? updatedAt;

  State({
    this.id,
    this.categoryId,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory State.fromJson(Map<String, dynamic> json) => State(
        id: json["id"],
        categoryId: json["category_id"],
        name: json["name"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "name": name,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
