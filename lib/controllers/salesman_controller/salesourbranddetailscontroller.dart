

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/models/salesmanModel/getUserPropertiesModel.dart';
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
  String? brandname;
 bool showLoading = false;

@override
  void onInit() {
    super.onInit();

    init();
  }

  void addproduct(int id, String brandName,String logo) {
    brandid = id;
    brandname = brandName;
    brandlogo = logo;
    update();
    print("BrandID : ${brandid} Name: ${brandname}");
  }


  // void addproduct(int id, String logo) {
  //   brandid =id;
  //  brandlogo = logo;
  //   update();
  //   print("BrandID${brandid}");
  // }
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


   String getUserProductUrl1='${Constants.GET_USER_OURBRANDPRODUCT1}';
  void init() async {


     try {

        salessubmodel = SalesSubModel.fromJson(
          await ApiHelper.getApi(getUserSubCategoryUrl));
      print(salessubmodel);
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
     // Get.snackbar(
      //   'Error',
      //   'An error occurred: $e',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.red,
      //   colorText: Colors.white,
      // );
  }
}

// properties
  String getUserPropertiesUrl =
      '${Constants.BASE_URL}${Constants.API_V1_PATH}${Constants.GET_USER_PROPERTIES}';
  SalesPropertiesModel? salesPropertiesModel;
  bool propertyLoaded = false;


  Future<void> ourproductinit() async {
    showLoading = true;
    try {
      // ourproducts
      salesPropertiesModel = SalesPropertiesModel.fromJson(
          await ApiHelper.getApi(getUserPropertiesUrl));
      salesPropertiesModel!.data = salesPropertiesModel!.data!
          .where((element) => element.moduleId == 1)
          .toList();
   print("UserDataWhole==>");
   if (salesPropertiesModel!.data!.isNotEmpty) {
  print(salesPropertiesModel!.data![0].name);
} else {
  print("wholesaller data is empty.");
}
  salesPropertiesModel!.data = salesPropertiesModel!.data!
          .where((ele) => ele.brandId == brandname)
          .toList();
     
      print(salesPropertiesModel);
      print("DataOur");
      if (salesPropertiesModel!.data!.isEmpty) {
         print("wholeuserPropertiesModel data is empty.");
  // print(userPropertiesourbrandModel!.data![0].name);
} else {
      print(salesPropertiesModel!.data);
}
      print(salesPropertiesModel!.data![0].name);

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

}