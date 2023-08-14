class AllVeterinaryModel {
  String? status;
  List<Data>? data;
  String? message;

  AllVeterinaryModel({this.status, this.data, this.message});

  AllVeterinaryModel.fromJson(Map<String, dynamic> json) {
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
  String? userName;
  String? email;
  String? phone;
  String? date;
  String? petId;
  String? petProblem;
  String? state;
  String? city;
  String? address;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.userId,
      this.userName,
      this.email,
      this.phone,
      this.date,
      this.petId,
      this.petProblem,
      this.state,
      this.city,
      this.address,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    userName = json['user_name'];
    email = json['email'];
    phone = json['phone'];
    date = json['date'];
    petId = json['pet_id'];
    petProblem = json['pet_problem'];
    state = json['state'];
    city = json['city'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['date'] = this.date;
    data['pet_id'] = this.petId;
    data['pet_problem'] = this.petProblem;
    data['state'] = this.state;
    data['city'] = this.city;
    data['address'] = this.address;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}