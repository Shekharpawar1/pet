class OurBrandProductModel {
  String? status;
  List<Data>? data;
  String? message;

  OurBrandProductModel({this.status, this.data, this.message});

  OurBrandProductModel.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? brand;
  String? productUrl;
  String? subCategory;
  String? image;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.title,
      this.brand,
      this.productUrl,
      this.subCategory,
      this.image,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    brand = json['brand'];
    productUrl = json['product_url'];
    subCategory = json['sub_category'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['brand'] = this.brand;
    data['product_url'] = this.productUrl;
    data['sub_category'] = this.subCategory;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}