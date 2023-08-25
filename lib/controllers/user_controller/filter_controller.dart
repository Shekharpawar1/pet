

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/models/usersModel/getUserCategoriesModel.dart';
import 'package:pet/models/usersModel/getUserPropertiesModel.dart';
import 'package:pet/models/usersModel/lifestageModel.dart';
import 'package:pet/models/usersModel/ourBrandModel.dart';
import 'package:pet/models/usersModel/petCategoryBreedModel.dart';
import 'package:pet/models/usersModel/userhealthconditionModel.dart';
import 'package:pet/others/Filter.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

class FilterController  extends GetxController {

List<String> branditems = [];
List<String> categoryitems = [];
List<String> breeditem = [];
List<String> lifestageitem = [];
List<String> vegitem = [];
List<String> productitem = [];
List<String> healthconditionitem = [];
List<String> selectCategoryFilterList = [];
List<String> selectBrandFilterList = [];
List<String> selectBreedFilterList = [];
List<String> selectLifeStageFilterList = [];
List<String> selectVegFilterList = [];
List<String> selectHealthConditionFilterList = [];
// List<String> selectBrandFilterList = [];
int? categoryId;

bool isChecked = false;
List isCheckedList = [];
int? selectindex ;
    // ItemModel(
    //   headerValue: 'Sort by',
    //   expandedValue: ['Relevance', 'Title:A-Z', 'Title:Z-A','Date: New to Old','Date: Old to New','Price: Low to High','Price: Hight to Low','Discount: High to Low','Rating: Low to High','Rating: High to Low','Total reviews: Low to High','Total reviews: High to Low'],
    //   isExpanded: false,
    //   isChecked: false,
    // ),
    // ItemModel(
    //   headerValue: 'Brand',
    //   expandedValue: ['Acana', 'Aeolus', 'Andis','Bayer','Drools','Glandex'],
    //   isExpanded: false,
    //   isChecked: false,
    // ),

    //  ItemModel(
    //   headerValue: 'Product type',
    //   expandedValue: ['Cat Toys', 'Cat Grooming', 'Dog Clothing','Dog Toys','Health Care'],
    //   isExpanded: false,
    //   isChecked: false,
    // ),
    // ItemModel(
    //   headerValue: 'Price,₹',
    //   expandedValue: ['75', '100'],
    //   isExpanded: false,
    //   isChecked: false,
    // ),
    //  ItemModel(
    //   headerValue: 'Lifestage',
    //   expandedValue: ['Adult', 'All','Puppy','Senior'],
    //   isExpanded: false,
    //   isChecked: false,
    // ),
    // ItemModel(
    //   headerValue: 'Breed Type',
    //   expandedValue: ['Boxer', 'Beagle','All','Large','Medium','Small'],
    //   isExpanded: false,
    //   isChecked: false,
    // ),

    //  ItemModel(
    //   headerValue: 'Health Condition',
    //   expandedValue: ['Anemia', 'Eye Care','Live Care','Weaning',],
    //   isExpanded: false,
    //   isChecked: false,
    // ),

    //   ItemModel(
    //   headerValue: 'Special Diet',
    //   expandedValue: ['Low Grain', 'Vegan',],
    //   isExpanded: false,
    //   isChecked: false,
    // ),

    //   ItemModel(
    //   headerValue: 'Veg/Non-Veg',
    //   expandedValue: ['Non-Veg', 'Veg',],
    //   isExpanded: false,
    //   isChecked: false,
    // ),
    // // Add more categories as needed
  // ];
  void addcategoryId(int id) {
    categoryId =id;
    update();
    print("cat${categoryId}");
  }


// filterbrand
 void addSelectedOptionBrandList(String item) {
    selectBrandFilterList.add(item);
    update();
  }
    void removeSelectedOptionBrandList(String item) {
    selectBrandFilterList.remove(item);
    update();
  }

// filtercategory

