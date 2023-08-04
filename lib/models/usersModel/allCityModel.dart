// To parse this JSON data, do
//
//     final allCityModel = allCityModelFromJson(jsonString);

import 'dart:convert';

AllCityModel allCityModelFromJson(String str) =>
    AllCityModel.fromJson(json.decode(str));

String allCityModelToJson(AllCityModel data) => json.encode(data.toJson());

class AllCityModel {
  String? status;
  List<State>? state;
  String? message;

  AllCityModel({
    this.status,
    this.state,
    this.message,
  });

  factory AllCityModel.fromJson(Map<String, dynamic> json) => AllCityModel(
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
  String? cityName;

  State({
    this.id,
    this.cityName,
  });

  factory State.fromJson(Map<String, dynamic> json) => State(
        id: json["id"],
        cityName: json["city_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "city_name": cityName,
      };
}
