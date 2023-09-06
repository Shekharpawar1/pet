import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/models/usersModel/getUserCategoriesModel.dart';
import 'package:pet/models/usersModel/getUserPropertiesModel.dart';
import 'package:pet/models/wholesalerModel/ProductDetailsWholeModel.dart';
import 'package:pet/models/wholesalerModel/ProductDetailsWholeModel.dart'as variantFile;

import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

class WholeProductDetailsController extends GetxController {
   final storage = GetStorage();

  int? selecttab;
  bool isAdding = false;
  int? productID;
  var wholesalerID;
double? totalAmount;
  bool showLoading = false;
// ProductDetailsModel? productdetailsmodel;
// var selectedVariants ;

  void onInit() {
    super.onInit();
    // init();
    wholesalerID = storage.read('wholesalerid');
  }



  variantFile.Variations? selectedvariants;

  Future<void> updateVariants(variantFile.Variations variants) async {
    selectedvariants = variants;

    showLoading = true;
    update();
    print("variants${selectedvariants!.price}");
// clearFields();
  }

  // var cartItems = <CartItemModel>[];
  int kg = 1;

  var sizecount = 1;
  String? dropdownsize;
  // List<String> sizeDropDownList = ["1kg", "2kg","3kg","4kg","5kg"];

  void clearFields() {
    selectedvariants = null;
    print("Data cleared...");
    update();
  }
  // void setSelectedVariant(String variant) {
  //   dropdownsize = variant;
  // }

// updateSize(String? selectTab){
//   dropdownsize = selectTab;
//   update();
// }

  void incrementSize() {
    sizecount++;
    update();
  }

  decrementSize() {
    if (sizecount > productdetailwholemodel!.data!.minOrder!.toInt()) {
      sizecount--;
      update();
    }
  }

  int? id;

//  calculateTotalPrice() {
//    String originalPrice = productdetailmodel!.data!.price.toString();
//    d discountPercentage = (productdetailmodel!.data!.discount)/ 100;
//    discountedPrice = originalPrice * (1 - discountPercentage);

//   return discountedPrice * sizecount;
// }
  updateSelectTab(int? selectTab) {
    selecttab = selectTab;
    update();
  }

//  bool isAdding = false;



  List<variantFile.Variations>? variantslist;

  void addproduct() {
    isAdding = true;
    update();
  }

  void userproductView() {
    isAdding = false;
    update();
  }

  void viewproduct(int id) {
    productID = id;
    update();
    print("productID${productID}");
  }

  void  allamount(){
      totalAmount = ((selectedvariants?.price ?? 0) * (sizecount ?? 0) -
              (((selectedvariants?.price ?? 0) * sizecount ?? 0) *
                  (productdetailwholemodel!.data!.discount!) /
                  100))
          ;
          // print("-------"+totalAmount);
  }

  // void addToCart(String brandname, String variant, String size) {
  //   final cartItem = CartItemModel(
  //     product: brandname,
  //     variant: variant,
  //     size: size,
  //   );
  //   cartItems.add(cartItem);
  //   // Reset selections after adding to cart
  //   selectedVariants.clear();
  //   // dropdownsize = null;
  //   sizecount = 0;
  //   update();
  // }

// void addVariant( variant) {
//     selectedVariants = variant;
//     print("vriants${selectedVariants}");
//   }
  //   void removeVariant(int index) {
  //   selectedVariants.remove(index);
  // }

  //   get totalCost {
  //   var total = 0.0;
  //   selectedVariants.forEach((key, value) {
  //     final product = productList.firstWhere((e) => e == key);
  //     final price = double.parse(productList.price.toString());
  //     total += price;
  //   });
  //   return total;
  // }
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

  // productdetails
  String getUserProductDetailsUrl = '${Constants.GET_USER_PRODUCTDETAILS}';
  ProductDetailsWholeModel? productdetailwholemodel;
  bool productdetailLoaded = false;

  Future<void> init() async {
    try {
      // productdeatils
      productdetailwholemodel = ProductDetailsWholeModel.fromJson(
          await ApiHelper.getApi(getUserProductDetailsUrl + "$productID"));
      print("urlapi");
      variantslist = productdetailwholemodel!.data!.variations;
        // variantslist = productdetailmodel!.data!.variations;
      if(variantslist!.isNotEmpty)
      updateVariants(variantslist![0]);
      // var totalprice = 0;
// var pricecount = productdetailmodel!.data!.price;
// for(var i = 0; i< pricecount; i++){
// totalprice +=  ;

// }

// print('Total Price: $totalprice');

      print(getUserProductDetailsUrl + "$productID");
      productdetailLoaded = true;
      sizecount = productdetailwholemodel!.data!.minOrder!.toInt();
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

// List<variantFile.Variations> variants = productdetailmodel!.data!.variants

  Future<void> addProduct() async {
    showLoading = true;
    update();
    // await Future.delayed(Duration(seconds: 4));
    var body = {
      "user_id": storage.read('wholesalerid').toString(),
      "item_id": productID.toString(),
      "item_name": productdetailwholemodel!.data!.name.toString(),
      "variant": selectedvariants!.type.toString(),
      "quantity": (sizecount ?? 0).toString(),
      "image": productdetailwholemodel!.data!.image ?? '',
      "price": ((selectedvariants?.price ?? 0) * (sizecount ?? 0) -
              (((selectedvariants?.price ?? 0) * sizecount ?? 0) *
                  (productdetailwholemodel!.data!.discount!) /
                  100))
          .toString(),
      // ((     (productdetailmodel!.data!.price)! * (productdetailmodel!.data!.discount!)/100)*sizecount*(selectedvariants!.price??0)).toString(),
    };
    String AddProduct = Constants.ADD_PRODUCT;
    print(body);
    try {
      var request = http.MultipartRequest('POST', Uri.parse(AddProduct));
      request.fields.addAll({
        "user_id": storage.read('wholesalerid').toString(),
        "item_id": productID.toString(),
        "item_name": productdetailwholemodel!.data!.name.toString(),
        "variant": selectedvariants!.type.toString(),
        "quantity": (sizecount ?? 0).toString(),
        "image": productdetailwholemodel!.data!.image ?? '',
        "price": ((selectedvariants?.price ?? 0) * (sizecount ?? 0) -
                (((selectedvariants?.price ?? 0) * sizecount ?? 0) *
                    (productdetailwholemodel!.data!.discount!) /
                    100))
            .toString(),
      });

      await ApiHelper.postFormData(request: request);
      update();
      Get.back();
      Get.snackbar(
        'Success',
        'Product Added',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
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

  // var productList = ProductDetailsModel(

  //     id: 1,
  //     brandname: 'Product 1',
  //     flavour: "Chicken",
  //     price: 500,
  //     agerange: "Adult",
  //     diettype: "Non Vegetarian",
  //     itemfram: "Pellet",
  //     discount: 5,
  //     targetspace: "Dog",
  //     variants: ['1kg', '2kg', '5kg'],
  // );
}