 void addSelectedOptionCategoryList(String item) {
    selectCategoryFilterList.add(item);
    update();
  }
    void removeSelectedOptionCategoryList(String item) {
    selectCategoryFilterList.remove(item);
    update();
  }
  //filterbreed
  void addSelectedOptionBreedList(String item) {
    selectBreedFilterList.add(item);
    update();
  }
    void removeSelectedOptionBreedList(String item) {
    selectBreedFilterList.remove(item);
    update();
  }

//filterLifeStage
void addSelectedOptionLifeStageList(String item) {
    selectLifeStageFilterList.add(item);
    update();
  }
    void removeSelectedOptionLifeStageList(String item) {
    selectLifeStageFilterList.remove(item);
    update();
  }

  //HealthCondition
  void addSelectedOptionHealthList(String item) {
    selectHealthConditionFilterList.add(item);
    update();
  }
    void removeSelectedOptionHealthList(String item) {
    selectHealthConditionFilterList.remove(item);
    update();
  }

  //vegnonveg

    void addSelectedOptionVegList(String item) {
    selectVegFilterList.add(item);
    update();
  }
    void removeSelectedOptionVegList(String item) {
    selectVegFilterList.remove(item);
    update();
  }

  String getUserPropertiesUrl =
      '${Constants.BASE_URL}${Constants.API_V1_PATH}${Constants.GET_USER_PROPERTIES}';
  UserPropertiesModel? userPropertiesModel;
  bool propertyLoaded = false;
  
  String getBrandUrl = '${Constants.GET_OUR_BRAND}';
  UserOurBrandModel? userBrandModel;
  UserOurBrandModel? userOurBrandModel = UserOurBrandModel();
  bool brandLoaded = false;


   String getUserCategoriesUrl =
      '${Constants.BASE_URL}${Constants.API_V1_PATH}${Constants.GET_USER_CATEGORIES}';
  UserCategoriesModel? userCategoriesModel;
  bool categoryLoaded = false;


    String getlifestageUrl = '${Constants.GET_LIFESTAGE}';
  LifeStageModel? userlifestageModel;
  // LifeStageModel? userlifestageModel = UserOurBrandModel();
  bool lifestageLoaded = false;

  String gethealthUrl = '${Constants.GET_HEALTH_CONDITION}';
  HealthConditionModel? userhealthconditionModel;
  // LifeStageModel? userlifestageModel = UserOurBrandModel();
  bool healthLoaded = false;


    String getCategoryBreedUrl = Constants.GET_CATEGORY_BREED;
  PetCategoryBreedModel? petCategoryBreedModel;

