// class PartnerProfileModel {
//   String? status;
//   List<Data>? data;
//   String? message;

//   PartnerProfileModel({this.status, this.data, this.message});

//   PartnerProfileModel.fromJson(Map<String, dynamic> json) {
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
//   String? name;
//   String? phone;
//   String? email;
//   String? logo;
//   String? latitude;
//   String? longitude;
//   String? address;
//   Null? footerText;
//   String? minimumOrder;
//   Null? comission;
//   int? scheduleOrder;
//   int? status;
//   List<VendorId>? vendorId;
//   String? createdAt;
//   String? updatedAt;
//   int? freeDelivery;
//   Null? rating;
//   String? coverPhoto;
//   int? delivery;
//   int? takeAway;
//   int? itemSection;
//   String? tax;
//   int? zoneId;
//   int? reviewsSection;
//   int? active;
//   String? offDay;
//   Null? gst;
//   int? selfDeliverySystem;
//   int? posSystem;
//   String? minimumShippingCharge;
//   String? deliveryTime;
//   int? veg;
//   int? nonVeg;
//   int? orderCount;
//   int? totalOrder;
//   int? moduleId;
//   int? orderPlaceToScheduleInterval;
//   int? featured;
//   int? perKmShippingCharge;
//   int? prescriptionOrder;

//   Data(
//       {this.id,
//       this.name,
//       this.phone,
//       this.email,
//       this.logo,
//       this.latitude,
//       this.longitude,
//       this.address,
//       this.footerText,
//       this.minimumOrder,
//       this.comission,
//       this.scheduleOrder,
//       this.status,
//       this.vendorId,
//       this.createdAt,
//       this.updatedAt,
//       this.freeDelivery,
//       this.rating,
//       this.coverPhoto,
//       this.delivery,
//       this.takeAway,
//       this.itemSection,
//       this.tax,
//       this.zoneId,
//       this.reviewsSection,
//       this.active,
//       this.offDay,
//       this.gst,
//       this.selfDeliverySystem,
//       this.posSystem,
//       this.minimumShippingCharge,
//       this.deliveryTime,
//       this.veg,
//       this.nonVeg,
//       this.orderCount,
//       this.totalOrder,
//       this.moduleId,
//       this.orderPlaceToScheduleInterval,
//       this.featured,
//       this.perKmShippingCharge,
//       this.prescriptionOrder});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     phone = json['phone'];
//     email = json['email'];
//     logo = json['logo'];
//     latitude = json['latitude'];
//     longitude = json['longitude'];
//     address = json['address'];
//     footerText = json['footer_text'];
//     minimumOrder = json['minimum_order'];
//     comission = json['comission'];
//     scheduleOrder = json['schedule_order'];
//     status = json['status'];
//     if (json['vendor_id'] != null) {
//       vendorId = <VendorId>[];
//       json['vendor_id'].forEach((v) {
//         vendorId!.add(new VendorId.fromJson(v));
//       });
//     }
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     freeDelivery = json['free_delivery'];
//     rating = json['rating'];
//     coverPhoto = json['cover_photo'];
//     delivery = json['delivery'];
//     takeAway = json['take_away'];
//     itemSection = json['item_section'];
//     tax = json['tax'];
//     zoneId = json['zone_id'];
//     reviewsSection = json['reviews_section'];
//     active = json['active'];
//     offDay = json['off_day'];
//     gst = json['gst'];
//     selfDeliverySystem = json['self_delivery_system'];
//     posSystem = json['pos_system'];
//     minimumShippingCharge = json['minimum_shipping_charge'];
//     deliveryTime = json['delivery_time'];
//     veg = json['veg'];
//     nonVeg = json['non_veg'];
//     orderCount = json['order_count'];
//     totalOrder = json['total_order'];
//     moduleId = json['module_id'];
//     orderPlaceToScheduleInterval = json['order_place_to_schedule_interval'];
//     featured = json['featured'];
//     perKmShippingCharge = json['per_km_shipping_charge'];
//     prescriptionOrder = json['prescription_order'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['phone'] = this.phone;
//     data['email'] = this.email;
//     data['logo'] = this.logo;
//     data['latitude'] = this.latitude;
//     data['longitude'] = this.longitude;
//     data['address'] = this.address;
//     data['footer_text'] = this.footerText;
//     data['minimum_order'] = this.minimumOrder;
//     data['comission'] = this.comission;
//     data['schedule_order'] = this.scheduleOrder;
//     data['status'] = this.status;
//     if (this.vendorId != null) {
//       data['vendor_id'] = this.vendorId!.map((v) => v.toJson()).toList();
//     }
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['free_delivery'] = this.freeDelivery;
//     data['rating'] = this.rating;
//     data['cover_photo'] = this.coverPhoto;
//     data['delivery'] = this.delivery;
//     data['take_away'] = this.takeAway;
//     data['item_section'] = this.itemSection;
//     data['tax'] = this.tax;
//     data['zone_id'] = this.zoneId;
//     data['reviews_section'] = this.reviewsSection;
//     data['active'] = this.active;
//     data['off_day'] = this.offDay;
//     data['gst'] = this.gst;
//     data['self_delivery_system'] = this.selfDeliverySystem;
//     data['pos_system'] = this.posSystem;
//     data['minimum_shipping_charge'] = this.minimumShippingCharge;
//     data['delivery_time'] = this.deliveryTime;
//     data['veg'] = this.veg;
//     data['non_veg'] = this.nonVeg;
//     data['order_count'] = this.orderCount;
//     data['total_order'] = this.totalOrder;
//     data['module_id'] = this.moduleId;
//     data['order_place_to_schedule_interval'] =
//         this.orderPlaceToScheduleInterval;
//     data['featured'] = this.featured;
//     data['per_km_shipping_charge'] = this.perKmShippingCharge;
//     data['prescription_order'] = this.prescriptionOrder;
//     return data;
//   }
// }

