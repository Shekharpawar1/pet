class SalesMyOrderModel {
  String? status;
  List<Data>? data;
  String? message;

  SalesMyOrderModel({this.status, this.data, this.message});

  SalesMyOrderModel.fromJson(Map<String, dynamic> json) {
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
  String? orderAmount;
  String? couponDiscountAmount;
  String? couponDiscountTitle;
  String? paymentStatus;
  String? orderStatus;
  String? totalTaxAmount;
  String? paymentMethod;
  String? transactionReference;
  int? deliveryAddressId;
  String? deliveryManId;
  String? couponCode;
  String? orderNote;
  String? orderType;
  int? checked;
  int? storeId;
  String? createdAt;
  String? updatedAt;
  String? deliveryCharge;
  String? scheduleAt;
  List<Callback>? callback;
  String? otp;
  String? pending;
  String? accepted;
  String? confirmed;
  String? processing;
  String? handover;
  String? pickedUp;
  String? delivered;
  String? canceled;
  String? refundRequested;
  String? refunded;
  String? deliveryAddress;
  int? scheduled;
  String? storeDiscountAmount;
  String? originalDeliveryCharge;
  String? failed;
  String? adjusment;
  int? edited;
  String? deliveryTime;
  int? zoneId;
  int? moduleId;
  String? orderAttachment;
  String? parcelCategoryId;
  String? receiverDetails;
  String? chargePayer;
  int? distance;
  int? dmTips;
  String? freeDeliveryBy;
  String? refundRequestCanceled;
  int? prescriptionOrder;
  String? deliveredStatus;

  Data(
      {this.id,
      this.userId,
      this.orderAmount,
      this.couponDiscountAmount,
      this.couponDiscountTitle,
      this.paymentStatus,
      this.orderStatus,
      this.totalTaxAmount,
      this.paymentMethod,
      this.transactionReference,
      this.deliveryAddressId,
      this.deliveryManId,
      this.couponCode,
      this.orderNote,
      this.orderType,
      this.checked,
      this.storeId,
      this.createdAt,
      this.updatedAt,
      this.deliveryCharge,
      this.scheduleAt,
      this.callback,
      this.otp,
      this.pending,
      this.accepted,
      this.confirmed,
      this.processing,
      this.handover,
      this.pickedUp,
      this.delivered,
      this.canceled,
      this.refundRequested,
      this.refunded,
      this.deliveryAddress,
      this.scheduled,
      this.storeDiscountAmount,
      this.originalDeliveryCharge,
      this.failed,
      this.adjusment,
      this.edited,
      this.deliveryTime,
      this.zoneId,
      this.moduleId,
      this.orderAttachment,
      this.parcelCategoryId,
      this.receiverDetails,
      this.chargePayer,
      this.distance,
      this.dmTips,
      this.freeDeliveryBy,
      this.refundRequestCanceled,
      this.prescriptionOrder,
      this.deliveredStatus});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    orderAmount = json['order_amount'];
    couponDiscountAmount = json['coupon_discount_amount'];
    couponDiscountTitle = json['coupon_discount_title'];
    paymentStatus = json['payment_status'];
    orderStatus = json['order_status'];
    totalTaxAmount = json['total_tax_amount'];
    paymentMethod = json['payment_method'];
    transactionReference = json['transaction_reference'];
    deliveryAddressId = json['delivery_address_id'];
    deliveryManId = json['delivery_man_id'];
    couponCode = json['coupon_code'];
    orderNote = json['order_note'];
    orderType = json['order_type'];
    checked = json['checked'];
    storeId = json['store_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deliveryCharge = json['delivery_charge'];
    scheduleAt = json['schedule_at'];
    if (json['callback'] != null) {
      callback = <Callback>[];
      json['callback'].forEach((v) {
        callback!.add(new Callback.fromJson(v));
      });
    }
    otp = json['otp'];
    pending = json['pending'];
    accepted = json['accepted'];
    confirmed = json['confirmed'];
    processing = json['processing'];
    handover = json['handover'];
    pickedUp = json['picked_up'];
    delivered = json['delivered'];
    canceled = json['canceled'];
    refundRequested = json['refund_requested'];
    refunded = json['refunded'];
    deliveryAddress = json['delivery_address'];
    scheduled = json['scheduled'];
    storeDiscountAmount = json['store_discount_amount'];
    originalDeliveryCharge = json['original_delivery_charge'];
    failed = json['failed'];
    adjusment = json['adjusment'];
    edited = json['edited'];
    deliveryTime = json['delivery_time'];
    zoneId = json['zone_id'];
    moduleId = json['module_id'];
    orderAttachment = json['order_attachment'];
    parcelCategoryId = json['parcel_category_id'];
    receiverDetails = json['receiver_details'];
    chargePayer = json['charge_payer'];
    distance = json['distance'];
    dmTips = json['dm_tips'];
    freeDeliveryBy = json['free_delivery_by'];
    refundRequestCanceled = json['refund_request_canceled'];
    prescriptionOrder = json['prescription_order'];
    deliveredStatus = json['delivered_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['order_amount'] = this.orderAmount;
    data['coupon_discount_amount'] = this.couponDiscountAmount;
    data['coupon_discount_title'] = this.couponDiscountTitle;
    data['payment_status'] = this.paymentStatus;
    data['order_status'] = this.orderStatus;
    data['total_tax_amount'] = this.totalTaxAmount;
    data['payment_method'] = this.paymentMethod;
    data['transaction_reference'] = this.transactionReference;
    data['delivery_address_id'] = this.deliveryAddressId;
    data['delivery_man_id'] = this.deliveryManId;
    data['coupon_code'] = this.couponCode;
    data['order_note'] = this.orderNote;
    data['order_type'] = this.orderType;
    data['checked'] = this.checked;
    data['store_id'] = this.storeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['delivery_charge'] = this.deliveryCharge;
    data['schedule_at'] = this.scheduleAt;
    if (this.callback != null) {
      data['callback'] = this.callback!.map((v) => v.toJson()).toList();
    }
    data['otp'] = this.otp;
    data['pending'] = this.pending;
    data['accepted'] = this.accepted;
    data['confirmed'] = this.confirmed;
    data['processing'] = this.processing;
    data['handover'] = this.handover;
    data['picked_up'] = this.pickedUp;
    data['delivered'] = this.delivered;
    data['canceled'] = this.canceled;
    data['refund_requested'] = this.refundRequested;
    data['refunded'] = this.refunded;
    data['delivery_address'] = this.deliveryAddress;
    data['scheduled'] = this.scheduled;
    data['store_discount_amount'] = this.storeDiscountAmount;
    data['original_delivery_charge'] = this.originalDeliveryCharge;
    data['failed'] = this.failed;
    data['adjusment'] = this.adjusment;
    data['edited'] = this.edited;
    data['delivery_time'] = this.deliveryTime;
    data['zone_id'] = this.zoneId;
    data['module_id'] = this.moduleId;
    data['order_attachment'] = this.orderAttachment;
    data['parcel_category_id'] = this.parcelCategoryId;
    data['receiver_details'] = this.receiverDetails;
    data['charge_payer'] = this.chargePayer;
    data['distance'] = this.distance;
    data['dm_tips'] = this.dmTips;
    data['free_delivery_by'] = this.freeDeliveryBy;
    data['refund_request_canceled'] = this.refundRequestCanceled;
    data['prescription_order'] = this.prescriptionOrder;
    data['delivered_status'] = this.deliveredStatus;
    return data;
  }
}

class Callback {
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
  String? itemCampaignId;
  String? totalAddOnPrice;

  Callback(
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
      this.totalAddOnPrice});

  Callback.fromJson(Map<String, dynamic> json) {
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