class UserReviewModel {
  String? status;
  List<Data>? data;
  String? message;

  UserReviewModel({this.status, this.data, this.message});

  UserReviewModel.fromJson(Map<String, dynamic> json) {
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
  int? itemId;
  List<UserId>? userId;
  String? comment;
  String? attachment;
  int? rating;
  int? orderId;
  String? createdAt;
  String? updatedAt;
  String? itemCampaignId;
  int? status;
  int? moduleId;

  Data(
      {this.id,
      this.itemId,
      this.userId,
      this.comment,
      this.attachment,
      this.rating,
      this.orderId,
      this.createdAt,
      this.updatedAt,
      this.itemCampaignId,
      this.status,
      this.moduleId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemId = json['item_id'];
    if (json['user_id'] != null) {
      userId = <UserId>[];
      json['user_id'].forEach((v) {
        userId!.add(new UserId.fromJson(v));
      });
    }
    comment = json['comment'];
    attachment = json['attachment'];
    rating = json['rating'];
    orderId = json['order_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    itemCampaignId = json['item_campaign_id'];
    status = json['status'];
    moduleId = json['module_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['item_id'] = this.itemId;
    if (this.userId != null) {
      data['user_id'] = this.userId!.map((v) => v.toJson()).toList();
    }
    data['comment'] = this.comment;
    data['attachment'] = this.attachment;
    data['rating'] = this.rating;
    data['order_id'] = this.orderId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['item_campaign_id'] = this.itemCampaignId;
    data['status'] = this.status;
    data['module_id'] = this.moduleId;
    return data;
  }
}

class UserId {
  int? id;
  int? role;
  String? sellerId;
  String? fName;
  String? lName;
  String? phone;
  String? email;
  String? dateofbirth;
  String? state;
  String? city;
  String? businessName;
  String? aadharNumber;
  String? gstNumber;
  String? pincode;
  String? upload1;
  String? upload2;
  String? image;
  String? verified;
  String? payLaterTime;
  String? payLaterAmount;
  String? payLaterLimit;
  int? isPhoneVerified;
  String? emailVerifiedAt;
  String? password;
  String? rememberToken;
  String? createdAt;
  String? updatedAt;
  String? interest;
  String? cmFirebaseToken;
  int? status;
  int? orderCount;
  String? loginMedium;
  String? socialId;
  String? zoneId;
  String? walletBalance;
  String? loyaltyPoint;
  String? refCode;
  String? currentLanguageKey;

  UserId(
      {this.id,
      this.role,
      this.sellerId,
      this.fName,
      this.lName,
      this.phone,
      this.email,
      this.dateofbirth,
      this.state,
      this.city,
      this.businessName,
      this.aadharNumber,
      this.gstNumber,
      this.pincode,
      this.upload1,
      this.upload2,
      this.image,
      this.verified,
      this.payLaterTime,
      this.payLaterAmount,
      this.payLaterLimit,
      this.isPhoneVerified,
      this.emailVerifiedAt,
      this.password,
      this.rememberToken,
      this.createdAt,
      this.updatedAt,
      this.interest,
      this.cmFirebaseToken,
      this.status,
      this.orderCount,
      this.loginMedium,
      this.socialId,
      this.zoneId,
      this.walletBalance,
      this.loyaltyPoint,
      this.refCode,
      this.currentLanguageKey});

  UserId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
    sellerId = json['seller_id'];
    fName = json['f_name'];
    lName = json['l_name'];
    phone = json['phone'];
    email = json['email'];
    dateofbirth = json['dateofbirth'];
    state = json['state'];
    city = json['city'];
    businessName = json['business_name'];
    aadharNumber = json['aadhar_number'];
    gstNumber = json['gst_number'];
    pincode = json['pincode'];
    upload1 = json['upload_1'];
    upload2 = json['upload_2'];
    image = json['image'];
    verified = json['verified'];
    payLaterTime = json['pay_later_time'];
    payLaterAmount = json['pay_later_amount'];
    payLaterLimit = json['pay_later_limit'];
    isPhoneVerified = json['is_phone_verified'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    interest = json['interest'];
    cmFirebaseToken = json['cm_firebase_token'];
    status = json['status'];
    orderCount = json['order_count'];
    loginMedium = json['login_medium'];
    socialId = json['social_id'];
    zoneId = json['zone_id'];
    walletBalance = json['wallet_balance'];
    loyaltyPoint = json['loyalty_point'];
    refCode = json['ref_code'];
    currentLanguageKey = json['current_language_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role'] = this.role;
    data['seller_id'] = this.sellerId;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['dateofbirth'] = this.dateofbirth;
    data['state'] = this.state;
    data['city'] = this.city;
    data['business_name'] = this.businessName;
    data['aadhar_number'] = this.aadharNumber;
    data['gst_number'] = this.gstNumber;
    data['pincode'] = this.pincode;
    data['upload_1'] = this.upload1;
    data['upload_2'] = this.upload2;
    data['image'] = this.image;
    data['verified'] = this.verified;
    data['pay_later_time'] = this.payLaterTime;
    data['pay_later_amount'] = this.payLaterAmount;
    data['pay_later_limit'] = this.payLaterLimit;
    data['is_phone_verified'] = this.isPhoneVerified;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['password'] = this.password;
    data['remember_token'] = this.rememberToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['interest'] = this.interest;
    data['cm_firebase_token'] = this.cmFirebaseToken;
    data['status'] = this.status;
    data['order_count'] = this.orderCount;
    data['login_medium'] = this.loginMedium;
    data['social_id'] = this.socialId;
    data['zone_id'] = this.zoneId;
    data['wallet_balance'] = this.walletBalance;
    data['loyalty_point'] = this.loyaltyPoint;
    data['ref_code'] = this.refCode;
    data['current_language_key'] = this.currentLanguageKey;
    return data;
  }
}