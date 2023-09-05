class SalesSubModel {
  String? status;
  List<Data>? data;
  String? message;

  SalesSubModel({this.status, this.data, this.message});

  SalesSubModel.fromJson(Map<String, dynamic> json) {
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
  String? type;
  String? image;
  int? parentId;
  int? position;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? priority;
  int? moduleId;

  Data(
      {this.id,
      this.name,
      this.type,
      this.image,
      this.parentId,
      this.position,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.priority,
      this.moduleId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    image = json['image'];
    parentId = json['parent_id'];
    position = json['position'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    priority = json['priority'];
    moduleId = json['module_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['image'] = this.image;
    data['parent_id'] = this.parentId;
    data['position'] = this.position;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['priority'] = this.priority;
    data['module_id'] = this.moduleId;
    return data;
  }
}