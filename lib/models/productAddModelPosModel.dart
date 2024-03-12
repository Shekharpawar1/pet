class ProdctModel {
  String? status;
  List<Data>? data;
  String? message;

  ProdctModel({this.status, this.data, this.message});

  ProdctModel.fromJson(Map<String, dynamic> json) {
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
  Null? sellerId;
  int? itemId;
  Null? type;
  String? itemName;
  String? variant;
  String? image;
  int? quantity;
  int? price;
  Null? minOrder;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.userId,
      this.sellerId,
      this.itemId,
      this.type,
      this.itemName,
      this.variant,
      this.image,
      this.quantity,
      this.price,
      this.minOrder,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    sellerId = json['seller_id'];
    itemId = json['item_id'];
    type = json['type'];
    itemName = json['item_name'];
    variant = json['variant'];
    image = json['image'];
    quantity = json['quantity'];
    price = json['price'];
    minOrder = json['min_order'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['seller_id'] = this.sellerId;
    data['item_id'] = this.itemId;
    data['type'] = this.type;
    data['item_name'] = this.itemName;
    data['variant'] = this.variant;
    data['image'] = this.image;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['min_order'] = this.minOrder;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}