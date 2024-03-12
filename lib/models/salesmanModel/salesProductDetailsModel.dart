// class SalesProductDetailsModel {
//   String? status;
//   Data? data;
//   String? message;

//   SalesProductDetailsModel({this.status, this.data, this.message});

//   SalesProductDetailsModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//     message = json['message'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['message'] = this.message;
//     return data;
//   }
// }

// class Data {
//   int? id;
//   String? name;
//   String? description;
//   String? image;
//   int? categoryId;
//   String? subCategory;
//   String? categoryIds;
//   List<Variations>? variations;
//   // List<Null>? addOns;
//   List<String>? attributes;
//   List<ChoiceOptions>? choiceOptions;
//   int? price;
//   int? wholePrice;
//   int? minOrder;
//   int? tax;
//   String? taxType;
//   int? discount;
//   String? discountType;
//   String? availableTimeStarts;
//   String? availableTimeEnds;
//   int? veg;
//   int? status;
//   int? storeId;
//   String? createdAt;
//   String? updatedAt;
//   int? orderCount;
//   int? avgRating;
//   int? ratingCount;
//   int? moduleId;
//   int? stock;
//   int? unitId;
//   List<String>? images;
//   // List<Null>? foodVariations;
//   String? brandId;
//   String? lifeStageId;
//   String? helthConditionId;
//   String? petsbreedsId;
//   String? returnable;
//   String? storeName;
//   String? moduleType;
//   int? zoneId;
//   int? storeDiscount;
//   bool? scheduleOrder;
//   String? unitType;
//   Module? module;
//   Unit? unit;

