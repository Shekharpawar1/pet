class DeliveryAddressModel {
  String? status;
  List<Data>? data;
  String? message;

  DeliveryAddressModel({this.status, this.data, this.message});

  DeliveryAddressModel.fromJson(Map<String, dynamic> json) {
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
  String? firstName;
  String? lastName;
  String? mobile;
  String? houseNo;
  String? area;
  int? userId;
  String? landmark;
  String? pincode;
  String? state;
  String? city;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.firstName,
        this.lastName,
        this.mobile,
        this.houseNo,
        this.area,
        this.userId,
        this.landmark,
        this.pincode,
        this.state,
        this.city,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobile = json['mobile'];
    houseNo = json['house_no'];
    area = json['area'];
    userId = json['user_id'];
    landmark = json['landmark'];
    pincode = json['pincode'];
    state = json['state'];
    city = json['city'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['mobile'] = this.mobile;
    data['house_no'] = this.houseNo;
    data['area'] = this.area;
    data['user_id'] = this.userId;
    data['landmark'] = this.landmark;
    data['pincode'] = this.pincode;
    data['state'] = this.state;
    data['city'] = this.city;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
