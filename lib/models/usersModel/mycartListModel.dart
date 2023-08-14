class MyCartListModel {
  String? status;
  List<Data>? data;
  String? message;

  MyCartListModel({this.status, this.data, this.message});

  MyCartListModel.fromJson(Map<String, dynamic> json) {
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
  int? itemId;
  String? itemName;
  String? variant;
  String? image;
  String? quantity;
  String? price;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.userId,
      this.itemId,
      this.itemName,
      this.variant,
      this.image,
      this.quantity,
      this.price,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    itemId = json['item_id'];
    itemName = json['item_name'];
    variant = json['variant'];
    image = json['image'];
    quantity = json['quantity'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['item_id'] = this.itemId;
    data['item_name'] = this.itemName;
    data['variant'] = this.variant;
    data['image'] = this.image;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}