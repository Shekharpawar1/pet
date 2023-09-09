// To parse this JSON data, do
//
//     final SalesPropertiesModel = userPropertiesModelFromJson(jsonString);

import 'dart:convert';

SalesPropertiesModel salesPropertiesModelFromJson(String str) =>
    SalesPropertiesModel.fromJson(json.decode(str));

String salesPropertiesModelToJson(SalesPropertiesModel data) =>
    json.encode(data.toJson());

class SalesPropertiesModel {
  String? status;
  List<Datum>? data;
  String? message;

  SalesPropertiesModel({
    this.status,
    this.data,
    this.message,
  });

  factory SalesPropertiesModel.fromJson(Map<String, dynamic> json) =>
      SalesPropertiesModel(
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
    String? name;
    String? description;
    String? image;
    int? categoryId;
    String? subCategory;
    String? categoryIds;
    String? variations;
    String? addOns;
    String? attributes;
    String? choiceOptions;
    String? price;
    String? wholePrice;
    String? minOrder;
    String? tax;
    String? taxType;
    String? discount;
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
    int? unitId;
    String? images;
    String? foodVariations;
    String? brandId;
    String? lifeStageId;
    String? helthConditionId;
    String? petsbreedsId;

    Datum({
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
        this.brandId,
        this.lifeStageId,
        this.helthConditionId,
        this.petsbreedsId,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
        images: json["images"],
        foodVariations: json["food_variations"],
        brandId: json["brand_id"],
        lifeStageId: json["lifeStage_id"],
        helthConditionId: json["helthCondition_id"],
        petsbreedsId: json["Petsbreeds_id"],
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
        "images": images,
        "food_variations": foodVariations,
        "brand_id": brandId,
        "lifeStage_id": lifeStageId,
        "helthCondition_id": helthConditionId,
        "Petsbreeds_id": petsbreedsId,
    };
}