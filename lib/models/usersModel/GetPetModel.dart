// To parse this JSON data, do
//
//     final getPetModel = getPetModelFromJson(jsonString);

import 'dart:convert';

GetPetModel getPetModelFromJson(String str) =>
    GetPetModel.fromJson(json.decode(str));

String getPetModelToJson(GetPetModel data) => json.encode(data.toJson());

class GetPetModel {
  String? status;
  List<State>? state;
  String? message;

  GetPetModel({
    this.status,
    this.state,
    this.message,
  });

  factory GetPetModel.fromJson(Map<String, dynamic> json) => GetPetModel(
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
  int? userId;
  String? petsType;
  String? gender;
  String? breeds;
  String? dob;
  String? age;
  String? petName;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  State({
    this.id,
    this.userId,
    this.petsType,
    this.gender,
    this.breeds,
    this.dob,
    this.age,
    this.petName,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory State.fromJson(Map<String, dynamic> json) => State(
        id: json["id"],
        userId: json["user_id"],
        petsType: json["pets_type"],
        gender: json["gender"],
        breeds: json["breeds"],
        dob: json["dob"],
        age: json["age"],
        petName: json["pet_name"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "pets_type": petsType,
        "gender": gender,
        "breeds": breeds,
        "dob": dob,
        "age": age,
        "pet_name": petName,
        "image": image,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

// enum Gender { GENDER_MALE, MALE }

// final genderValues =
//     EnumValues({"Male": Gender.GENDER_MALE, "male": Gender.MALE});

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
