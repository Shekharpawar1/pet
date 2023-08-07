// To parse this JSON data, do
//
//     final stateListModel = stateListModelFromJson(jsonString);

import 'dart:convert';

StateListModel stateListModelFromJson(String str) =>
    StateListModel.fromJson(json.decode(str));

String stateListModelToJson(StateListModel data) => json.encode(data.toJson());

class StateListModel {
  String? status;
  List<State>? state;
  String? message;

  StateListModel({
    this.status,
    this.state,
    this.message,
  });

  factory StateListModel.fromJson(Map<String, dynamic> json) => StateListModel(
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
  String? stateName;

  State({
    this.id,
    this.stateName,
  });

  factory State.fromJson(Map<String, dynamic> json) => State(
        id: json["id"],
        stateName: json["state_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "state_name": stateName,
      };
}
