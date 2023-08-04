// To parse this JSON data, do
//
//     final userLoginModel = userLoginModelFromJson(jsonString);

import 'dart:convert';

UserLoginModel userLoginModelFromJson(String str) =>
    UserLoginModel.fromJson(json.decode(str));

String userLoginModelToJson(UserLoginModel data) => json.encode(data.toJson());

class UserLoginModel {
  String? status;
  List<State>? state;
  String? message;

  UserLoginModel({
    this.status,
    this.state,
    this.message,
  });

  factory UserLoginModel.fromJson(Map<String, dynamic> json) => UserLoginModel(
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
  String? mobile;
  String? otp;
  int? expired;
  DateTime? createdAt;

  State({
    this.id,
    this.mobile,
    this.otp,
    this.expired,
    this.createdAt,
  });

  factory State.fromJson(Map<String, dynamic> json) => State(
        id: json["id"],
        mobile: json["mobile"],
        otp: json["otp"],
        expired: json["expired"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mobile": mobile,
        "otp": otp,
        "expired": expired,
        "created_at": createdAt!.toIso8601String(),
      };
}
