class OrderDetailsModel {
  String? status;
  List<Data>? data;
  String? message;

  OrderDetailsModel({this.status, this.data, this.message});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
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
  int? orderId;
  String? price;
  List<ItemDetails>? itemDetails;
  String? variation;
  String? addOns;
  String? discountOnItem;
  String? discountType;
  int? quantity;
  String? taxAmount;
  String? variant;
  String? createdAt;
  String? updatedAt;
  int? itemCampaignId;
  String? totalAddOnPrice;
  String? gst;

  Data(
      {this.id,
      this.itemId,
      this.orderId,
      this.price,
      this.itemDetails,
      this.variation,
      this.addOns,
      this.discountOnItem,
      this.discountType,
      this.quantity,
      this.taxAmount,
      this.variant,
      this.createdAt,
      this.updatedAt,
      this.itemCampaignId,
      this.totalAddOnPrice,
      this.gst});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemId = json['item_id'];
    orderId = json['order_id'];
    price = json['price'];
    if (json['item_details'] != null) {
      itemDetails = <ItemDetails>[];
      json['item_details'].forEach((v) {
        itemDetails!.add(new ItemDetails.fromJson(v));
      });
    }
    variation = json['variation'];
    addOns = json['add_ons'];
    discountOnItem = json['discount_on_item'];
    discountType = json['discount_type'];
    quantity = json['quantity'];
    taxAmount = json['tax_amount'];
    variant = json['variant'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    itemCampaignId = json['item_campaign_id'];
    totalAddOnPrice = json['total_add_on_price'];
    gst = json['gst'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['item_id'] = this.itemId;
    data['order_id'] = this.orderId;
    data['price'] = this.price;
    if (this.itemDetails != null) {
      data['item_details'] = this.itemDetails!.map((v) => v.toJson()).toList();
    }
    data['variation'] = this.variation;
    data['add_ons'] = this.addOns;
    data['discount_on_item'] = this.discountOnItem;
    data['discount_type'] = this.discountType;
    data['quantity'] = this.quantity;
    data['tax_amount'] = this.taxAmount;
    data['variant'] = this.variant;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['item_campaign_id'] = this.itemCampaignId;
    data['total_add_on_price'] = this.totalAddOnPrice;
    data['gst'] = this.gst;
    return data;
  }
}

class ItemDetails {
  String? image;

  ItemDetails({this.image});

  ItemDetails.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    return data;
  }
}