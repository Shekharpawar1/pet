import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/models/wholesalerModel/wholeWishListModel.dart';

import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

class WholefavouriteController extends GetxController {
  final storage = GetStorage();
  var wholesalerID;
    List<dynamic> Wishlistt =[];
// List wishlist = [
//       {
//       "image": "assets/image/food3.png",
//       "title": "Mars Petcare Inc",
//       "subtitle": "Lorem Ipsum is simply dummy",
//       "price": "₹ 260.00",
//       "discount":"10%",
//       "totalprice":"₹ 240.00",
//     },
//     {
//      "image": "assets/image/food3.png",
//       "title": "Mars Petcare Inc",
//       "subtitle": "Lorem Ipsum is simply dummy",
//       "price": "₹ 260.00",
//       "discount":"10%",
//       "totalprice":"₹ 240.00",
//     },
//     {
//       "image": "assets/image/food3.png",
//       "title": "Mars Petcare Inc",
//       "subtitle": "Lorem Ipsum is simply dummy",
//        "price": "₹ 260.00",
//       "discount":"10%",
//       "totalprice":"₹ 240.00",
//     },
//     {
//        "image": "assets/image/food3.png",
//       "title": "Mars Petcare Inc",
//       "subtitle": "Lorem Ipsum is simply dummy",
//       "price": "₹ 260.00",
//       "discount":"10%",
//       "totalprice":"₹ 240.00",
//     }
//   ].obs;
//  get getwishList => wishlist;
  bool showLoading = false;
  WishListModel? wishList;
  String getWishListUrl = Constants.USER_GET_WISHLIST;
  List wishListItemsId = GetStorage().read('wishListItems') ?? [];
@override
  void onInit() {
    super.onInit();
    init();
    wholesalerID = storage.read('wholesalerid');
  }
  Future<void> init() async {
    showLoading = true;
    update();
    try {
      // categories
      wishList =
          WishListModel.fromJson(await ApiHelper.getApi(getWishListUrl + "/${storage.read('wholesalerid')}"));
      print(getWishListUrl + "/${storage.read('wholesalerid')}");
     
 wishList!.data = wishList!.data!.where((element) => element.storeId!.isNotEmpty).toList();
    
    print("wishhhjj");
   print(Wishlistt);
      // Wishlistt  = wishList!.data!.map((element) => element.storeId!.isNotEmpty).toList();
      GetStorage().write('wishListItems',
          wishList!.data!.map((e) => e.itemId).toList().toSet().toList());
      // categoryLoaded = true;
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

  Future<void> removeItemFromWishList(int productId) async {
    showLoading = true;
    update();
    print("Removing item");
    try {
      // remove from wishlist
      // servicesCategoryModel =
      //     ServicesCategoryModel.fromJson(await ApiHelper.getApi(url));
      // print(servicesCategoryModel);
      // servicesCategoryLoaded = true;
      String url = Constants.USER_REMOVE_FROM_FAV;
      
      await ApiHelper.deleteByUrl(url: url + "$productId" + "/${storage.read('wholesalerid')}");
      wishListItemsId.removeWhere((e) => e.toString() == productId.toString());
      wishList!.data!.removeWhere(
          (element) => element.itemId.toString() == productId.toString());
      GetStorage().write('wishListItems', wishListItemsId.toSet().toList());
      update();
      Get.snackbar(
        'Success',
        'Item Removed',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
    } catch (e) {
      if (e.toString() == "Error: Not Found") {
        wishListItemsId
            .removeWhere((e) => e.toString() == productId.toString());
        wishList!.data!.removeWhere(
            (element) => element.itemId.toString() == productId.toString());
        GetStorage().write('wishListItems', wishListItemsId.toSet().toList());
        Get.snackbar(
          'Item Not Found',
          'Item does not exist',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange,
          colorText: Colors.white,
        );
      } else {
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
    showLoading = false;
    update();
  }
}