//   Data(
//       {this.id,
//       this.name,
//       this.description,
//       this.image,
//       this.categoryId,
//       this.subCategory,
//       this.categoryIds,
//       this.variations,
//       // this.addOns,
//       this.attributes,
//       this.choiceOptions,
//       this.price,
//       this.wholePrice,
//       this.minOrder,
//       this.tax,
//       this.taxType,
//       this.discount,
//       this.discountType,
//       this.availableTimeStarts,
//       this.availableTimeEnds,
//       this.veg,
//       this.status,
//       this.storeId,
//       this.createdAt,
//       this.updatedAt,
//       this.orderCount,
//       this.avgRating,
//       this.ratingCount,
//       this.moduleId,
//       this.stock,
//       this.unitId,
//       this.images,
//       // this.foodVariations,
//       this.brandId,
//       this.lifeStageId,
//       this.helthConditionId,
//       this.petsbreedsId,
//       this.returnable,
//       this.storeName,
//       this.moduleType,
//       this.zoneId,
//       this.storeDiscount,
//       this.scheduleOrder,
//       this.unitType,
//       this.module,
//       this.unit});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//     image = json['image'];
//     categoryId = json['category_id'];
//     subCategory = json['sub_category'];
//     categoryIds = json['category_ids'];
//     if (json['variations'] != null) {
//       variations = <Variations>[];
//       json['variations'].forEach((v) {
//         variations!.add(new Variations.fromJson(v));
//       });
//     }
//     // if (json['add_ons'] != null) {
//     //   addOns = <Null>[];
//     //   json['add_ons'].forEach((v) {
//     //     addOns!.add(new Null.fromJson(v));
//     //   });
//     // }
//     attributes = json['attributes'].cast<String>();
//     if (json['choice_options'] != null) {
//       choiceOptions = <ChoiceOptions>[];
//       json['choice_options'].forEach((v) {
//         choiceOptions!.add(new ChoiceOptions.fromJson(v));
//       });
//     }
//     price = json['price'];
//     wholePrice = json['whole_price'];
//     minOrder = json['min_order'];
//     tax = json['tax'];
//     taxType = json['tax_type'];
//     discount = json['discount'];
//     discountType = json['discount_type'];
//     availableTimeStarts = json['available_time_starts'];
//     availableTimeEnds = json['available_time_ends'];
//     veg = json['veg'];
//     status = json['status'];
//     storeId = json['store_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     orderCount = json['order_count'];
//     avgRating = json['avg_rating'];
//     ratingCount = json['rating_count'];
//     moduleId = json['module_id'];
//     stock = json['stock'];
//     unitId = json['unit_id'];
//     images = json['images'].cast<String>();
//     // if (json['food_variations'] != null) {
//     //   foodVariations = <Null>[];
//     //   json['food_variations'].forEach((v) {
//     //     foodVariations!.add(new Null.fromJson(v));
//     //   });
//     // }
//     brandId = json['brand_id'];
//     lifeStageId = json['lifeStage_id'];
//     helthConditionId = json['helthCondition_id'];
//     petsbreedsId = json['Petsbreeds_id'];
//       returnable = json['returnable'];
//     storeName = json['store_name'];
//     moduleType = json['module_type'];
//     zoneId = json['zone_id'];
//     storeDiscount = json['store_discount'];
//     scheduleOrder = json['schedule_order'];
//     unitType = json['unit_type'];
//     module =
//         json['module'] != null ? new Module.fromJson(json['module']) : null;
//     unit = json['unit'] != null ? new Unit.fromJson(json['unit']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['description'] = this.description;
//     data['image'] = this.image;
//     data['category_id'] = this.categoryId;
//     data['sub_category'] = this.subCategory;
//     data['category_ids'] = this.categoryIds;
//     if (this.variations != null) {
//       data['variations'] = this.variations!.map((v) => v.toJson()).toList();
//     }
//     // if (this.addOns != null) {
//     //   data['add_ons'] = this.addOns!.map((v) => v.toJson()).toList();
//     // }
//     data['attributes'] = this.attributes;
//     if (this.choiceOptions != null) {
//       data['choice_options'] =
//           this.choiceOptions!.map((v) => v.toJson()).toList();
//     }
//     data['price'] = this.price;
//     data['whole_price'] = this.wholePrice;
//     data['min_order'] = this.minOrder;
//     data['tax'] = this.tax;
//     data['tax_type'] = this.taxType;
//     data['discount'] = this.discount;
//     data['discount_type'] = this.discountType;
//     data['available_time_starts'] = this.availableTimeStarts;
//     data['available_time_ends'] = this.availableTimeEnds;
//     data['veg'] = this.veg;
//     data['status'] = this.status;
//     data['store_id'] = this.storeId;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['order_count'] = this.orderCount;
//     data['avg_rating'] = this.avgRating;
//     data['rating_count'] = this.ratingCount;
//     data['module_id'] = this.moduleId;
//     data['stock'] = this.stock;
//     data['unit_id'] = this.unitId;
//     data['images'] = this.images;
//     // if (this.foodVariations != null) {
//     //   data['food_variations'] =
//     //       this.foodVariations!.map((v) => v.toJson()).toList();
//     // }
//     data['brand_id'] = this.brandId;
//     data['lifeStage_id'] = this.lifeStageId;
//     data['helthCondition_id'] = this.helthConditionId;
//     data['Petsbreeds_id'] = this.petsbreedsId;
//        data['returnable'] = this.returnable;
//     data['store_name'] = this.storeName;
//     data['module_type'] = this.moduleType;
//     data['zone_id'] = this.zoneId;
//     data['store_discount'] = this.storeDiscount;
//     data['schedule_order'] = this.scheduleOrder;
//     data['unit_type'] = this.unitType;
//     if (this.module != null) {
//       data['module'] = this.module!.toJson();
//     }
//     if (this.unit != null) {
//       data['unit'] = this.unit!.toJson();
//     }
//     return data;
//   }
// }

// class Variations {
//   String? type;
//   int? price;
//   int? wholeprice;
//   int? stock;

//   Variations({this.type, this.price, this.wholeprice, this.stock});

//   Variations.fromJson(Map<String, dynamic> json) {
//     type = json['type'];
//     price = json['price'];
//     wholeprice = json['wholeprice'];
//     stock = json['stock'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['type'] = this.type;
//     data['price'] = this.price;
//     data['wholeprice'] = this.wholeprice;
//     data['stock'] = this.stock;
//     return data;
//   }
// }

// class ChoiceOptions {
//   String? name;
//   String? title;
//   List<String>? options;

//   ChoiceOptions({this.name, this.title, this.options});

//   ChoiceOptions.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     title = json['title'];
//     options = json['options'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['title'] = this.title;
//     data['options'] = this.options;
//     return data;
//   }
// }

// class Module {
//   int? id;
//   String? moduleName;
//   String? moduleType;
//   String? thumbnail;
//   String? status;
//   int? storesCount;
//   String? createdAt;
//   String? updatedAt;
//   String? icon;
//   int? themeId;
//   String? description;
//   int? allZoneService;
//   // List<Null>? translations;

//   Module(
//       {this.id,
//       this.moduleName,
//       this.moduleType,
//       this.thumbnail,
//       this.status,
//       this.storesCount,
//       this.createdAt,
//       this.updatedAt,
//       this.icon,
//       this.themeId,
//       this.description,
//       this.allZoneService,
//       // this.translations
//       });

