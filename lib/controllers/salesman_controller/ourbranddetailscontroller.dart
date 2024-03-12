import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/models/usersModel/getUserPropertiesModel.dart';
import 'package:pet/models/usersModel/ourbrandProductModel.dart';
import 'package:pet/models/usersModel/subModel.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

class SalesOurBrandDetailsWholeController extends GetxController {
  TextEditingController searchcontroller = TextEditingController();

  int? subid;
  String? brandlogo;
  int? brandid;
  String? brandname;
  int? selectedIndex;
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

  void updateSelectedIndex(int id) {
    selectedIndex = id;
    update();
    print("subindex${selectedIndex}");
  }

//brandsubcategory
  String getUserSubCategoryUrl =
      '${Constants.BASE_URL}${Constants.API_V1_PATH}${Constants.GET_USER_SUBCATEGORY}';
  SubModel? usersubmodel;
  // UserPropertiesModel? userPropertiesModelorignal;
  bool propertysubloaded = false;

//ourbrandproducts

  String getUserproductUrl = '${Constants.GET_USER_OURBRANDPRODUCT}';
  OurBrandProductModel? userourbrandProductModel;
  bool ourbrandproductLoaded = false;

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
  }

  // void productinit() async {
  //   try {
  //     userourbrandProductModel = OurBrandProductModel.fromJson(
  //         await ApiHelper.getApi(
  //             getUserproductUrl + "${brandid}/${selectedIndex}"));
  //     print('=========**${getUserproductUrl}${brandid}/${selectedIndex}');
  //     ourbrandproductLoaded = true;
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
  // }

  String getUserPropertiesUrl =
      '${Constants.BASE_URL}${Constants.API_V1_PATH}${Constants.GET_USER_PROPERTIES}';
  UserPropertiesModel? userPropertiesModel;
  UserPropertiesModel userPropertiesourbrandModel = UserPropertiesModel();
  // UserPropertiesModel? orignoluserPropertiesModel;
  bool propertyLoaded = false;

  Future<void> ourproductinit() async {
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
  // print(userPropertiesModel!.data![0].name);
  userPropertiesModel!.data = userPropertiesModel!.data!
          .where((ele) => ele.brandId == brandname)
          .toList();
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


}
