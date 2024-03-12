import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/models/usersModel/getUserPropertiesModel.dart';
import 'package:pet/models/usersModel/subModel.dart';
import 'package:pet/models/usersModel/toysModel.dart';
import 'package:pet/models/usersModel/userProductModel.dart';
import 'package:pet/screens/user/allcategory.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

class SubCategoryController extends GetxController {
  int? selectedIndex;
  int? categoryids;
  int? subid;
  int? id;
 List<dynamic>? itemlist ;
 List<Items> combinedList = [];
  List listOfLists = [];
  @override
  void onInit() {
    super.onInit();

    init();
    producttoys();
  }

  void addproduct(int id) {
    categoryids = id;
    update();
    print("cat${categoryids}");
  }

  String selectedCategory = "";
  void currentCategory(String category) {
    selectedCategory = category;
    update();
    print("cat ${selectedCategory}");
  }

  //   void addsubcategory(int id) {
  //   subid =id;
  //   update();
  // }

  void updateSelectedIndex(int id) {
    selectedIndex = id;
    update();
    print("subindex${selectedIndex}");
  }

  String getUserSubCategoryUrl =
      '${Constants.BASE_URL}${Constants.API_V1_PATH}${Constants.GET_USER_SUBCATEGORY}';
  SubModel? usersubmodel;
  // UserPropertiesModel? userPropertiesModelorignal;
  bool propertysubloaded = false;

  String getUserproductUrl = '${Constants.GET_USER_SUBPRODUCT}';
  ProductModel? userProductModel;
  // UserPropertiesModel? userPropertiesModelorignal;
  bool productLoaded = false;

  void init() async {
    try {
      usersubmodel =
          SubModel.fromJson(await ApiHelper.getApi(getUserSubCategoryUrl));
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
  }

  void productinit() async {
    try {
      userProductModel = ProductModel.fromJson(await ApiHelper.getApi(
          getUserproductUrl + "${categoryids}/${selectedIndex}"));
      print('=========**${getUserproductUrl}${categoryids}/${selectedIndex}');
      productLoaded = true;
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

  Future<void> productInitByCategory() async {
    try {
      userProductModel = ProductModel.fromJson(await ApiHelper.getApi(
          "http://caninedemo.caninetest.xyz/api/v1/items/latest"));
      print('=========**${getUserproductUrl}${categoryids}/${selectedIndex}');
      print('===============>>>>>>> Category $selectedCategory');

      print(
          "===============>>>>>>> Old List ${userProductModel!.data!.map((element) => element.categoryIds).toList()}");
      userProductModel!.data = userProductModel!.data!
          .where((element) => element.categoryIds == selectedCategory)
          .toList();
      print("===============>>>>>>> New List ${userProductModel!.data!}");
      productLoaded = true;
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

  List filteredItems = [];
  String getUsertoyUrl = '${Constants.GET_USER_TOY}';
  ToyModel? usertoyModel;
  // UserPropertiesModel? userPropertiesModelorignal;
  bool toyloaded = false;
  void producttoys() async {
    try {
      usertoyModel = ToyModel.fromJson(await ApiHelper.getApi(
          getUsertoyUrl ));



      //  usertoyModel!.data  =  usertoyModel!.data!.where((element) => element.items!.isNotEmpty).toList();
      // print("Toysss**");

      

   filteredItems = usertoyModel!.data!
        .where((element) => element.subCategory!.id ==  element.subCategory!.id)
        .map((element) => element.items)
        .toList();

    // Use a Set to store distinct items
    Set<Items> combinedSet = {};
    
    // Add all items from the filtered list to the set
    for (var itemList in filteredItems) {
      combinedSet.addAll(itemList);
    }

    // Convert the set to a list (removing duplicates)
    combinedList = combinedSet.toList();

    print(combinedList.length);
    
      print(usertoyModel!.data! .length);
            print(
          'TOYYYY=========>>${getUsertoyUrl}');
      toyloaded = true;
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
}