//   Module.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     moduleName = json['module_name'];
//     moduleType = json['module_type'];
//     thumbnail = json['thumbnail'];
//     status = json['status'];
//     storesCount = json['stores_count'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     icon = json['icon'];
//     themeId = json['theme_id'];
//     description = json['description'];
//     allZoneService = json['all_zone_service'];
//     // if (json['translations'] != null) {
//     //   translations = <Null>[];
//     //   json['translations'].forEach((v) {
//     //     translations!.add(new Null.fromJson(v));
//     //   });
//     // }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['module_name'] = this.moduleName;
//     data['module_type'] = this.moduleType;
//     data['thumbnail'] = this.thumbnail;
//     data['status'] = this.status;
//     data['stores_count'] = this.storesCount;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['icon'] = this.icon;
//     data['theme_id'] = this.themeId;
//     data['description'] = this.description;
//     data['all_zone_service'] = this.allZoneService;
//     // if (this.translations != null) {
//     //   data['translations'] = this.translations!.map((v) => v.toJson()).toList();
//     // }
//     return data;
//   }
// }

// class Unit {
//   int? id;
//   String? unit;
//   String? createdAt;
//   String? updatedAt;

//   Unit({this.id, this.unit, this.createdAt, this.updatedAt});

//   Unit.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     unit = json['unit'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['unit'] = this.unit;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }








class SalesProductDetailsModel {
   String? status;
  Data? data;
  String? message;

  SalesProductDetailsModel({this.status, this.data, this.message});

  SalesProductDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? description;
  String? image;
  int? categoryId;
  String? subCategory;
  List<CategoryIds>? categoryIds;
  List<Variations>? variations;
  List<Null>? addOns;
  List<String>? attributes;
  List<ChoiceOptions>? choiceOptions;
  int? price;
  int? wholePrice;
  num? minOrder;
  int? tax;
  String? taxType;
  int? discount;
  String? discountType;
  String? availableTimeStarts;
  String? availableTimeEnds;
  int? veg;
  int? status;
  int? storeId;
  String? createdAt;
  String? updatedAt;
  int? orderCount;
  int? avgRating;
  int? ratingCount;
  int? moduleId;
  int? stock;
  int? unitId;
  List<String>? images;
  List<Null>? foodVariations;
  String? brandId;
  String? lifeStageId;
  String? helthConditionId;
  String? petsbreedsId;
  String? returnable;
  String? gst;
  List<SuggestionProduct>? suggestionProduct;
  String? storeName;
  String? moduleType;
  int? zoneId;
  int? storeDiscount;
  bool? scheduleOrder;
  String? categoryName;
  String? subCategoryName;
  String? brandTitle;
  String? lifeStageName;
  String? healthConditionTitle;
  String? petBreedName;
  String? unitType;
  Module? module;
  Unit? unit;

