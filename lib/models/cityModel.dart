// To parse this JSON data, do
//
//     final cityListModel = cityListModelFromJson(jsonString);

import 'dart:convert';

CityListModel cityListModelFromJson(String str) =>
    CityListModel.fromJson(json.decode(str));

String cityListModelToJson(CityListModel state) => json.encode(state.toJson());

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

  factory State.fromJson(Map<String, dynamic> json) 
 => State(
        id: json["id"],
        cityName: json["city_name"],
      );
      
  Map<String, dynamic> toJson() => {
        "id": id,
        "city_name": cityName,
      };
}



// class CityListModel {
//   CityListModel({
//     required this.status,
//     required this.state,
//     required this.message,
//   });
//   late final String status;
//   late final List<State> state;
//   late final String message;
  
//   CityListModel.fromJson(Map<String, dynamic> json){
//     status = json['status'];
//     state = List.from(json['data']).map((e)=>State.fromJson(e)).toList();
//     message = json['message'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['status'] = status;
//     _data['data'] = state.map((e)=>e.toJson()).toList();
//     _data['message'] = message;
//     return _data;
//   }
// }

// class State {
//   State({
//     required this.id,
//     required this.cityName,
//   });
//   late final int id;
//   late final String cityName;
  
//   State.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     cityName = json['city_name'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['city_name'] = cityName;
//     return _data;
//   }
// }
