// To parse this JSON data, do
//
//     final servicesCategoryModel = servicesCategoryModelFromJson(jsonString);

import 'dart:convert';

class ServicesCategoryModel {
  String? status;
  List<Datum>? data;
  String? message;

  ServicesCategoryModel({
    this.status,
    this.data,
    this.message,
  });

  factory ServicesCategoryModel.fromRawJson(String str) =>
      ServicesCategoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServicesCategoryModel.fromJson(Map<String, dynamic> json) =>
      ServicesCategoryModel(
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
  String? description;
  int? status;
  int? serviceCategoryId;
  String? thumbnail;
  String? price;
  String? discountType;
  String? discount;
  String? startTime;
  String? endTime;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.name,
    this.description,
    this.status,
    this.serviceCategoryId,
    this.thumbnail,
    this.price,
    this.discountType,
    this.discount,
    this.startTime,
    this.endTime,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        status: json["status"],
        serviceCategoryId: json["service_category_id"],
        thumbnail: json["thumbnail"],
        price: json["price"],
        discountType: json["discount_type"],
        discount: json["discount"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "status": status,
        "service_category_id": serviceCategoryId,
        "thumbnail": thumbnail,
        "price": price,
        "discount_type": discountType,
        "discount": discount,
        "start_time": startTime,
        "end_time": endTime,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