  Data(
      {this.id,
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
      this.suggestionProduct,
      this.storeName,
      this.moduleType,
      this.zoneId,
      this.storeDiscount,
      this.scheduleOrder,
      this.categoryName,
      this.subCategoryName,
      this.brandTitle,
      this.lifeStageName,
      this.healthConditionTitle,
      this.petBreedName,
      this.unitType,
      this.module,
      this.unit});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    categoryId = json['category_id'];
    subCategory = json['sub_category'];
    if (json['category_ids'] != null) {
      categoryIds = <CategoryIds>[];
      json['category_ids'].forEach((v) {
        categoryIds!.add(new CategoryIds.fromJson(v));
      });
    }
    if (json['variations'] != null) {
      variations = <Variations>[];
      json['variations'].forEach((v) {
        variations!.add(new Variations.fromJson(v));
      });
    }
    // if (json['add_ons'] != null) {
    //   addOns = <Null>[];
    //   json['add_ons'].forEach((v) {
    //     addOns!.add(new Null.fromJson(v));
    //   });
    // }
    attributes = json['attributes'].cast<String>();
    if (json['choice_options'] != null) {
      choiceOptions = <ChoiceOptions>[];
      json['choice_options'].forEach((v) {
        choiceOptions!.add(new ChoiceOptions.fromJson(v));
      });
    }
    price = json['price'];
    wholePrice = json['whole_price'];
    minOrder = json['min_order'];
    tax = json['tax'];
    taxType = json['tax_type'];
    discount = json['discount'];
    discountType = json['discount_type'];
    availableTimeStarts = json['available_time_starts'];
    availableTimeEnds = json['available_time_ends'];
    veg = json['veg'];
    status = json['status'];
    storeId = json['store_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    orderCount = json['order_count'];
    avgRating = json['avg_rating'];
    ratingCount = json['rating_count'];
    moduleId = json['module_id'];
    stock = json['stock'];
    unitId = json['unit_id'];
    images = json['images'].cast<String>();
    // if (json['food_variations'] != null) {
    //   foodVariations = <Null>[];
    //   json['food_variations'].forEach((v) {
    //     foodVariations!.add(new Null.fromJson(v));
    //   });
    // }
    brandId = json['brand_id'];
    lifeStageId = json['lifeStage_id'];
    helthConditionId = json['helthCondition_id'];
    petsbreedsId = json['Petsbreeds_id'];
    returnable = json['returnable'];
    gst = json['gst'];
    if (json['suggestion_product'] != null) {
      suggestionProduct = <SuggestionProduct>[];
      json['suggestion_product'].forEach((v) {
        suggestionProduct!.add(new SuggestionProduct.fromJson(v));
      });
    }
    storeName = json['store_name'];
    moduleType = json['module_type'];
    zoneId = json['zone_id'];
    storeDiscount = json['store_discount'];
    scheduleOrder = json['schedule_order'];
    categoryName = json['category_name'];
    subCategoryName = json['sub_category_name'];
    brandTitle = json['brand_title'];
    lifeStageName = json['lifeStage_name'];
    healthConditionTitle = json['healthCondition_title'];
    petBreedName = json['petBreed_name'];
    unitType = json['unit_type'];
    module =
        json['module'] != null ? new Module.fromJson(json['module']) : null;
    unit = json['unit'] != null ? new Unit.fromJson(json['unit']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['category_id'] = this.categoryId;
    data['sub_category'] = this.subCategory;
    if (this.categoryIds != null) {
      data['category_ids'] = this.categoryIds!.map((v) => v.toJson()).toList();
    }
    if (this.variations != null) {
      data['variations'] = this.variations!.map((v) => v.toJson()).toList();
    }
    // if (this.addOns != null) {
    //   data['add_ons'] = this.addOns!.map((v) => v.toJson()).toList();
    // }
    data['attributes'] = this.attributes;
    if (this.choiceOptions != null) {
      data['choice_options'] =
          this.choiceOptions!.map((v) => v.toJson()).toList();
    }
    data['price'] = this.price;
    data['whole_price'] = this.wholePrice;
    data['min_order'] = this.minOrder;
    data['tax'] = this.tax;
    data['tax_type'] = this.taxType;
    data['discount'] = this.discount;
    data['discount_type'] = this.discountType;
    data['available_time_starts'] = this.availableTimeStarts;
    data['available_time_ends'] = this.availableTimeEnds;
    data['veg'] = this.veg;
    data['status'] = this.status;
    data['store_id'] = this.storeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['order_count'] = this.orderCount;
    data['avg_rating'] = this.avgRating;
    data['rating_count'] = this.ratingCount;
    data['module_id'] = this.moduleId;
    data['stock'] = this.stock;
    data['unit_id'] = this.unitId;
    data['images'] = this.images;
    // if (this.foodVariations != null) {
    //   data['food_variations'] =
    //       this.foodVariations!.map((v) => v.toJson()).toList();
    // }
    data['brand_id'] = this.brandId;
    data['lifeStage_id'] = this.lifeStageId;
    data['helthCondition_id'] = this.helthConditionId;
    data['Petsbreeds_id'] = this.petsbreedsId;
    data['returnable'] = this.returnable;
    data['gst'] = this.gst;
    if (this.suggestionProduct != null) {
      data['suggestion_product'] =
          this.suggestionProduct!.map((v) => v.toJson()).toList();
    }
    data['store_name'] = this.storeName;
    data['module_type'] = this.moduleType;
    data['zone_id'] = this.zoneId;
    data['store_discount'] = this.storeDiscount;
    data['schedule_order'] = this.scheduleOrder;
    data['category_name'] = this.categoryName;
    data['sub_category_name'] = this.subCategoryName;
    data['brand_title'] = this.brandTitle;
    data['lifeStage_name'] = this.lifeStageName;
    data['healthCondition_title'] = this.healthConditionTitle;
    data['petBreed_name'] = this.petBreedName;
    data['unit_type'] = this.unitType;
    if (this.module != null) {
      data['module'] = this.module!.toJson();
    }
    if (this.unit != null) {
      data['unit'] = this.unit!.toJson();
    }
    return data;
  }
}

class CategoryIds {
  String? id;
  int? position;

