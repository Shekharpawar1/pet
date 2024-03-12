
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/wholesaler_controller/ourbranddetailscontroller.dart';
import 'package:pet/models/salesmanModel/getUserPropertiesModel.dart';
import 'package:pet/models/usersModel/getUserPropertiesModel.dart'  as filterMod;
import 'package:pet/models/usersModel/filterListModel.dart';
// import 'package:pet/models/usersModel/filterListModel.dart' as filterMod;
import 'package:pet/models/usersModel/getUserCategoriesModel.dart';
import 'package:pet/models/usersModel/getUserPropertiesModel.dart';
import 'package:pet/models/usersModel/lifestageModel.dart';
import 'package:pet/models/usersModel/ourBrandModel.dart';
import 'package:pet/models/usersModel/petCategoryBreedModel.dart';
import 'package:pet/models/usersModel/subModel.dart';
import 'package:pet/models/usersModel/userhealthconditionModel.dart';
import 'package:pet/others/Filter.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

class WholeSalerOurBrandFilterController extends GetxController {
  bool showLoading = false;
  List<filterMod.Datum> filteredProducts = [];
  List<String> branditems = [];
  List<String> categoryitems = [];
    List<String> producttypeitems = [];
  List<String> breeditem = [];
  List<String> lifestageitem = [];
  List<String> vegitem = [];
  List<String> productitem = [];
  List<String> healthconditionitem = [];
  List<String> selectCategoryFilterList = [];
  List<String> selectProductTypeFilterList = [];
  List<String> selectBrandFilterList = [];
  List<String> selectBreedFilterList = [];
  List<String> selectLifeStageFilterList = [];
  List<String> selectVegFilterList = [];
  List<String> selectHealthConditionFilterList = [];
// List<String> selectBrandFilterList = [];
  int? categoryId;

  bool isChecked = false;
  List isCheckedList = [];
  int? selectindex;
  void addcategoryId(int id) {
    categoryId = id;
    update();
    print("cat${categoryId}");
  }

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

//filterProductType

  void addSelectedOptionProducttypeList(String item) {
    selectProductTypeFilterList.add(item);
    update();
  }

