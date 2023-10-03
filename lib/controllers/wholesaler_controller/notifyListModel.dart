// class NotifyListModel {
//   String? status;
//   List<Data>? data;
//   String? message;

//   NotifyListModel({this.status, this.data, this.message});

//   NotifyListModel.fromJson(Map<String, dynamic> json) {
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
//   int? itemId;
//   int? userId;
//   int? stock;
//   String? arrival;
//   String? variation;
//   String? email;
//   String? createAt;
//   String? updatedAt;

//   Data(
//       {this.id,
//       this.itemId,
//       this.userId,
//       this.stock,
//       this.arrival,
//       this.variation,
//       this.email,
//       this.createAt,
//       this.updatedAt});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     itemId = json['item_id'];
//     userId = json['user_id'];
//     stock = json['stock'];
//     arrival = json['arrival'];
//     variation = json['variation'];
//     email = json['email'];
//     createAt = json['create_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['item_id'] = this.itemId;
//     data['user_id'] = this.userId;
//     data['stock'] = this.stock;
//     data['arrival'] = this.arrival;
//     data['variation'] = this.variation;
//     data['email'] = this.email;
//     data['create_at'] = this.createAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
class WholeNotifyListModel {
  String? status;
  List<Data>? data;
  List<Notification>? notification;
  String? message;

  WholeNotifyListModel({this.status, this.data, this.notification, this.message});

  WholeNotifyListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    if (json['notification'] != null) {
      notification = <Notification>[];
      json['notification'].forEach((v) {
        notification!.add(new Notification.fromJson(v));
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
    if (this.notification != null) {
      data['notification'] = this.notification!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  int? itemId;
  int? userId;
  int? stock;
  Null? arrival;
  String? variation;
  String? email;
  Null? orderId;
  Null? orderStatus;
  String? createAt;
  String? updatedAt;

  Data(
      {this.id,
      this.itemId,
      this.userId,
      this.stock,
      this.arrival,
      this.variation,
      this.email,
      this.orderId,
      this.orderStatus,
      this.createAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemId = json['item_id'];
    userId = json['user_id'];
    stock = json['stock'];
    arrival = json['arrival'];
    variation = json['variation'];
    email = json['email'];
    orderId = json['order_id'];
    orderStatus = json['order_status'];
    createAt = json['create_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['item_id'] = this.itemId;
    data['user_id'] = this.userId;
    data['stock'] = this.stock;
    data['arrival'] = this.arrival;
    data['variation'] = this.variation;
    data['email'] = this.email;
    data['order_id'] = this.orderId;
    data['order_status'] = this.orderStatus;
    data['create_at'] = this.createAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Notification {
  int? id;
  Null? itemId;
  int? userId;
  Null? stock;
  Null? arrival;
  Null? variation;
  Null? email;
  int? orderId;
  String? orderStatus;
  String? createAt;
  String? updatedAt;

  Notification(
      {this.id,
      this.itemId,
      this.userId,
      this.stock,
      this.arrival,
      this.variation,
      this.email,
      this.orderId,
      this.orderStatus,
      this.createAt,
      this.updatedAt});

  Notification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemId = json['item_id'];
    userId = json['user_id'];
    stock = json['stock'];
    arrival = json['arrival'];
    variation = json['variation'];
    email = json['email'];
    orderId = json['order_id'];
    orderStatus = json['order_status'];
    createAt = json['create_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['item_id'] = this.itemId;
    data['user_id'] = this.userId;
    data['stock'] = this.stock;
    data['arrival'] = this.arrival;
    data['variation'] = this.variation;
    data['email'] = this.email;
    data['order_id'] = this.orderId;
    data['order_status'] = this.orderStatus;
    data['create_at'] = this.createAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}