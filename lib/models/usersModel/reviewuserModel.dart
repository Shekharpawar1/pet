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
  int? userId;
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
    userId = json['user_id'];
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
    data['user_id'] = this.userId;
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