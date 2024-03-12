

class UserTransactionModel {
  String? status;
  List<Data>? data;
  String? message;

  UserTransactionModel({this.status, this.data, this.message});

  UserTransactionModel.fromJson(Map<String, dynamic> json) {
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
  int? selesManId;
  String? paymode;
  String? amount;
  String? type;
  String? date;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.userId,
      this.selesManId,
      this.paymode,
      this.amount,
      this.type,
      this.date,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    selesManId = json['seles_man_id'];
    paymode = json['paymode'];
    amount = json['amount'];
    type = json['type'];
    date = json['date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['seles_man_id'] = this.selesManId;
    data['paymode'] = this.paymode;
    data['amount'] = this.amount;
    data['type'] = this.type;
    data['date'] = this.date;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}