  void removeSelectedOptionProducttypeList(String item) {
    selectProductTypeFilterList.remove(item);
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

  String getUserSubCategoryUrl =
      '${Constants.BASE_URL}${Constants.API_V1_PATH}${Constants.GET_USER_SUBCATEGORY}';
  SubModel? usersubmodel;
    // UserPropertiesModel? userPropertiesModelorignal;
  bool propertysubloaded = false;
  UserPropertiesModel? userPropertiesModelCopy;

  String getCategoryBreedUrl = Constants.GET_CATEGORY_BREED;
  PetCategoryBreedModel? petCategoryBreedModel;
  TextEditingController minPriceController = TextEditingController();

  TextEditingController maxPriceController = TextEditingController();
  void clearFields() {
     minPriceController.clear();
    maxPriceController.clear();
      selectCategoryFilterList = [];
  selectBrandFilterList = [];
  selectBreedFilterList = [];
  selectLifeStageFilterList = [];
  selectVegFilterList = [];
  selectHealthConditionFilterList = [];
  update();
  }
  
  void init() async {
  update();
    Map<bool, String> foodTypeMap = {
      true: "veg",
      false: "non-veg",
    };
    List<bool> foodTypes = [true, false];
    List<String> foodTypeNames = foodTypes
        .map((isChecked) => foodTypeMap[isChecked] ?? "unknown")
        .toList();
    vegitem = foodTypeNames;
    try {
      // pets
      userPropertiesModel = UserPropertiesModel.fromJson(
          await ApiHelper.getApi(getUserPropertiesUrl));
      userPropertiesModel!.data = userPropertiesModel!.data!
          .where((element) => element.moduleId == 1)
          .toList();
      print(userPropertiesModel);
      List<String> productlist =
          userPropertiesModel!.data!.map((e) => e.name.toString()).toList();
      productitem = productlist;
      propertyLoaded = true;
      update();
    } catch (e) {
      print('Error: $e');
     // Get.snackbar(
      //   'Error',
      //   'An error occurred: $e',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.red,
      //   colorText: Colors.white,
      // );
    }
    try {
      // our brands
      userBrandModel =
          UserOurBrandModel.fromJson(await ApiHelper.getApi(getBrandUrl));
userBrandModel!.data = userBrandModel!.data!.where((element) => element.canine == 1).toList();
 print("CAnine products1111 ===>>>> ${userBrandModel!.data!.length}");
      // print(
      //     "CAnine products ===>>>> ${userBrandModel!.data!.where((element) => element.canine == 1).toList()}");
      brandLoaded = true;
      // List demo = userBrandModel!.data!
      //     .where((element) => element.canine == 1)
      //     .toList();
      List<String> fina = userBrandModel!.data!.map((e) => e.title.toString()).toList();
      List<bool> isCheckList = userBrandModel!.data!.map((e) => false).toList();

      print("=====>>>>>>>>> items : $fina");
      branditems = fina;
      update();
    } catch (e) {
      print('Error: $e');
     // Get.snackbar(
      //   'Error',
      //   'An error occurred: $e',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.red,
      //   colorText: Colors.white,
      // );
    }

    try {
      // categories
      userCategoriesModel = UserCategoriesModel.fromJson(
          await ApiHelper.getApi(getUserCategoriesUrl));
          userCategoriesModel!.data = userCategoriesModel!.data!.where((element) => element.moduleId == 1).toList();
 print("CAnine productCat11 ===>>>> ${userCategoriesModel!.data!.length}");
      print(userCategoriesModel);
      List<String> categorylist =
          userCategoriesModel!.data!.map((e) => e.name.toString()).toList();

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
       print("=====>>>>>>>>> itemscat : $categorylist");
      print("-------${categoryId}");
      categoryLoaded = true;
      update();
    } catch (e) {
      print('Error: $e');
     // Get.snackbar(
      //   'Error',
      //   'An error occurred: $e',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.red,
      //   colorText: Colors.white,
      // );
    }

    try {
      //
      userlifestageModel = LifeStageModel.fromJson(
          await ApiHelper.getApi(getlifestageUrl));
    // userlifestageModel!.data = userlifestageModel!.data!.where((element) => element.moduleId == 1).toList();
      print(getlifestageUrl + "${categoryId}");
      lifestageLoaded = true;
      // List demo = userlifestageModel!.data!.where((element) => element.name.toString()).toList();
      List<String> lifestage =
          userlifestageModel!.data!.map((e) => e.name.toString()).toList();
      //  List<bool> isCheckList = userlifestageModel!.data/!.map((e) => false).toList();

      print("=====>>>>>>>>> lifeitems : $lifestage");
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
     // Get.snackbar(
      //   'Error',
      //   'An error occurred: $e',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.red,
      //   colorText: Colors.white,
      // );
    }

    try {
      // breed list
      print("getting");
      petCategoryBreedModel = PetCategoryBreedModel.fromJson(
          await ApiHelper.getApi(getCategoryBreedUrl));
      print(petCategoryBreedModel);
      // moduleLoaded = true;
      List<String> breedlist =
          petCategoryBreedModel!.data!.map((e) => e.name.toString()).toList();

      List<bool> isCheckList =
          petCategoryBreedModel!.data!.map((e) => false).toList();
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
      // Get.snackbar(
      //   'Error',
      //   'Unable to Load Category: $e',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.red,
      //   colorText: Colors.white,
      // );
    }
    try {

         usersubmodel = SubModel.fromJson(
          await ApiHelper.getApi(getUserSubCategoryUrl));
            List<String> producttypelist =
          usersubmodel!.data!.map((e) => e.name.toString()).toList();

          producttypeitems = producttypelist;
      print(usersubmodel);
      propertysubloaded = true;
      update();
    } catch (e) {
      print('Error: $e');
     // Get.snackbar(
      //   'Error',
      //   'An error occurred: $e',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.red,
      //   colorText: Colors.white,
      // );

      }
      //product

     


    try {
      //
      userhealthconditionModel =
          HealthConditionModel.fromJson(await ApiHelper.getApi(gethealthUrl));

      print(gethealthUrl);
      healthLoaded = true;
      // List demo = userlifestageModel!.data!.where((element) => element.name.toString()).toList();
      List<String> healthcondition = userhealthconditionModel!.data!
          .map((e) => e.title.toString())
          .toList();
      List<bool> isCheckList =
          userhealthconditionModel!.data!.map((e) => false).toList();

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
     // Get.snackbar(
      //   'Error',
      //   'An error occurred: $e',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.red,
      //   colorText: Colors.white,
      // );
    }
  }

  Future<void> loadDefaultData() async {
  //   showLoading = true;
  //   update();
  //   FilterListModel products = FilterListModel();
  //   try {
  // String getUserPropertiesUrl =
  //     '${Constants.BASE_URL}${Constants.API_V1_PATH}${Constants.GET_USER_PROPERTIES}';
  //     products = FilterListModel.fromJson(
  //         await ApiHelper.getApi(getUserPropertiesUrl));
          
  //     products.data = products.data!.where((element) => element.moduleId == 1).toList();
      
  //     update();
  //   } catch (e) {
  //     print('Error: $e');
  //     Get.snackbar(
  //       'Error',
  //       'An error occurred: $e',
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //   }
  //   filteredProducts = products.data!;
  //   update();
    
  //   showLoading = false;
  //   update();
  
    showLoading = true;
    try {
      // ourproducts
      userPropertiesModel = UserPropertiesModel.fromJson(
          await ApiHelper.getApi(getUserPropertiesUrl));
      userPropertiesModel!.data = userPropertiesModel!.data!
          .where((element) => element.moduleId == 1)
          .toList();
      print("UserDataWhole==>");
      if (userPropertiesModel!.data!.isNotEmpty) {
        print(userPropertiesModel!.data![0].name);
      } else {
        print("wholesaller data is empty.");
      }
      print(userPropertiesModel!.data![0].name);
      userPropertiesModel!.data = userPropertiesModel!.data!
          .where((ele) => ele.brandId == oubranddetailswholeController.brandname)
          .toList();

      userPropertiesModelCopy = userPropertiesModel;
      // userPropertiesourbrandModel.data = [];
      // userPropertiesourbrandModel.data = userPropertiesourbrandModel!.data!
      //     .where((element) => userPropertiesModel!.data!.any((ele) =>
      //         ele.brandId == element.brandId && element.brandId == brandid))
      //     .toList();
      print(userPropertiesModel);
      print("DataOur");
      if (userPropertiesModel!.data!.isEmpty) {
        print("wholeuserPropertiesModel data is empty.");
        // print(userPropertiesourbrandModel!.data![0].name);
      } else {
        print(userPropertiesModel!.data);
      }
      print(userPropertiesModel!.data![0].name);

      propertyLoaded = true;
      update();
    } catch (e) {
      print('Error: $e');
     // Get.snackbar(
      //   'Error',
      //   'An error occurred: $e',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.red,
      //   colorText: Colors.white,
      // );
    }
    showLoading = false;
    update();
  }

  // get getAfilterList => items;

  Future<void> filter() async {
    showLoading = true;
    update();

    UserPropertiesModel products = UserPropertiesModel();
    // try {
    //   products = FilterListModel.fromJson(
    //       await ApiHelper.getApi("http://caninedemo.caninetest.xyz/api/v1/items/latest"));
     
    //   products.data = products.data!.where((element) => element.moduleId == 1).toList();
      
    //   update();
    // } catch (e) {
    //   print('Error: $e');
    //   Get.snackbar(
    //     'Error',
    //     'An error occurred: $e',
    //     snackPosition: SnackPosition.BOTTOM,
    //     backgroundColor: Colors.red,
    //     colorText: Colors.white,
    //   );
    // }
    showLoading = true;
    try {
      // ourproducts
      products = UserPropertiesModel.fromJson(
          await ApiHelper.getApi(getUserPropertiesUrl));
      products.data = products.data!
          .where((element) => element.moduleId == 1)
          .toList();
      print("UserDataWhole==>");
     
           print("UserData@nnn  ==>${products.data}");
      if (products!.data!.isNotEmpty) {
        print(products!.data![0].name);
      } else {
        print("wholesaller data is empty.");
      }
      print(userPropertiesModel!.data![0].name);
      userPropertiesModel!.data = userPropertiesModel!.data!
          .where((ele) => ele.brandId == oubranddetailswholeController.brandname)
          .toList();

      // userPropertiesModelCopy = userPropertiesModel;
      // userPropertiesourbrandModel.data = [];
      // userPropertiesourbrandModel.data = userPropertiesourbrandModel!.data!
      //     .where((element) => userPropertiesModel!.data!.any((ele) =>
      //         ele.brandId == element.brandId && element.brandId == brandid))
      //     .toList();
      // print(userPropertiesModel);
      print("DataOur");
      if (products!.data!.isEmpty) {
        print("wholeuserPropertiesModel data is empty.");
        // print(userPropertiesourbrandModel!.data![0].name);
      } else {
        print(products.data);
      }
      print(products.data![0].name);

      propertyLoaded = true;
      update();
    } catch (e) {
      print('Error: $e');
     // Get.snackbar(
      //   'Error',
      //   'An error occurred: $e',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.red,
      //   colorText: Colors.white,
      // );
    }
    showLoading = false;
    update();
    double max = 9999999999;
    double min = 0;
    try{
    max = double.parse(maxPriceController.text.trim());
    min = double.parse(minPriceController.text.trim());
    } catch (e) {

    }

     filteredProducts = applyFilters(
      selectedBrands: selectBrandFilterList.isEmpty ? null : selectBrandFilterList,
      selectedVegOptions: selectVegFilterList.map((e) => e== "veg" ? 0 : 1).toList().isEmpty ? null : selectVegFilterList.map((e) => e== "veg" ? 1 : 0).toList(),
     productType: selectProductTypeFilterList.isEmpty? null: selectProductTypeFilterList,
      lifeStage: selectLifeStageFilterList.isEmpty ? null : selectLifeStageFilterList,
      products: products,
      maxPrice: max,
      minPrice: min,
      selectedCategories: selectCategoryFilterList.isEmpty ? null : selectCategoryFilterList,
      // productType: ["dry-dog-food", "greavy-dog-food"],
      breed: selectBreedFilterList.isEmpty ? null : selectBreedFilterList,
      healthCondition: selectHealthConditionFilterList.isEmpty ? null : selectHealthConditionFilterList,
      // specialDiet: ["low-gain", "gain-free"],
    );
    update();
    print("All Data: ${products.data!.map((e) => e.brandId).toList()}");
    print("Filtered Products:");
    print("Data: $filteredProducts");
     print("selecedpice: $max");
    print("seleced selectBrandFilterList: $selectBrandFilterList");
    print("seleced selectProducttypeFilterList: $selectProductTypeFilterList");
    print("seleced selectVegFilterList: ${selectVegFilterList.map((e) => e== "veg" ? 0 : 1).toList()}");
    print("seleced selectLifeStageFilterList: $selectLifeStageFilterList");
    print("seleced selectBreedFilterList: $selectBreedFilterList");
    print("seleced selectHealthConditionFilterList: $selectHealthConditionFilterList");
    filteredProducts.forEach((product) {
      int index = filteredProducts.indexOf(product) + 1;
      print("$index: Name: ${product.name}");
      printAdditionalInfo(product);
      print(""); // Add an empty line for separation
    });
    products.data =  filteredProducts;
    oubranddetailswholeController.updateData(products);
    showLoading = false;
    update();
  }
 final OurBrandDetailsWholeController oubranddetailswholeController =
      Get.put(OurBrandDetailsWholeController());
  void printAdditionalInfo(filterMod.Datum product) {
    print("   Brand: ${product.brandId}");
    print("   Veg: ${product.veg}");
    print("   Price: ${product.price}");
    print("   Life Stage: ${product.lifeStageId}");
        print("  Category: ${product.categoryIds}");
    print("   Product Type: ${product.subCategory}");
    print("   Breed: ${product.petsbreedsId}");
    print("   Health Condition: ${product.helthConditionId}");
    // print("   Special Diet: ${product['special-diet']}");
  }

  List<filterMod.Datum> applyFilters({
    List<String>? selectedBrands,
    List<String>? lifeStage,
    List<String>? productType,
    List<String>? breed,
    List<String>? healthCondition,
    List<String>? specialDiet,
    List<int>? selectedVegOptions,
    List<String>? selectedCategories,
    double? minPrice,
    double? maxPrice,
    required UserPropertiesModel products,
  }) {
    return products.data!.where((product) {
      bool brandFilter = 
          selectedBrands == null  || selectedBrands.contains(product.brandId);
      bool vegFilter = selectedVegOptions == null  ||
          selectedVegOptions.contains(product.veg);
      bool maxPriceFilter = maxPrice == null || double.parse(product.price ?? "0") <= maxPrice;
      bool minPriceFilter = minPrice == null || double.parse(product.price ?? "0") > minPrice;
      bool lifeStageFilter =
          lifeStage == null  || lifeStage.contains(product.lifeStageId);
      bool breedFilter = breed == null  || breed.contains(product.petsbreedsId);
      bool healthConditionFilter = healthCondition == null  ||
          healthCondition.contains(product.helthConditionId);
          
      bool selectedCategoriesFilter = selectedCategories == null  ||
          selectedCategories.contains(product.categoryIds);

          bool selectedProductTypeFilter = productType == null || productType.contains(product.subCategory);
      // bool specialDietFilter = 
      //     specialDiet == null || specialDiet.contains(product["special-diet"]);
      // print( "$brandFilter $vegFilter $maxPriceFilter $minPriceFilter $lifeStageFilter $breedFilter $selectedCategoriesFilter ");
      return brandFilter &&
          vegFilter &&
          selectedProductTypeFilter &&
          maxPriceFilter &&
          minPriceFilter &&
          lifeStageFilter &&
          breedFilter &&
          healthConditionFilter 
          && selectedCategoriesFilter
          && product.moduleId == 1
          // &&
          // specialDietFilter
          ;
    }).toList();
  }
}
