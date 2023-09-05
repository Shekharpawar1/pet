

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/models/salesmanModel/ourbrandProductModel.dart';
import 'package:pet/models/salesmanModel/salessubModel.dart';

import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';


class SalesOurBrandDetailsController extends GetxController{
     TextEditingController searchcontroller = TextEditingController();

  int? subid;
  String? brandlogo;
int? brandid;
 int? selectedIndex;

@override
  void onInit() {
    super.onInit();

    init();
   
    }

  void addproduct(int id, String logo) {
    brandid =id;
   brandlogo = logo;
    update();
    print("BrandID${brandid}");
  }
void updateSelectedIndex(int id) {
    selectedIndex = id;
    update();
    print("subindex${selectedIndex}");
  }



//brandsubcategory
 String getUserSubCategoryUrl =
      '${Constants.BASE_URL}${Constants.API_V1_PATH}${Constants.GET_USER_SUBCATEGORY}';
  SalesSubModel? salessubmodel;
    // UserPropertiesModel? userPropertiesModelorignal;
  bool propertysubloaded = false;


//ourbrandproducts

 String getUserproductUrl =
      '${Constants.GET_USER_OURBRANDPRODUCT}';
  SalesOurBrandProductModel? salesourbrandProductModel;
   bool ourbrandproductLoaded = false;
  

  void init() async {


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
      
    }
  

   
void productinit() async{

  
     try {

         salesourbrandProductModel = SalesOurBrandProductModel.fromJson(
          await ApiHelper.getApi(getUserproductUrl+"${brandid}/${selectedIndex}"));
      print('=========**${getUserproductUrl}${brandid}/${selectedIndex}');
      ourbrandproductLoaded = true;
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