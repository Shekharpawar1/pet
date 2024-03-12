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
// // }
// class NotifyListModel {
//   String? status;
//   List<Data>? data;
//   List<Notification>? notification;
//   String? message;

//   NotifyListModel({this.status, this.data, this.notification, this.message});

//   NotifyListModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//     if (json['notification'] != null) {
//       notification = <Notification>[];
//       json['notification'].forEach((v) {
//         notification!.add(new Notification.fromJson(v));
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
//     if (this.notification != null) {
//       data['notification'] = this.notification!.map((v) => v.toJson()).toList();
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
//   int? orderId;
//   String? orderStatus;
//      String? status;
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
//       this.orderId,
//       this.orderStatus,
//       this.status,
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
//     orderId = json['order_id'];
//     orderStatus = json['order_status'];
//     status = json['status'];
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
//     data['order_id'] = this.orderId;
//     data['order_status'] = this.orderStatus;
//      data['status'] = this.status;
//     data['create_at'] = this.createAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

// class Notification {
//   int? id;
//   int? itemId;
//   int? userId;
//   int? stock;
//   String? arrival;
//   String? variation;
//   String? email;
//   int? orderId;
//   String? orderStatus;
//    String? status;
//   String? createAt;
//   String? updatedAt;

//   Notification(
//       {this.id,
//       this.itemId,
//       this.userId,
//       this.stock,
//       this.arrival,
//       this.variation,
//       this.email,
//       this.orderId,
//       this.orderStatus,
//             this.status,
//       this.createAt,
//       this.updatedAt});

//   Notification.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     itemId = json['item_id'];
//     userId = json['user_id'];
//     stock = json['stock'];
//     arrival = json['arrival'];
//     variation = json['variation'];
//     email = json['email'];
//     orderId = json['order_id'];
//     orderStatus = json['order_status'];
//      status = json['status'];
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
//     data['order_id'] = this.orderId;
//     data['order_status'] = this.orderStatus;
//      data['status'] = this.status;
//     data['create_at'] = this.createAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }



class NotifyListModel {
  String? status;
  List<Data>? data;
  List<Notification>? notification;
  List<AllNotification>? allNotification;
  String? message;

  NotifyListModel(
      {this.status,
      this.data,
      this.notification,
      this.allNotification,
      this.message});

  NotifyListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] == "") {
      data = <Data>[];
    } else if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }

    if (json['notification'] == "") {
      data = <Data>[];
    } else if (json['notification'] != null) {
      notification = <Notification>[];
      json['notification'].forEach((v) {
        notification!.add(new Notification.fromJson(v));
      });
    }

    if (json['all_notification'] == "") {
      data = <Data>[];
    } else if (json['all_notification'] != null) {
      allNotification = <AllNotification>[];
      json['all_notification'].forEach((v) {
        allNotification!.add(new AllNotification.fromJson(v));
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
    if (this.allNotification != null) {
      data['all_notification'] =
          this.allNotification!.map((v) => v.toJson()).toList();
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
  String? arrival;
  String? variation;
  String? email;
  int? orderId;
  String? orderStatus;
  String? title;
  String? description;
  String? image;
  String? terget;
  int? zoneId;
  String? status;
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
      this.title,
      this.description,
      this.image,
      this.terget,
      this.zoneId,
      this.status,
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
    title = json['title'];
    description = json['description'];
    image = json['image'];
    terget = json['terget'];
    zoneId = json['zone_id'];
    status = json['status'];
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
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['terget'] = this.terget;
    data['zone_id'] = this.zoneId;
    data['status'] = this.status;
    data['create_at'] = this.createAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Notification {
  int? id;
  int? itemId;
  int? userId;
  int? stock;
  String? arrival;
  String? variation;
  String? email;
  int? orderId;
  String? orderStatus;
  String? title;
  String? description;
  String? image;
  String? terget;
  int? zoneId;
  String? status;
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
      this.title,
      this.description,
      this.image,
      this.terget,
      this.zoneId,
      this.status,
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
    title = json['title'];
    description = json['description'];
    image = json['image'];
    terget = json['terget'];
    zoneId = json['zone_id'];
    status = json['status'];
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
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['terget'] = this.terget;
    data['zone_id'] = this.zoneId;
    data['status'] = this.status;
    data['create_at'] = this.createAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class AllNotification {
  int? id;
  int? itemId;
  int? userId;
  int? stock;
  String? arrival;
  String? variation;
  String? email;
  String? orderId;
  String? orderStatus;
  String? title;
  String? description;
  String? image;
  String? terget;
  int? zoneId;
  String? status;
  String? createAt;
  String? updatedAt;

  AllNotification(
      {this.id,
      this.itemId,
      this.userId,
      this.stock,
      this.arrival,
      this.variation,
      this.email,
      this.orderId,
      this.orderStatus,
      this.title,
      this.description,
      this.image,
      this.terget,
      this.zoneId,
      this.status,
      this.createAt,
      this.updatedAt});

  AllNotification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemId = json['item_id'];
    userId = json['user_id'];
    stock = json['stock'];
    arrival = json['arrival'];
    variation = json['variation'];
    email = json['email'];
    orderId = json['order_id'];
    orderStatus = json['order_status'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    terget = json['terget'];
    zoneId = json['zone_id'];
    status = json['status'];
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
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['terget'] = this.terget;
    data['zone_id'] = this.zoneId;
    data['status'] = this.status;
    data['create_at'] = this.createAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}