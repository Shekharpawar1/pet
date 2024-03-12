// // To parse this JSON data, do
// //
// //     final userPropertiesModel = userPropertiesModelFromJson(jsonString);

// import 'dart:convert';

// UserPropertiesModel userPropertiesModelFromJson(String str) =>
//     UserPropertiesModel.fromJson(json.decode(str));

// String userPropertiesModelToJson(UserPropertiesModel data) =>
//     json.encode(data.toJson());

// class UserPropertiesModel {
//   String? status;
//   List<Datum>? data;
//   String? message;

//   UserPropertiesModel({
//     this.status,
//     this.data,
//     this.message,
//   });

//   factory UserPropertiesModel.fromJson(Map<String, dynamic> json) =>
//       UserPropertiesModel(
//         status: json["status"],
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//         message: json["message"],
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "data": List<dynamic>.from(data!.map((x) => x.toJson())),
//         "message": message,
//       };
// }

// class Datum {
//   int? id;
//   String? name;
//   String? description;
//   String? image;
//   int? categoryId;
//  String? subCategory;
//   CategoryIds? categoryIds;
//   AddOns? variations;
//   AddOns? addOns;
//   AddOns? attributes;
//   AddOns? choiceOptions;
//   String? price;
//   String? tax;
//   Type? taxType;
//   String? discount;
//   Type? discountType;
//   String? availableTimeStarts;
//   String? availableTimeEnds;
//   int? veg;
//   int? status;
//   int? storeId;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   int? orderCount;
//   int? avgRating;
//   int? ratingCount;
//   dynamic rating;
//   int? moduleId;
//   int? stock;
//   dynamic unitId;
//   AddOns? images;
//   AddOns? foodVariations;

//   Datum({
//     this.id,
//     this.name,
//     this.description,
//     this.image,
//     this.categoryId,
//        this.subCategory,
//     this.categoryIds,
//     this.variations,
//     this.addOns,
//     this.attributes,
//     this.choiceOptions,
//     this.price,
//     this.tax,
//     this.taxType,
//     this.discount,
//     this.discountType,
//     this.availableTimeStarts,
//     this.availableTimeEnds,
//     this.veg,
//     this.status,
//     this.storeId,
//     this.createdAt,
//     this.updatedAt,
//     this.orderCount,
//     this.avgRating,
//     this.ratingCount,
//     this.rating,
//     this.moduleId,
//     this.stock,
//     this.unitId,
//     this.images,
//     this.foodVariations,
//   });

//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         name: json["name"],
//         description: json["description"],
//         image: json["image"],
//         categoryId: json["category_id"],
//          subCategory : json['sub_category'],
//         categoryIds: categoryIdsValues.map[json["category_ids"]],
//         variations: addOnsValues.map[json["variations"]],
//         addOns: addOnsValues.map[json["add_ons"]],
//         attributes: addOnsValues.map[json["attributes"]],
//         choiceOptions: addOnsValues.map[json["choice_options"]],
//         price: json["price"],
//         tax: json["tax"],
//         taxType: typeValues.map[json["tax_type"]],
//         discount: json["discount"],
//         discountType: typeValues.map[json["discount_type"]],
//         availableTimeStarts: json["available_time_starts"],
//         availableTimeEnds: json["available_time_ends"],
//         veg: json["veg"],
//         status: json["status"],
//         storeId: json["store_id"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         orderCount: json["order_count"],
//         avgRating: json["avg_rating"],
//         ratingCount: json["rating_count"],
//         rating: json["rating"],
//         moduleId: json["module_id"],
//         stock: json["stock"],
//         unitId: json["unit_id"],
//         images: addOnsValues.map[json["images"]],
//         foodVariations: addOnsValues.map[json["food_variations"]],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "description": description,
//         "image": image,
//         "category_id": categoryId,
//          "sub_category":subCategory,
//         "category_ids": categoryIdsValues.reverse[categoryIds],
//         "variations": addOnsValues.reverse[variations],
//         "add_ons": addOnsValues.reverse[addOns],
//         "attributes": addOnsValues.reverse[attributes],
//         "choice_options": addOnsValues.reverse[choiceOptions],
//         "price": price,
//         "tax": tax,
//         "tax_type": typeValues.reverse[taxType],
//         "discount": discount,
//         "discount_type": typeValues.reverse[discountType],
//         "available_time_starts": availableTimeStarts,
//         "available_time_ends": availableTimeEnds,
//         "veg": veg,
//         "status": status,
//         "store_id": storeId,
//         "created_at": createdAt!.toIso8601String(),
//         "updated_at": updatedAt!.toIso8601String(),
//         "order_count": orderCount,
//         "avg_rating": avgRating,
//         "rating_count": ratingCount,
//         "rating": rating,
//         "module_id": moduleId,
//         "stock": stock,
//         "unit_id": unitId,
//         "images": addOnsValues.reverse[images],
//         "food_variations": addOnsValues.reverse[foodVariations],
//       };
// }

