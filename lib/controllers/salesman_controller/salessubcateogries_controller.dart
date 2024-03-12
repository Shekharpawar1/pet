import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/models/salesmanModel/salesProductModel.dart';
import 'package:pet/models/salesmanModel/salessubModel.dart';
import 'package:pet/models/salesmanModel/salestoysModel.dart';

import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

class SalesSubCategoryController extends GetxController{
   bool showLoading = false;
 int? selectedIndex;
int? categoryids;
int? subid;
int? id;

 List<Items> combinedList = [];
  List listOfLists = [];
@override
  void onInit() {
    super.onInit();

    init();
    
    producttoys();
   
    }

  void addproduct(int id) {
    categoryids =id;
    update();
    print("cat${categoryids}");
  }



   void updateSelectedIndex(int id) {
    selectedIndex = id;
    update();
    print("subindex${selectedIndex}");
  }


 String getUserSubCategoryUrl =
      '${Constants.BASE_URL}${Constants.API_V1_PATH}${Constants.GET_USER_SUBCATEGORY}';
  SalesSubModel? salessubmodel;
    // UserPropertiesModel? userPropertiesModelorignal;
  bool propertysubloaded = false;

 String getUserproductUrl =
      '${Constants.GET_USER_SUBPRODUCT}';
  SalesProductModel? salesProductModel;
  bool productLoaded = false;



  String selectedCategory = "";
  void currentCategory(String category) {
    selectedCategory = category;
    update();
    print("cat ${selectedCategory}");
  }



  Future<void> init() async  {
 showLoading = true;
    update();

     try {

         salessubmodel = SalesSubModel.fromJson(
          await ApiHelper.getApi(getUserSubCategoryUrl));
      print(salessubmodel);
      propertysubloaded = true;
      update();
    } catch (e) {
      print('Error: $e');
     

      }
      
        showLoading = false;
    update();

    }
  
void productinit() async{

   showLoading = true;
    update();
     try {

         salesProductModel = SalesProductModel.fromJson(
          await ApiHelper.getApi(getUserproductUrl+"${categoryids}/${selectedIndex}"));
      print('=========**${getUserproductUrl}${categoryids}/${selectedIndex}');
      productLoaded = true;
      update();
    } catch (e) {
      print('Error: $e');
   
  }
     showLoading = false;
    update();
}



  Future<void> productInitByCategory() async {
    try {
      salesProductModel = SalesProductModel.fromJson(await ApiHelper.getApi(
          "http://caninedemo.caninetest.xyz/api/v1/items/latest"));
      print('=========**${getUserproductUrl}${categoryids}/${selectedIndex}');
      print('===============>>>>>>> Category $selectedCategory');

      print(
          "===============>>>>>>> Old List ${salesProductModel!.data!.map((element) => element.categoryIds).toList()}");
      salesProductModel!.data = salesProductModel!.data!
          .where((element) => element.categoryIds == selectedCategory)
          .toList();
      print("===============>>>>>>> New List ${salesProductModel!.data!}");
      productLoaded = true;
      update();
    } catch (e) {
      print('Error: $e');
  
    }
  }



  List filteredItems = [];
 String getUsertoyUrl =
      '${Constants.GET_USER_TOY}';
  SalesToyModel? salestoyModel;
    // UserPropertiesModel? userPropertiesModelorignal;
  bool toyloaded = false;
// List<dynamic> toyslist =[];
Future<void> producttoys() async{
     try {

        salestoyModel = SalesToyModel.fromJson(await ApiHelper.getApi(
          getUsertoyUrl ));




   filteredItems = salestoyModel!.data!
        .where((element) => element.subCategory!.id ==  element.subCategory!.id)
        .map((element) => element.items)
        .toList();

    Set<Items> combinedSet = {};
    
    // Add all items from the filtered list to the set
    for (var itemList in filteredItems) {
      combinedSet.addAll(itemList);
    }

    // Convert the set to a list (removing duplicates)
    combinedList = combinedSet.toList();

    print(combinedList.length);
print( 'TOYYYYnnn=========>>${filteredItems}');
      print( 'TOYYYY=========>>${getUsertoyUrl}');
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