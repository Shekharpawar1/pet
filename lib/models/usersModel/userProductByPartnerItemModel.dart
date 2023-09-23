class ProductByPartnerItemModel {
  String? status;
  List<Data>? data;
  String? message;

  ProductByPartnerItemModel({this.status, this.data, this.message});

  ProductByPartnerItemModel.fromJson(Map<String, dynamic> json) {
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
  String? createdAt;
  String? updatedAt;
  int? orderCount;
  int? avgRating;
  int? ratingCount;
  String? rating;
  int? moduleId;
  int? stock;
  int? unitId;
  String? images;
  String? foodVariations;
  String? brandId;
  String? lifeStageId;
  String? helthConditionId;
  String? petsbreedsId;

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
      this.rating,
      this.moduleId,
      this.stock,
      this.unitId,
      this.images,
      this.foodVariations,
      this.brandId,
      this.lifeStageId,
      this.helthConditionId,
      this.petsbreedsId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    categoryId = json['category_id'];
    subCategory = json['sub_category'];
    categoryIds = json['category_ids'];
    variations = json['variations'];
    addOns = json['add_ons'];
    attributes = json['attributes'];
    choiceOptions = json['choice_options'];
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
    rating = json['rating'];
    moduleId = json['module_id'];
    stock = json['stock'];
    unitId = json['unit_id'];
    images = json['images'];
    foodVariations = json['food_variations'];
    brandId = json['brand_id'];
    lifeStageId = json['lifeStage_id'];
    helthConditionId = json['helthCondition_id'];
    petsbreedsId = json['Petsbreeds_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['category_id'] = this.categoryId;
    data['sub_category'] = this.subCategory;
    data['category_ids'] = this.categoryIds;
    data['variations'] = this.variations;
    data['add_ons'] = this.addOns;
    data['attributes'] = this.attributes;
    data['choice_options'] = this.choiceOptions;
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
    data['rating'] = this.rating;
    data['module_id'] = this.moduleId;
    data['stock'] = this.stock;
    data['unit_id'] = this.unitId;
    data['images'] = this.images;
    data['food_variations'] = this.foodVariations;
    data['brand_id'] = this.brandId;
    data['lifeStage_id'] = this.lifeStageId;
    data['helthCondition_id'] = this.helthConditionId;
    data['Petsbreeds_id'] = this.petsbreedsId;
    return data;
  }
}