class SubscriptionModel {
  String? status;
  List<Data>? data;
  String? message;

  SubscriptionModel({this.status, this.data, this.message});

  SubscriptionModel.fromJson(Map<String, dynamic> json) {
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
  String? pname;
  String? plantime;
  String? price;
  String? limit;
  String? description;
  String? advertisement;
  String? image;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.pname,
      this.plantime,
      this.price,
      this.limit,
      this.description,
      this.advertisement,
      this.image,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pname = json['pname'];
    plantime = json['plantime'];
    price = json['price'];
    limit = json['limit'];
    description = json['description'];
    advertisement = json['advertisement'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pname'] = this.pname;
    data['plantime'] = this.plantime;
    data['price'] = this.price;
    data['limit'] = this.limit;
    data['description'] = this.description;
    data['advertisement'] = this.advertisement;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}