// class VendorId {
//   int? id;
//   String? fName;
//   String? lName;
//   String? phone;
//   String? email;
//   Null? emailVerifiedAt;
//   String? password;
//   Null? rememberToken;
//   String? createdAt;
//   String? updatedAt;
//   Null? bankName;
//   Null? branch;
//   Null? holderName;
//   Null? accountNo;
//   String? image;
//   int? status;
//   String? planName;
//   String? planPrice;
//   String? planPurchaseDate;
//   String? planExpaireDate;
//   String? planType;
//   Null? productUpload;
//   Null? advertisement;
//   Null? firebaseToken;
//   Null? authToken;

//   VendorId(
//       {this.id,
//       this.fName,
//       this.lName,
//       this.phone,
//       this.email,
//       this.emailVerifiedAt,
//       this.password,
//       this.rememberToken,
//       this.createdAt,
//       this.updatedAt,
//       this.bankName,
//       this.branch,
//       this.holderName,
//       this.accountNo,
//       this.image,
//       this.status,
//       this.planName,
//       this.planPrice,
//       this.planPurchaseDate,
//       this.planExpaireDate,
//       this.planType,
//       this.productUpload,
//       this.advertisement,
//       this.firebaseToken,
//       this.authToken});

//   VendorId.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     fName = json['f_name'];
//     lName = json['l_name'];
//     phone = json['phone'];
//     email = json['email'];
//     emailVerifiedAt = json['email_verified_at'];
//     password = json['password'];
//     rememberToken = json['remember_token'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     bankName = json['bank_name'];
//     branch = json['branch'];
//     holderName = json['holder_name'];
//     accountNo = json['account_no'];
//     image = json['image'];
//     status = json['status'];
//     planName = json['plan_name'];
//     planPrice = json['plan_price'];
//     planPurchaseDate = json['plan_purchase_date'];
//     planExpaireDate = json['plan_expaire_date'];
//     planType = json['plan_type'];
//     productUpload = json['product_upload'];
//     advertisement = json['advertisement'];
//     firebaseToken = json['firebase_token'];
//     authToken = json['auth_token'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['f_name'] = this.fName;
//     data['l_name'] = this.lName;
//     data['phone'] = this.phone;
//     data['email'] = this.email;
//     data['email_verified_at'] = this.emailVerifiedAt;
//     data['password'] = this.password;
//     data['remember_token'] = this.rememberToken;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['bank_name'] = this.bankName;
//     data['branch'] = this.branch;
//     data['holder_name'] = this.holderName;
//     data['account_no'] = this.accountNo;
//     data['image'] = this.image;
//     data['status'] = this.status;
//     data['plan_name'] = this.planName;
//     data['plan_price'] = this.planPrice;
//     data['plan_purchase_date'] = this.planPurchaseDate;
//     data['plan_expaire_date'] = this.planExpaireDate;
//     data['plan_type'] = this.planType;
//     data['product_upload'] = this.productUpload;
//     data['advertisement'] = this.advertisement;
//     data['firebase_token'] = this.firebaseToken;
//     data['auth_token'] = this.authToken;
//     return data;
//   }
// }


