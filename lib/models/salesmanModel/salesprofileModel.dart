

  

class SalesProfileModel {
  String? status;
  List<Data>? data;
  String? message;

  SalesProfileModel({this.status, this.data, this.message});

  SalesProfileModel.fromJson(Map<String, dynamic> json) {
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
  String? fName;
  String? lName;
  String? phone;
  String? email;
  String? image;
  int? isPhoneVerified;
  // Null? emailVerifiedAt;
  String? password;
  // Null? rememberToken;
  String? createdAt;
  String? updatedAt;
  // Null? interest;
  // Null? cmFirebaseToken;
  int? status;
  int? orderCount;
  // Null? loginMedium;
  // Null? socialId;
  // Null? zoneId;
  String? walletBalance;
  String? loyaltyPoint;
  // Null? refCode;
  String? currentLanguageKey;

  Data(
      {this.id,
      this.fName,
      this.lName,
      this.phone,
      this.email,
      this.image,
      this.isPhoneVerified,
      // this.emailVerifiedAt,
      this.password,
      // this.rememberToken,
      this.createdAt,
      this.updatedAt,
      // this.interest,
      // this.cmFirebaseToken,
      this.status,
      this.orderCount,
      // this.loginMedium,
      // this.socialId,
      // this.zoneId,
      this.walletBalance,
      this.loyaltyPoint,
      // this.refCode,
      this.currentLanguageKey});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fName = json['f_name'];
    lName = json['l_name'];
    phone = json['phone'];
    email = json['email'];
    image = json['image'];
    isPhoneVerified = json['is_phone_verified'];
    // emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    // rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    // interest = json['interest'];
    // cmFirebaseToken = json['cm_firebase_token'];
    status = json['status'];
    orderCount = json['order_count'];
    // loginMedium = json['login_medium'];
    // socialId = json['social_id'];
    // zoneId = json['zone_id'];
    walletBalance = json['wallet_balance'];
    loyaltyPoint = json['loyalty_point'];
    // refCode = json['ref_code'];
    currentLanguageKey = json['current_language_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['image'] = this.image;
    data['is_phone_verified'] = this.isPhoneVerified;
    // data['email_verified_at'] = this.emailVerifiedAt;
    data['password'] = this.password;
    // data['remember_token'] = this.rememberToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    // data['interest'] = this.interest;
    // data['cm_firebase_token'] = this.cmFirebaseToken;
    data['status'] = this.status;
    data['order_count'] = this.orderCount;
    // data['login_medium'] = this.loginMedium;
    // data['social_id'] = this.socialId;
    // data['zone_id'] = this.zoneId;
    data['wallet_balance'] = this.walletBalance;
    data['loyalty_point'] = this.loyaltyPoint;
    // data['ref_code'] = this.refCode;
    data['current_language_key'] = this.currentLanguageKey;
    return data;
  }
}