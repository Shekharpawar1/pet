// To parse this JSON data, do
//
//     final allServicesModel = allServicesModelFromJson(jsonString);

import 'dart:convert';

AllServicesModel allServicesModelFromJson(String str) => AllServicesModel.fromJson(json.decode(str));

String allServicesModelToJson(AllServicesModel data) => json.encode(data.toJson());

class AllServicesModel {
    String? status;
    List<Datum>? data;
    String? message;

    AllServicesModel({
        this.status,
        this.data,
        this.message,
    });

    factory AllServicesModel.fromJson(Map<String, dynamic> json) => AllServicesModel(
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
    int? userId;
    String? serviceId;
    String? date;
    String? slot;
    String? pet;
    String? city;
    String? mobile;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;

    Datum({
        this.id,
        this.userId,
        this.serviceId,
        this.date,
        this.slot,
        this.pet,
        this.city,
        this.mobile,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        serviceId: json["service_id"],
        date: json["date"],
        slot: json["slot"],
        pet: json["pet"],
        city: json["city"],
        mobile: json["mobile"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "service_id": serviceId,
        "date": date,
        "slot": slot,
        "pet": pet,
        "city": city,
        "mobile": mobile,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };
}