class PartnerProfileModel {
  String? status;
  List<Data>? data;
  String? message;

  PartnerProfileModel({this.status, this.data, this.message});

  PartnerProfileModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? phone;
  String? email;
  String? logo;
  String? latitude;
  String? longitude;
  String? address;
  String? footerText;
  String? minimumOrder;
  String? comission;
  int? scheduleOrder;
  int? status;
  List<VendorId>? vendorId;
  String? createdAt;
  String? updatedAt;
  int? freeDelivery;
  Null? rating;
  String? coverPhoto;
  int? delivery;
  int? takeAway;
  int? itemSection;
  String? tax;
  int? zoneId;
  int? reviewsSection;
  int? active;
  String? offDay;
  Null? gst;
  int? selfDeliverySystem;
  int? posSystem;
  String? minimumShippingCharge;
  String? deliveryTime;
  int? veg;
  int? nonVeg;
  int? orderCount;
  int? totalOrder;
  int? moduleId;
  int? orderPlaceToScheduleInterval;
  int? featured;
  int? perKmShippingCharge;
  int? prescriptionOrder;

  Data(
      {this.id,
      this.name,
      this.phone,
      this.email,
      this.logo,
      this.latitude,
      this.longitude,
      this.address,
      this.footerText,
      this.minimumOrder,
      this.comission,
      this.scheduleOrder,
      this.status,
      this.vendorId,
      this.createdAt,
      this.updatedAt,
      this.freeDelivery,
      this.rating,
      this.coverPhoto,
      this.delivery,
      this.takeAway,
      this.itemSection,
      this.tax,
      this.zoneId,
      this.reviewsSection,
      this.active,
      this.offDay,
      this.gst,
      this.selfDeliverySystem,
      this.posSystem,
      this.minimumShippingCharge,
      this.deliveryTime,
      this.veg,
      this.nonVeg,
      this.orderCount,
      this.totalOrder,
      this.moduleId,
      this.orderPlaceToScheduleInterval,
      this.featured,
      this.perKmShippingCharge,
      this.prescriptionOrder});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    logo = json['logo'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    footerText = json['footer_text'];
    minimumOrder = json['minimum_order'];
    comission = json['comission'];
    scheduleOrder = json['schedule_order'];
    status = json['status'];
    if (json['vendor_id'] != null) {
      vendorId = <VendorId>[];
      json['vendor_id'].forEach((v) {
        vendorId!.add(new VendorId.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    freeDelivery = json['free_delivery'];
    rating = json['rating'];
    coverPhoto = json['cover_photo'];
    delivery = json['delivery'];
    takeAway = json['take_away'];
    itemSection = json['item_section'];
    tax = json['tax'];
    zoneId = json['zone_id'];
    reviewsSection = json['reviews_section'];
    active = json['active'];
    offDay = json['off_day'];
    gst = json['gst'];
    selfDeliverySystem = json['self_delivery_system'];
    posSystem = json['pos_system'];
    minimumShippingCharge = json['minimum_shipping_charge'];
    deliveryTime = json['delivery_time'];
    veg = json['veg'];
    nonVeg = json['non_veg'];
    orderCount = json['order_count'];
    totalOrder = json['total_order'];
    moduleId = json['module_id'];
    orderPlaceToScheduleInterval = json['order_place_to_schedule_interval'];
    featured = json['featured'];
    perKmShippingCharge = json['per_km_shipping_charge'];
    prescriptionOrder = json['prescription_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['logo'] = this.logo;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['address'] = this.address;
    data['footer_text'] = this.footerText;
    data['minimum_order'] = this.minimumOrder;
    data['comission'] = this.comission;
    data['schedule_order'] = this.scheduleOrder;
    data['status'] = this.status;
    if (this.vendorId != null) {
      data['vendor_id'] = this.vendorId!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['free_delivery'] = this.freeDelivery;
    data['rating'] = this.rating;
    data['cover_photo'] = this.coverPhoto;
    data['delivery'] = this.delivery;
    data['take_away'] = this.takeAway;
    data['item_section'] = this.itemSection;
    data['tax'] = this.tax;
    data['zone_id'] = this.zoneId;
    data['reviews_section'] = this.reviewsSection;
    data['active'] = this.active;
    data['off_day'] = this.offDay;
    data['gst'] = this.gst;
    data['self_delivery_system'] = this.selfDeliverySystem;
    data['pos_system'] = this.posSystem;
    data['minimum_shipping_charge'] = this.minimumShippingCharge;
    data['delivery_time'] = this.deliveryTime;
    data['veg'] = this.veg;
    data['non_veg'] = this.nonVeg;
    data['order_count'] = this.orderCount;
    data['total_order'] = this.totalOrder;
    data['module_id'] = this.moduleId;
    data['order_place_to_schedule_interval'] =
        this.orderPlaceToScheduleInterval;
    data['featured'] = this.featured;
    data['per_km_shipping_charge'] = this.perKmShippingCharge;
    data['prescription_order'] = this.prescriptionOrder;
    return data;
  }
}

class VendorId {
  int? id;
  String? fName;
  String? lName;
  String? phone;
  String? email;
  String? emailVerifiedAt;
  String? password;
  String? rememberToken;
  String? createdAt;
  String? updatedAt;
  String? bankName;
  String? branch;
  String? holderName;
  String? accountNo;
  String? image;
  int? status;
  String? planName;
  String? planPrice;
  String? planPurchaseDate;
  String? planExpaireDate;
  String? planType;
  String? productUpload;
  String? advertisement;
  String? firebaseToken;
  String? authToken;

  VendorId(
      {this.id,
      this.fName,
      this.lName,
      this.phone,
      this.email,
      this.emailVerifiedAt,
      this.password,
      this.rememberToken,
      this.createdAt,
      this.updatedAt,
      this.bankName,
      this.branch,
      this.holderName,
      this.accountNo,
      this.image,
      this.status,
      this.planName,
      this.planPrice,
      this.planPurchaseDate,
      this.planExpaireDate,
      this.planType,
      this.productUpload,
      this.advertisement,
      this.firebaseToken,
      this.authToken});

  VendorId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fName = json['f_name'];
    lName = json['l_name'];
    phone = json['phone'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    bankName = json['bank_name'];
    branch = json['branch'];
    holderName = json['holder_name'];
    accountNo = json['account_no'];
    image = json['image'];
    status = json['status'];
    planName = json['plan_name'];
    planPrice = json['plan_price'];
    planPurchaseDate = json['plan_purchase_date'];
    planExpaireDate = json['plan_expaire_date'];
    planType = json['plan_type'];
    productUpload = json['product_upload'];
    advertisement = json['advertisement'];
    firebaseToken = json['firebase_token'];
    authToken = json['auth_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['password'] = this.password;
    data['remember_token'] = this.rememberToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['bank_name'] = this.bankName;
    data['branch'] = this.branch;
    data['holder_name'] = this.holderName;
    data['account_no'] = this.accountNo;
    data['image'] = this.image;
    data['status'] = this.status;
    data['plan_name'] = this.planName;
    data['plan_price'] = this.planPrice;
    data['plan_purchase_date'] = this.planPurchaseDate;
    data['plan_expaire_date'] = this.planExpaireDate;
    data['plan_type'] = this.planType;
    data['product_upload'] = this.productUpload;
    data['advertisement'] = this.advertisement;
    data['firebase_token'] = this.firebaseToken;
    data['auth_token'] = this.authToken;
    return data;
  }
}