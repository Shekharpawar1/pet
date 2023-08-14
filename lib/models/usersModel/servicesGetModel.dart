// To parse this JSON data, do
//
//     final servicesModelDart = servicesModelDartFromJson(jsonString);

import 'dart:convert';

ServicesModelDart servicesModelDartFromJson(String str) =>
    ServicesModelDart.fromJson(json.decode(str));

String servicesModelDartToJson(ServicesModelDart data) =>
    json.encode(data.toJson());

class ServicesModelDart {
  String? status;
  List<Datum>? data;
  String? message;

  ServicesModelDart({
    this.status,
    this.data,
    this.message,
  });

  factory ServicesModelDart.fromJson(Map<String, dynamic> json) =>
      ServicesModelDart(
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
  DateTime? slotDate;
  String? timeIntervel;
  String? startTime;
  String? endTime;
  List<String>? slotTiming;
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
    this.slotDate,
    this.timeIntervel,
    this.startTime,
    this.endTime,
    this.slotTiming,
    this.createdAt,
    this.updatedAt,
  });

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
        slotDate: DateTime.parse(json["slot_date"]),
        timeIntervel: json["time_intervel"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        slotTiming: List<String>.from(json["slot_timing"].map((x) => x)),
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
        "slot_date":
            "${slotDate!.year.toString().padLeft(4, '0')}-${slotDate!.month.toString().padLeft(2, '0')}-${slotDate!.day.toString().padLeft(2, '0')}",
        "time_intervel": timeIntervel,
        "start_time": startTime,
        "end_time": endTime,
        "slot_timing": List<dynamic>.from(slotTiming!.map((x) => x)),
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
