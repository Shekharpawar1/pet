// class MyServicesModel {
//   String? status;
//   List<Data>? data;
//   String? message;

//   MyServicesModel({this.status, this.data, this.message});

//   MyServicesModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//     message = json['message'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     data['message'] = this.message;
//     return data;
//   }
// }

// class Data {
//   int? id;
//   int? userId;
//   String? serviceId;
//   String? date;
//   String? slot;
//   String? pet;
//   String? city;
//   String? mobile;
//   String? status;
//   String? createdAt;
//   String? updatedAt;

//   Data(
//       {this.id,
//       this.userId,
//       this.serviceId,
//       this.date,
//       this.slot,
//       this.pet,
//       this.city,
//       this.mobile,
//       this.status,
//       this.createdAt,
//       this.updatedAt});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     serviceId = json['service_id'];
//     date = json['date'];
//     slot = json['slot'];
//     pet = json['pet'];
//     city = json['city'];
//     mobile = json['mobile'];
//     status = json['status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['service_id'] = this.serviceId;
//     data['date'] = this.date;
//     data['slot'] = this.slot;
//     data['pet'] = this.pet;
//     data['city'] = this.city;
//     data['mobile'] = this.mobile;
//     data['status'] = this.status;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }


class MyServicesModel {
  String? status;
  List<Data>? data;
  String? message;

  MyServicesModel({this.status, this.data, this.message});

  MyServicesModel.fromJson(Map<String, dynamic> json) {
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
  String? serviceId;
  String? date;
  String? slot;
  String? pet;
  String? city;
  String? mobile;
  String? status;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.userId,
      this.serviceId,
      this.date,
      this.slot,
      this.pet,
      this.city,
      this.mobile,
      this.status,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    serviceId = json['service_id'];
    date = json['date'];
    slot = json['slot'];
    pet = json['pet'];
    city = json['city'];
    mobile = json['mobile'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['service_id'] = this.serviceId;
    data['date'] = this.date;
    data['slot'] = this.slot;
    data['pet'] = this.pet;
    data['city'] = this.city;
    data['mobile'] = this.mobile;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}