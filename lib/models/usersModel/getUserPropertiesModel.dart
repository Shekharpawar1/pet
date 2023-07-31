// To parse this JSON data, do
//
//     final userPropertiesModel = userPropertiesModelFromJson(jsonString);

import 'dart:convert';

UserPropertiesModel userPropertiesModelFromJson(String str) =>
    UserPropertiesModel.fromJson(json.decode(str));

String userPropertiesModelToJson(UserPropertiesModel data) =>
    json.encode(data.toJson());

class UserPropertiesModel {
  String? status;
  List<Datum>? data;
  String? message;

  UserPropertiesModel({
    this.status,
    this.data,
    this.message,
  });

  factory UserPropertiesModel.fromJson(Map<String, dynamic> json) =>
      UserPropertiesModel(
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
  CategoryIds? categoryIds;
  AddOns? variations;
  AddOns? addOns;
  AddOns? attributes;
  AddOns? choiceOptions;
  String? price;
  String? tax;
  Type? taxType;
  String? discount;
  Type? discountType;
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
  dynamic rating;
  int? moduleId;
  int? stock;
  dynamic unitId;
  AddOns? images;
  AddOns? foodVariations;

  Datum({
    this.id,
    this.name,
    this.description,
    this.image,
    this.categoryId,
    this.categoryIds,
    this.variations,
    this.addOns,
    this.attributes,
    this.choiceOptions,
    this.price,
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
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        categoryId: json["category_id"],
        categoryIds: categoryIdsValues.map[json["category_ids"]],
        variations: addOnsValues.map[json["variations"]],
        addOns: addOnsValues.map[json["add_ons"]],
        attributes: addOnsValues.map[json["attributes"]],
        choiceOptions: addOnsValues.map[json["choice_options"]],
        price: json["price"],
        tax: json["tax"],
        taxType: typeValues.map[json["tax_type"]],
        discount: json["discount"],
        discountType: typeValues.map[json["discount_type"]],
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
        images: addOnsValues.map[json["images"]],
        foodVariations: addOnsValues.map[json["food_variations"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "category_id": categoryId,
        "category_ids": categoryIdsValues.reverse[categoryIds],
        "variations": addOnsValues.reverse[variations],
        "add_ons": addOnsValues.reverse[addOns],
        "attributes": addOnsValues.reverse[attributes],
        "choice_options": addOnsValues.reverse[choiceOptions],
        "price": price,
        "tax": tax,
        "tax_type": typeValues.reverse[taxType],
        "discount": discount,
        "discount_type": typeValues.reverse[discountType],
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
        "images": addOnsValues.reverse[images],
        "food_variations": addOnsValues.reverse[foodVariations],
      };
}

enum AddOns { EMPTY, THE_2023070464_A41_AEC97176_PNG }

final addOnsValues = EnumValues({
  "[]": AddOns.EMPTY,
  "[\"2023-07-04-64a41aec97176.png\"]": AddOns.THE_2023070464_A41_AEC97176_PNG
});

enum CategoryIds { ID_1_POSITION_1, ID_2_POSITION_1, ID_4_POSITION_1 }

final categoryIdsValues = EnumValues({
  "[{\"id\":\"1\",\"position\":1}]": CategoryIds.ID_1_POSITION_1,
  "[{\"id\":\"2\",\"position\":1}]": CategoryIds.ID_2_POSITION_1,
  "[{\"id\":\"4\",\"position\":1}]": CategoryIds.ID_4_POSITION_1
});

// enum Description { ROYAL_CANIN_85_G_X_12_POUCHES, LOREM_IPSUM_IS_SIMPLY_DUMMY }

// final descriptionValues = EnumValues({
//   "Lorem Ipsum is simply dummy": Description.LOREM_IPSUM_IS_SIMPLY_DUMMY,
//   "Royal Canin (85g x 12 Pouches)": Description.ROYAL_CANIN_85_G_X_12_POUCHES
// });

enum Type { PERCENT, AMOUNT }

final typeValues = EnumValues({"amount": Type.AMOUNT, "percent": Type.PERCENT});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
