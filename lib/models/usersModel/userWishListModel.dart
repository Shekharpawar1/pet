// To parse this JSON data, do
//
//     final wishListModel = wishListModelFromJson(jsonString);

import 'dart:convert';

WishListModel wishListModelFromJson(String str) =>
    WishListModel.fromJson(json.decode(str));

String wishListModelToJson(WishListModel data) => json.encode(data.toJson());

class WishListModel {
  String? status;
  List<Datum>? data;
  String? message;

  WishListModel({
    this.status,
    this.data,
    this.message,
  });

  factory WishListModel.fromJson(Map<String, dynamic> json) => WishListModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  int? id;
  int? userId;
  int? itemId;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<StoreId>? storeId;

  Datum({
    this.id,
    this.userId,
    this.itemId,
    this.createdAt,
    this.updatedAt,
    this.storeId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        itemId: json["item_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        storeId: List<StoreId>.from(
            json["store_id"].map((x) => StoreId.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "item_id": itemId,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "store_id": List<dynamic>.from(storeId!.map((x) => x.toJson())),
      };
}

class StoreId {
  int? id;
  String? name;
  String? description;
  String? image;
  int? categoryId;
  String? subCategory;
  String? categoryIds;
  dynamic? variations;
  dynamic? addOns;
  dynamic? attributes;
  dynamic? choiceOptions;
  int? price;
  int? wholePrice;
  int? minOrder;
  int? tax;
  String? taxType;
  int? discount;
  String? discountType;
  String? availableTimeStarts;
  String? availableTimeEnds;
  int? veg;
  int? status;
  int? storeId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? orderCount;
  int? avgRating;
  int? ratingCount;
  dynamic? rating;
  int? moduleId;
  int? stock;
  dynamic? unitId;
  List<String>? images;
  dynamic? foodVariations;
  dynamic? unitType;
  List<dynamic>? translations;
  dynamic? unit;

  StoreId({
    this.id,
    this.name,
    this.description,
    this.image,
    this.categoryId,
    this.subCategory,
    this.categoryIds,
    this.variations,
    this.addOns,
    this.attributes,
    this.choiceOptions,
    this.price,
    this.wholePrice,
    this.minOrder,
    this.tax,
    this.taxType,
    this.discount,
    this.discountType,
    this.availableTimeStarts,
    this.availableTimeEnds,
    this.veg,
    this.status,
    this.storeId,
    this.createdAt,
    this.updatedAt,
    this.orderCount,
    this.avgRating,
    this.ratingCount,
    this.rating,
    this.moduleId,
    this.stock,
    this.unitId,
    this.images,
    this.foodVariations,
    this.unitType,
    this.translations,
    this.unit,
  });

  factory StoreId.fromJson(Map<String, dynamic> json) => StoreId(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        categoryId: json["category_id"],
        subCategory: json["sub_category"],
        categoryIds: json["category_ids"],
        variations: json["variations"],
        addOns: json["add_ons"],
        attributes: json["attributes"],
        choiceOptions: json["choice_options"],
        price: json["price"],
        wholePrice: json["whole_price"],
        minOrder: json["min_order"],
        tax: json["tax"],
        taxType: json["tax_type"],
        discount: json["discount"],
        discountType: json["discount_type"],
        availableTimeStarts: json["available_time_starts"],
        availableTimeEnds: json["available_time_ends"],
        veg: json["veg"],
        status: json["status"],
        storeId: json["store_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        orderCount: json["order_count"],
        avgRating: json["avg_rating"],
        ratingCount: json["rating_count"],
        rating: json["rating"],
        moduleId: json["module_id"],
        stock: json["stock"],
        unitId: json["unit_id"],
        images: List<String>.from(json["images"].map((x) => x)),
        foodVariations: json["food_variations"],
        unitType: json["unit_type"],
        translations: List<dynamic>.from(json["translations"].map((x) => x)),
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "category_id": categoryId,
        "sub_category": subCategory,
        "category_ids": categoryIds,
        "variations": variations,
        "add_ons": addOns,
        "attributes": attributes,
        "choice_options": choiceOptions,
        "price": price,
        "whole_price": wholePrice,
        "min_order": minOrder,
        "tax": tax,
        "tax_type": taxType,
        "discount": discount,
        "discount_type": discountType,
        "available_time_starts": availableTimeStarts,
        "available_time_ends": availableTimeEnds,
        "veg": veg,
        "status": status,
        "store_id": storeId,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "order_count": orderCount,
        "avg_rating": avgRating,
        "rating_count": ratingCount,
        "rating": rating,
        "module_id": moduleId,
        "stock": stock,
        "unit_id": unitId,
        "images": List<dynamic>.from(images!.map((x) => x)),
        "food_variations": foodVariations,
        "unit_type": unitType,
        "translations": List<dynamic>.from(translations!.map((x) => x)),
        "unit": unit,
      };
}
