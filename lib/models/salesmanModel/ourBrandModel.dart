
import 'dart:convert';

SalesOurBrandModel SalesOurBrandModelFromJson(String str) =>
    SalesOurBrandModel.fromJson(json.decode(str));
String SalesOurBrandModelToJson(SalesOurBrandModel data) =>
    json.encode(data.toJson());
class SalesOurBrandModel {
  String? status;
  List<Datum>? data;
  String? message;
  SalesOurBrandModel({
    this.status,
    this.data,
    this.message,
  });
  factory SalesOurBrandModel.fromJson(Map<String, dynamic> json) =>
      SalesOurBrandModel(
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
  String? image;
  String? logo;
  int? status;
  int? canine;
  DateTime? createdAt;
  DateTime? updatedAt;
  Datum({
    this.id,
    this.title,
    this.image,
    this.logo,
    this.status,
    this.canine,
    this.createdAt,
    this.updatedAt,
  });
  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        logo: json["logo"],
        status: json["status"],
        canine: json["canine"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "logo": logo,
        "status": status,
        "canine": canine,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

// // To parse this JSON data, do
// //
// //     final SalesourBrandModel = SalesourBrandModelFromJson(jsonString);

// import 'dart:convert';

// class SalesOurBrandModel {
//   String? status;
//   List<Datum>? data;
//   String? message;

//   SalesOurBrandModel({
//     this.status,
//     this.data,
//     this.message,
//   });

//   factory SalesOurBrandModel.fromRawJson(String str) =>
//       SalesOurBrandModel.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory SalesOurBrandModel.fromJson(Map<String, dynamic> json) => SalesOurBrandModel(
//         status: json["status"],
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//         message: json["message"],
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "data": List<dynamic>.from(data!.map((x) => x.toJson())),
//         "message": message,
//       };
// }

// class Datum {
//   int? id;
//   String? title;
//   String? image;
//   String? logo;
//   DateTime? createdAt;
//   DateTime? updatedAt;

//   Datum({
//     this.id,
//     this.title,
//     this.image,
//     this.logo,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         title: json["title"],
//         image: json["image"],
//         logo: json["logo"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "image": image,
//         "logo": logo,
//         "created_at": createdAt!.toIso8601String(),
//         "updated_at": updatedAt!.toIso8601String(),
//       };
// }