  CategoryIds({this.id, this.position});

  CategoryIds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['position'] = this.position;
    return data;
  }
}

class Variations {
  String? type;
  int? price;
  int? wholeprice;
  int? stock;

  Variations({this.type, this.price, this.wholeprice, this.stock});

  Variations.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    price = json['price'];
    wholeprice = json['wholeprice'];
    stock = json['stock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['price'] = this.price;
    data['wholeprice'] = this.wholeprice;
    data['stock'] = this.stock;
    return data;
  }
}

class ChoiceOptions {
  String? name;
  String? title;
  List<String>? options;

  ChoiceOptions({this.name, this.title, this.options});

  ChoiceOptions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    title = json['title'];
    options = json['options'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['title'] = this.title;
    data['options'] = this.options;
    return data;
  }
}

class SuggestionProduct {
  int? id;
  String? name;
  String? description;
  String? image;
  int? categoryId;
  String? subCategory;
  List<CategoryIds>? categoryIds;
  List<Variations>? variations;
  List<Null>? addOns;
  List<String>? attributes;
  List<ChoiceOptions>? choiceOptions;
  int? price;
  int? wholePrice;
  num? minOrder;
  int? tax;
  String? taxType;
  int? discount;
  String? discountType;
  String? availableTimeStarts;
  String? availableTimeEnds;
  int? veg;
  int? status;
  int? storeId;
  String? createdAt;
  String? updatedAt;
  int? orderCount;
  int? avgRating;
  int? ratingCount;
  int? moduleId;
  int? stock;
  int? unitId;
  List<String>? images;
  List<Null>? foodVariations;
  String? brandId;
  String? lifeStageId;
  String? helthConditionId;
  String? petsbreedsId;
  String? returnable;
  String? gst;
  String? suggestionProduct;
  String? storeName;
  String? moduleType;
  int? zoneId;
  int? storeDiscount;
  bool? scheduleOrder;
  String? unitType;
  Module? module;
  Unit? unit;

  SuggestionProduct(
      {this.id,
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
      this.suggestionProduct,
      this.storeName,
      this.moduleType,
      this.zoneId,
      this.storeDiscount,
      this.scheduleOrder,
      this.unitType,
      this.module,
      this.unit});

  SuggestionProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    categoryId = json['category_id'];
    subCategory = json['sub_category'];
    if (json['category_ids'] != null) {
      categoryIds = <CategoryIds>[];
      json['category_ids'].forEach((v) {
        categoryIds!.add(new CategoryIds.fromJson(v));
      });
    }
    if (json['variations'] != null) {
      variations = <Variations>[];
      json['variations'].forEach((v) {
        variations!.add(new Variations.fromJson(v));
      });
    }
    // if (json['add_ons'] != null) {
    //   addOns = <Null>[];
    //   json['add_ons'].forEach((v) {
    //     addOns!.add(new Null.fromJson(v));
    //   });
    // }
    attributes = json['attributes'].cast<String>();
    if (json['choice_options'] != null) {
      choiceOptions = <ChoiceOptions>[];
      json['choice_options'].forEach((v) {
        choiceOptions!.add(new ChoiceOptions.fromJson(v));
      });
    }
    price = json['price'];
    wholePrice = json['whole_price'];
    minOrder = json['min_order'];
    tax = json['tax'];
    taxType = json['tax_type'];
    discount = json['discount'];
    discountType = json['discount_type'];
    availableTimeStarts = json['available_time_starts'];
    availableTimeEnds = json['available_time_ends'];
    veg = json['veg'];
    status = json['status'];
    storeId = json['store_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    orderCount = json['order_count'];
    avgRating = json['avg_rating'];
    ratingCount = json['rating_count'];
    moduleId = json['module_id'];
    stock = json['stock'];
    unitId = json['unit_id'];
    images = json['images'].cast<String>();
    // if (json['food_variations'] != null) {
    //   foodVariations = <Null>[];
    //   json['food_variations'].forEach((v) {
    //     foodVariations!.add(new Null.fromJson(v));
    //   });
    // }
    brandId = json['brand_id'];
    lifeStageId = json['lifeStage_id'];
    helthConditionId = json['helthCondition_id'];
    petsbreedsId = json['Petsbreeds_id'];
    returnable = json['returnable'];
    gst = json['gst'];
    suggestionProduct = json['suggestion_product'];
    storeName = json['store_name'];
    moduleType = json['module_type'];
    zoneId = json['zone_id'];
    storeDiscount = json['store_discount'];
    scheduleOrder = json['schedule_order'];
    unitType = json['unit_type'];
    module =
        json['module'] != null ? new Module.fromJson(json['module']) : null;
    unit = json['unit'] != null ? new Unit.fromJson(json['unit']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['category_id'] = this.categoryId;
    data['sub_category'] = this.subCategory;
    if (this.categoryIds != null) {
      data['category_ids'] = this.categoryIds!.map((v) => v.toJson()).toList();
    }
    if (this.variations != null) {
      data['variations'] = this.variations!.map((v) => v.toJson()).toList();
    }
    // if (this.addOns != null) {
    //   data['add_ons'] = this.addOns!.map((v) => v.toJson()).toList();
    // }
    data['attributes'] = this.attributes;
    if (this.choiceOptions != null) {
      data['choice_options'] =
          this.choiceOptions!.map((v) => v.toJson()).toList();
    }
    data['price'] = this.price;
    data['whole_price'] = this.wholePrice;
    data['min_order'] = this.minOrder;
    data['tax'] = this.tax;
    data['tax_type'] = this.taxType;
    data['discount'] = this.discount;
    data['discount_type'] = this.discountType;
    data['available_time_starts'] = this.availableTimeStarts;
    data['available_time_ends'] = this.availableTimeEnds;
    data['veg'] = this.veg;
    data['status'] = this.status;
    data['store_id'] = this.storeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['order_count'] = this.orderCount;
    data['avg_rating'] = this.avgRating;
    data['rating_count'] = this.ratingCount;
    data['module_id'] = this.moduleId;
    data['stock'] = this.stock;
    data['unit_id'] = this.unitId;
    data['images'] = this.images;
    // if (this.foodVariations != null) {
    //   data['food_variations'] =
    //       this.foodVariations!.map((v) => v.toJson()).toList();
    // }
    data['brand_id'] = this.brandId;
    data['lifeStage_id'] = this.lifeStageId;
    data['helthCondition_id'] = this.helthConditionId;
    data['Petsbreeds_id'] = this.petsbreedsId;
    data['returnable'] = this.returnable;
    data['gst'] = this.gst;
    data['suggestion_product'] = this.suggestionProduct;
    data['store_name'] = this.storeName;
    data['module_type'] = this.moduleType;
    data['zone_id'] = this.zoneId;
    data['store_discount'] = this.storeDiscount;
    data['schedule_order'] = this.scheduleOrder;
    data['unit_type'] = this.unitType;
    if (this.module != null) {
      data['module'] = this.module!.toJson();
    }
    if (this.unit != null) {
      data['unit'] = this.unit!.toJson();
    }
    return data;
  }
}

class Module {
  int? id;
  String? moduleName;
  String? moduleType;
  String? thumbnail;
  String? status;
  int? storesCount;
  String? createdAt;
  String? updatedAt;
  String? icon;
  int? themeId;
  String? description;
  int? allZoneService;
  List<Null>? translations;

  Module(
      {this.id,
      this.moduleName,
      this.moduleType,
      this.thumbnail,
      this.status,
      this.storesCount,
      this.createdAt,
      this.updatedAt,
      this.icon,
      this.themeId,
      this.description,
      this.allZoneService,
      this.translations});

  Module.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    moduleName = json['module_name'];
    moduleType = json['module_type'];
    thumbnail = json['thumbnail'];
    status = json['status'];
    storesCount = json['stores_count'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    icon = json['icon'];
    themeId = json['theme_id'];
    description = json['description'];
    allZoneService = json['all_zone_service'];
    // if (json['translations'] != null) {
    //   translations = <Null>[];
    //   json['translations'].forEach((v) {
    //     translations!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['module_name'] = this.moduleName;
    data['module_type'] = this.moduleType;
    data['thumbnail'] = this.thumbnail;
    data['status'] = this.status;
    data['stores_count'] = this.storesCount;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['icon'] = this.icon;
    data['theme_id'] = this.themeId;
    data['description'] = this.description;
    data['all_zone_service'] = this.allZoneService;
    // if (this.translations != null) {
    //   data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Unit {
  int? id;
  String? unit;
  String? createdAt;
  String? updatedAt;

  Unit({this.id, this.unit, this.createdAt, this.updatedAt});

  Unit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    unit = json['unit'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['unit'] = this.unit;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}