import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/models/usersModel/getUserPropertiesModel.dart';
import 'package:pet/models/usersModel/subModel.dart';
import 'package:pet/models/usersModel/userProductModel.dart';
import 'package:pet/screens/user/allcategory.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

class SubCategoryController extends GetxController{

 int? selectedIndex;
int? categoryids ;
int? subid;
int? id;

@override
  void onInit() {
    super.onInit();

    init();
   
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
  SubModel? usersubmodel;
    // UserPropertiesModel? userPropertiesModelorignal;
  bool propertysubloaded = false;

 String getUserproductUrl =
      '${Constants.GET_USER_SUBPRODUCT}';
  ProductModel? userProductModel;
    // UserPropertiesModel? userPropertiesModelorignal;
  bool productLoaded = false;

  


  void init() async {


     try {

         usersubmodel = SubModel.fromJson(
          await ApiHelper.getApi(getUserSubCategoryUrl));
      print(usersubmodel);
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

     





//       // pets
//       userProductModel = ProductModel.fromJson(
//           await ApiHelper.getApi(getUserPropertiesUrl));
//         //  userProductModel = userPropertiesModel;
         
//         //  var foo = userPropertiesModelorignal!.data!.where((element) => (element.categoryId == categoryids)  ).toList();
// // bool foo =  userPropertiesModelorignal!.data!

// //     .every((element) => element.categoryId == selectedIndex);
//     //      print("wwww");
//     //      print(foo);
         
//     //  update();
//     //  userPropertiesModelorignal!.data!.forEach((element) {print(element.categoryId);});
// //     if ( foo) {
// //   print("All category ids are equal to $selectedIndex");
// // } else {
// //   print("Not all category ids are equal to $selectedIndex");
// // }
    
//     //  print(userPropertiesModel);


     
//       // print(userPropertiesModel);
//       propertyLoaded = true;
//       update();
//     } catch (e) {
//       print('Error: $e');
//       Get.snackbar(
//         'Error',
//         'An error occurred: $e',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
    }
  
void productinit() async{

  
     try {

         userProductModel = ProductModel.fromJson(
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
}

} 