  void init() async {
  
    Map<bool, String> foodTypeMap = {
  true: "veg",
  false: "non-veg",
};
List<bool> foodTypes = [true, false];
List<String> foodTypeNames = foodTypes.map((isChecked) => foodTypeMap[isChecked] ?? "unknown").toList();
  vegitem  = foodTypeNames;
     try {
      // pets
      userPropertiesModel = UserPropertiesModel.fromJson(
          await ApiHelper.getApi(getUserPropertiesUrl));
      print(userPropertiesModel);
      List<String> productlist = userPropertiesModel!.data!.map((e) => e.name.toString()).toList();
   productitem = productlist;
      propertyLoaded = true;
      update();
    } catch (e) {
      print('Error: $e');
      Get.snackbar(
        'Error',
        'An error occurred: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
   try {
      // our brands
      userBrandModel =
          UserOurBrandModel.fromJson(await ApiHelper.getApi(getBrandUrl));
     
      print(
          "CAnine products ===>>>> ${userBrandModel!.data!.where((element) => element.canine == 1).toList()}");
      brandLoaded = true;
      List demo = userBrandModel!.data!.where((element) => element.canine == 1).toList();
      List<String> fina = demo.map((e) => e.title.toString()).toList();
      List<bool> isCheckList = userBrandModel!.data!.map((e) => false).toList();

      print("=====>>>>>>>>> items : $fina");
      branditems = fina;
      update();
    } catch (e) {
      print('Error: $e');
      Get.snackbar(
        'Error',
        'An error occurred: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }

     try {
      // categories
      userCategoriesModel = UserCategoriesModel.fromJson(
          await ApiHelper.getApi(getUserCategoriesUrl));
      print(userCategoriesModel);
       List<String> categorylist = userCategoriesModel!.data!.map((e) => e.name.toString()).toList();

      //  categoryId = int.parse(categorylist.toString());
            //  List<bool> isCheckList = userCategoriesModel!.data!.map((e) => false).toList();
categoryitems = categorylist;
    //      items.add(
    //      ItemModel(
    //   headerValue: 'Category',
    //   expandedValue: categorylist,
    //   isExpanded: false,
    //   isChecked: isCheckList,
    // ),
    //   );
       print("-------${categoryId}");
      categoryLoaded = true;
      update();
    } catch (e) {
      print('Error: $e');
      Get.snackbar(
        'Error',
        'An error occurred: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }




    try {
      // 
      userlifestageModel =
          LifeStageModel.fromJson(await ApiHelper.getApi(getlifestageUrl+"${categoryId}"));
     
      print(
          getlifestageUrl+"${categoryId}");
      lifestageLoaded = true;
      // List demo = userlifestageModel!.data!.where((element) => element.name.toString()).toList();
      List<String> lifestage = userlifestageModel!.data!.map((e) => e.name.toString()).toList();
      //  List<bool> isCheckList = userlifestageModel!.data/!.map((e) => false).toList();

      print("=====>>>>>>>>> items : $lifestage");
      lifestageitem = lifestage;
    //   items.add(
    //      ItemModel(
    //   headerValue: 'Lifestage',
    //   expandedValue: lifestage,
    //   isExpanded: false,
    //   isChecked: isCheckList,
    // ),
    //   );
      update();
    } catch (e) {
      print('Error: $e');
      Get.snackbar(
        'Error',
        'An error occurred: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }



 try {
      // breed list
      print("getting");
      petCategoryBreedModel = PetCategoryBreedModel.fromJson(
          await ApiHelper.getApi(getCategoryBreedUrl + "/1"));
      print(petCategoryBreedModel);
      // moduleLoaded = true;
      List<String> breedlist = petCategoryBreedModel!.data!.map((e) => e.name.toString()).toList();
      
      List<bool> isCheckList = petCategoryBreedModel!.data!.map((e) => false).toList();
    breeditem = breedlist;
    
    
    //     items.add(
    //      ItemModel(
    //   headerValue: 'Breed',
    //   expandedValue: breedlist,
    //   isExpanded: false,
    //   isChecked: isCheckList,
    // ),
    //   );
      update();
    } catch (e) {
      print('Error: $e');
      Get.snackbar(
        'Error',
        'Unable to Load Category: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }


     try {
      // 
      userhealthconditionModel =
          HealthConditionModel.fromJson(await ApiHelper.getApi(gethealthUrl));
     
      print(
          gethealthUrl);
      healthLoaded = true;
      // List demo = userlifestageModel!.data!.where((element) => element.name.toString()).toList();
      List<String> healthcondition = userhealthconditionModel!.data!.map((e) => e.title.toString()).toList();
           List<bool> isCheckList = userhealthconditionModel!.data!.map((e) => false).toList();

      print("=====>>>>>>>>> items : $healthcondition");
      healthconditionitem = healthcondition;
    //   items.add(
    //      ItemModel(
    //   headerValue: 'Health Condition',
    //   expandedValue: healthcondition,
    //   isExpanded: false,
    //   isChecked: isCheckList,
    // ),
    //   );
      update();
    } catch (e) {
      print('Error: $e');
      Get.snackbar(
        'Error',
        'An error occurred: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }






    // get getAfilterList => items;





    void filter() {
  List<Map<String, dynamic>> products =
  [
    {
      "name": "Product 1",
      "brand": "brand 1",
      "veg": true,
      "price": 4999,
      "life-stage": "adult",
      "product-type": "dry-dog-food",
      "breed": "boxer",
      "health-condition": "Helth condition 1",
      "special-diet": "low-gain",
    },
    {
      "name": "Product 2",
      "brand": "brand 1",
      "veg": false,
      "price": 2999,
      "life-stage": "puppy",
      "product-type": "greavy-dog-food",
      "breed": "boxer",
      "health-condition": "weaning",
      "special-diet": "gain-free",
    },
    {
      "name": "Product 3",
      "brand": "brand2",
      "veg": true,
      "price": 3999,
      "life-stage": "adult",
      "product-type": "dry-dog-food",
      "breed": "pug",
      "health-condition": "weaning",
      "special-diet": "low-gain",
    },
    {
      "name": "Product 4",
      "brand": "brand3",
      "veg": false,
      "price": 5999,
      "life-stage": "puppy",
      "product-type": "greavy-dog-food",
      "breed": "pug",
      "health-condition": "sensitive",
      "special-diet": "gain-free",
    },
    {
      "name": "Product 5",
      "brand": "brand 1",
      "veg": true,
      "price": 6999,
      "life-stage": "adult",
      "product-type": "dry-dog-food",
      "breed": "boxer",
      "health-condition": "weaning",
      "special-diet": "low-gain",
    },
    {
      "name": "Product 6",
      "brand": "brand4",
      "veg": false,
      "price": 2999,
      "life-stage": "adult",
      "product-type": "dry-dog-food",
      "breed": "boxer",
      "health-condition": "weaning",
      "special-diet": "low-gain",
    },
    {
      "name": "Product 7",
      "brand": "brand 1",
      "veg": false,
      "price": 3999,
      "life-stage": "puppy",
      "product-type": "dry-dog-food",
      "breed": "pug",
      "health-condition": "weaning",
      "special-diet": "gain-free",
    },
    // More products...
  ];

  List<Map<String, dynamic>> filteredProducts = applyFilters(
    selectedBrands: selectBrandFilterList,
    selectedVegOptions: [true,false],
    lifeStage:null,
    products: products,
    maxPrice: 10000,
    minPrice: 000,
    productType: ["dry-dog-food", "greavy-dog-food"],
    breed: null,
    healthCondition: selectHealthConditionFilterList,
    specialDiet: ["low-gain", "gain-free"],
  );
  // Display filtered products
  print("Filtered Products:");
  print("seleced brand: $selectBrandFilterList");
   print("seleced brand: $selectHealthConditionFilterList");
  filteredProducts.forEach((product) {
   int index = filteredProducts.indexOf(product) + 1;
    print("$index: Name: ${product['name']}");
    printAdditionalInfo(product);
    print(""); // Add an empty line for separation
 });
}
void printAdditionalInfo(Map<String, dynamic> product) {
  print("   Brand: ${product['brand']}");
  print("   Veg: ${product['veg']}");
  print("   Price: ${product['price']}");
  print("   Life Stage: ${product['life-stage']}");
  print("   Product Type: ${product['product-type']}");
  print("   Breed: ${product['breed']}");
  print("   Health Condition: ${product['health-condition']}");
  print("   Special Diet: ${product['special-diet']}");
}
List<Map<String, dynamic>> applyFilters({
  List<String>? selectedBrands,
  List<String>? lifeStage,
  List<String>? productType,
  List<String>? breed,
  List<String>? healthCondition,
  List<String>? specialDiet,
  List<bool>? selectedVegOptions,
  int? minPrice,
  int? maxPrice,
  required List<Map<String, dynamic>> products,
}) {
  return products.where((product) {
    bool brandFilter = selectedBrands == null || selectedBrands.contains(product["brand"]);
    bool vegFilter = selectedVegOptions == null || selectedVegOptions.contains(product["veg"]);
    bool maxPriceFilter = maxPrice == null || product["price"] < maxPrice;
    bool minPriceFilter = minPrice == null || product["price"] > minPrice;
    bool lifeStageFilter = lifeStage == null || lifeStage.contains(product["life-stage"]);
    bool breedFilter = breed == null || breed.contains(product["breed"]);
    bool healthConditionFilter = healthCondition == null || healthCondition.contains(product["health-condition"]);
    bool specialDietFilter = specialDiet == null || specialDiet.contains(product["special-diet"]);
    return brandFilter && vegFilter && maxPriceFilter && minPriceFilter && lifeStageFilter && breedFilter && healthConditionFilter && specialDietFilter;
  }).toList();
}
}