import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/models/usersModel/ProductDetailsModel.dart';
import 'package:pet/models/usersModel/getUserCategoriesModel.dart';
import 'package:pet/models/usersModel/getUserPropertiesModel.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

class ProductDetailsController extends GetxController {
   int? selecttab;
bool isAdding = false;


int kg = 1;

 var sizecount = 0;
  String? dropdownsize;
  List<String> sizeDropDownList = ["1kg", "2kg","3kg","4kg","5kg"];

  
  // void setSelectedVariant(String variant) {
  //   dropdownsize = variant;
  // }
  
updateSize(String? selectTab){
  dropdownsize = selectTab;
  update();
}

void  incrementSize(){
sizecount++;
    update(); 
  }

decrementSize(){
  if (sizecount > 0) {
      sizecount--;
      update(); 
    }

}



updateSelectTab(int? selectTab){
  selecttab = selectTab;
  update();
}

//  bool isAdding = false;
  void addproduct() {
    isAdding = true;
    update();
  }
 void userproductView() {
    isAdding = false;
    update();
  }

  
  // categories
  // String getUserCategoriesUrl =
  //     '${Constants.BASE_URL}${Constants.API_PATH}${Constants.GET_USER_CATEGORIES}';
  // UserCategoriesModel? userCategoriesModel;
  // bool categoryLoaded = false;

  // // properties
  // String getUserPropertiesUrl =
  //     '${Constants.BASE_URL}${Constants.API_PATH}${Constants.GET_USER_PROPERTIES}';
  // UserPropertiesModel? userPropertiesModel;
  // bool propertyLoaded = false;

  // @override
  // void onInit() {
  //   super.onInit();
  //   init();
  // }

  // void init() async {
  //   try {
  //     // categories
  //     userCategoriesModel = UserCategoriesModel.fromJson(
  //         await ApiHelper.getApi(getUserCategoriesUrl));
  //     print(userCategoriesModel);
  //     categoryLoaded = true;
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
  //   try {
  //     // properties
  //     userPropertiesModel = UserPropertiesModel.fromJson(
  //         await ApiHelper.getApi(getUserPropertiesUrl));
  //     print(userPropertiesModel);
  //     propertyLoaded = true;
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

  List _productList = [
    
    ProductDetailsModel(id: 1, brandname: 'Product 1',flavour:"Chicken", price: "500",
   agerange: "Adult",diettype: "Non Vegetarian",itemfram: "Pellet",discountprice: "200",targetspace: "Dog",  variants: ['1kg', '2kg', '5kg']),
  //   {
  //  "id":1,
  //  "price":"500",
  //     "title": "",
  //     },
  //   {
    
  //     "title": "2 kg",
     
  //   },
  //   {
     
  //     "title": "5 kg",
     
  //   },
    
  ].obs;



  // List _productList = [
  //   {
  //     "image": "assets/image/food3.png",
  //     "title": "Mars Petcare Inc",
  //     "subtitle": "Lorem Ipsum is simply dummy",
  //     "price": "₹ 260.00",
  //   },
  //   {
  //     "image": "assets/image/dog2.png",
  //     "title": "Foam Pet Dog Bed",
  //     "subtitle": "Lorem Ipsum is simply dummy",
  //     "price": "₹ 260.00",
  //   },
  //   {
  //     "image": "assets/image/food3.png",
  //     "title": "Mars Petcare Inc",
  //     "subtitle": "Lorem Ipsum is simply dummy",
  //     "price": "₹ 260.00",
  //   },
  //   {
  //     "image": "assets/image/food5.png",
  //     "title": "Mars Petcare Inc",
  //     "subtitle": "Lorem Ipsum is simply dummy",
  //     "price": "₹ 260.00",
  //   }
  // ].obs;
  //  get getOurBrandList => _ourbandList;
   get getproductList => _productList;

   

}