// // To parse this JSON data, do
// //
// //     final getPetModel = getPetModelFromJson(jsonString);

// import 'dart:convert';

// GetPetModel getPetModelFromJson(String str) =>
//     GetPetModel.fromJson(json.decode(str));

// String getPetModelToJson(GetPetModel data) => json.encode(data.toJson());

// class GetPetModel {
//   String? status;
//   List<State>? state;
//   String? message;

//   GetPetModel({
//     this.status,
//     this.state,
//     this.message,
//   });

//   factory GetPetModel.fromJson(Map<String, dynamic> json) => GetPetModel(
//         status: json["status"],
//         state: List<State>.from(json["state"].map((x) => State.fromJson(x))),
//         message: json["message"],
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "state": List<dynamic>.from(state!.map((x) => x.toJson())),
//         "message": message,
//       };
// }

// class State {
//   int? id;
//   int? userId;
//   String? petsType;
//   String? gender;
//   String? breeds;
//   String? dob;
//   String? age;
//   String? petName;
//   String? image;
//   DateTime? createdAt;
//   DateTime? updatedAt;

//   State({
//     this.id,
//     this.userId,
//     this.petsType,
//     this.gender,
//     this.breeds,
//     this.dob,
//     this.age,
//     this.petName,
//     this.image,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory State.fromJson(Map<String, dynamic> json) => State(
//         id: json["id"],
//         userId: json["user_id"],
//         petsType: json["pets_type"],
//         gender: json["gender"],
//         breeds: json["breeds"],
//         dob: json["dob"],
//         age: json["age"],
//         petName: json["pet_name"],
//         image: json["image"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "user_id": userId,
//         "pets_type": petsType,
//         "gender": gender,
//         "breeds": breeds,
//         "dob": dob,
//         "age": age,
//         "pet_name": petName,
//         "image": image,
//         "created_at": createdAt!.toIso8601String(),
//         "updated_at": updatedAt!.toIso8601String(),
//       };
// }

// // enum Gender { GENDER_MALE, MALE }

// // final genderValues =
// //     EnumValues({"Male": Gender.GENDER_MALE, "male": Gender.MALE});

// // class EnumValues<T> {
// //   Map<String, T> map;
// //   late Map<T, String> reverseMap;

// //   EnumValues(this.map);

// //   Map<T, String> get reverse {
// //     reverseMap = map.map((k, v) => MapEntry(v, k));
// //     return reverseMap;
// //   }
// // }


class GetPetModel {
  String? status;
  List<Data>? data;
  String? message;

  GetPetModel({this.status, this.data, this.message});

  GetPetModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  int? userId;
  String? petsType;
  String? gender;
  String? breeds;
  String? dob;
  String? age;
  String? petName;
  String? image;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.userId,
      this.petsType,
      this.gender,
      this.breeds,
      this.dob,
      this.age,
      this.petName,
      this.image,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    petsType = json['pets_type'];
    gender = json['gender'];
    breeds = json['breeds'];
    dob = json['dob'];
    age = json['age'];
    petName = json['pet_name'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['pets_type'] = this.petsType;
    data['gender'] = this.gender;
    data['breeds'] = this.breeds;
    data['dob'] = this.dob;
    data['age'] = this.age;
    data['pet_name'] = this.petName;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}