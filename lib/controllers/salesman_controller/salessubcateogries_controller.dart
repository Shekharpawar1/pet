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
  SalesSubModel? salessubmodel;
    // UserPropertiesModel? userPropertiesModelorignal;
  bool propertysubloaded = false;

 String getUserproductUrl =
      '${Constants.GET_USER_SUBPRODUCT}';
  SalesProductModel? salesProductModel;
    // UserPropertiesModel? userPropertiesModelorignal;
  bool productLoaded = false;



  


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
      Get.snackbar(
        'Error',
        'An error occurred: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );

      }
      //product

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
      Get.snackbar(
        'Error',
        'An error occurred: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
  }
     showLoading = false;
    update();
}





  
 String getUsertoyUrl =
      '${Constants.GET_USER_TOY}';
  SalesToyModel? salestoyModel;
    // UserPropertiesModel? userPropertiesModelorignal;
  bool toyloaded = false;

void producttoys() async{
     try {

         salestoyModel = SalesToyModel.fromJson(
          await ApiHelper.getApi(getUsertoyUrl+"sub_category=6&category1=1&category2=2"));
      print('TOYYYY=========>>${getUsertoyUrl+"sub_category=6&category1=1&category2=2"}');
      toyloaded = true;
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

} 