// enum AddOns { EMPTY, THE_2023070464_A41_AEC97176_PNG }

// final addOnsValues = EnumValues({
//   "[]": AddOns.EMPTY,
//   "[\"2023-07-04-64a41aec97176.png\"]": AddOns.THE_2023070464_A41_AEC97176_PNG
// });

// enum CategoryIds { ID_1_POSITION_1, ID_2_POSITION_1, ID_4_POSITION_1 }

// final categoryIdsValues = EnumValues({
//   "[{\"id\":\"1\",\"position\":1}]": CategoryIds.ID_1_POSITION_1,
//   "[{\"id\":\"2\",\"position\":1}]": CategoryIds.ID_2_POSITION_1,
//   "[{\"id\":\"4\",\"position\":1}]": CategoryIds.ID_4_POSITION_1
// });

// // enum Description { ROYAL_CANIN_85_G_X_12_POUCHES, LOREM_IPSUM_IS_SIMPLY_DUMMY }

// // final descriptionValues = EnumValues({
// //   "Lorem Ipsum is simply dummy": Description.LOREM_IPSUM_IS_SIMPLY_DUMMY,
// //   "Royal Canin (85g x 12 Pouches)": Description.ROYAL_CANIN_85_G_X_12_POUCHES
// // });

// enum Type { PERCENT, AMOUNT }

// final typeValues = EnumValues({"amount": Type.AMOUNT, "percent": Type.PERCENT});

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
// To parse this JSON data, do
//
//     final userPropertiesModel = userPropertiesModelFromJson(jsonString);

import 'dart:convert';

UserPropertiesModel userPropertiesModelFromJson(String str) => UserPropertiesModel.fromJson(json.decode(str));

String userPropertiesModelToJson(UserPropertiesModel data) => json.encode(data.toJson());

class UserPropertiesModel {
    String? status;
    List<Datum>? data;
    String? message;

    UserPropertiesModel({
        this.status,
        this.data,
        this.message,
    });

    factory UserPropertiesModel.fromJson(Map<String, dynamic> json) => UserPropertiesModel(
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
     String? returnable;
  String? gst;
  String? suggestionProduct;

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
         this.returnable,
      this.gst,
      this.suggestionProduct
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
         petsbreedsId : json['Petsbreeds_id'],
    returnable :json['returnable'],
    gst : json['gst'],
    suggestionProduct : json['suggestion_product']
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
       'returnable':returnable,
    'gst':gst,
    'suggestion_product':suggestionProduct,
    };
}

// enum AddOns {
//     EMPTY,
//     THE_1
// }

// final addOnsValues = EnumValues({
//     "[]": AddOns.EMPTY,
//     "[\"1\"]": AddOns.THE_1
// });

// enum BrandId {
//     BRAND_1,
//     SHOP_BY_BRAND1,
//     SHOP_BY_BRAND2
// }

// final brandIdValues = EnumValues({
//     "brand 1": BrandId.BRAND_1,
//     "Shop by brand1": BrandId.SHOP_BY_BRAND1,
//     "Shop by brand2": BrandId.SHOP_BY_BRAND2
// });

// enum Type {
//     PERCENT
// }

// final typeValues = EnumValues({
//     "percent": Type.PERCENT
// });

// enum HelthConditionId {
//     HELTH_CONDITION_1
// }

// final helthConditionIdValues = EnumValues({
//     "Helth condition 1": HelthConditionId.HELTH_CONDITION_1
// });

// enum LifeStageId {
//     PUPPY,
//     ZIMMI
// }

// final lifeStageIdValues = EnumValues({
//     "Puppy": LifeStageId.PUPPY,
//     "Zimmi": LifeStageId.ZIMMI
// });

// enum SubCategory {
//     FOOD,
//     MEDICINE,
//     TOYS
// }

// final subCategoryValues = EnumValues({
//     "food": SubCategory.FOOD,
//     "medicine": SubCategory.MEDICINE,
//     "toys": SubCategory.TOYS
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     late Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         reverseMap = map.map((k, v) => MapEntry(v, k));
//         return reverseMap;
//     }
// }
