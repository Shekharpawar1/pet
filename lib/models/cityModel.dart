// To parse this JSON data, do
//
//     final cityListModel = cityListModelFromJson(jsonString);

import 'dart:convert';

CityListModel cityListModelFromJson(String str) =>
    CityListModel.fromJson(json.decode(str));

String cityListModelToJson(CityListModel data) => json.encode(data.toJson());

class CityListModel {
  String? status;
  List<State>? state;
  String? message;

  CityListModel({
    this.status,
    this.state,
    this.message,
  });

  factory CityListModel.fromJson(Map<String, dynamic> json) => CityListModel(
        status: json["status"],
        state: List<State>.from(json["data"].map((x) => State.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(state!.map((x) => x.toJson())),
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
