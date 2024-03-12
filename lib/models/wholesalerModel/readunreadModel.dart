class ReadUnreadNotiyModelwhole {
  String? status;
  int? data;
  String? message;

  ReadUnreadNotiyModelwhole({this.status, this.data, this.message});

  ReadUnreadNotiyModelwhole.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['data'] = this.data;
    data['message'] = this.message;
    return data;
  }
}