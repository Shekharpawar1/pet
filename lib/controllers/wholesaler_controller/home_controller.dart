import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/models/usersModel/getUserCategoriesModel.dart';
import 'package:pet/models/usersModel/getUserPropertiesModel.dart';
import 'package:pet/models/wholesalerModel/bannerModel.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

class WholeHomeController extends GetxController {
  // categories
  String getUserCategoriesUrl =
      '${Constants.BASE_URL}${Constants.API_V1_PATH}${Constants.GET_USER_CATEGORIES}';
  UserCategoriesModel? userCategoriesModel;
  bool categoryLoaded = false;
bool showLoading = false;
  // properties
  String getUserPropertiesUrl =
      '${Constants.BASE_URL}${Constants.API_V1_PATH}${Constants.GET_USER_PROPERTIES}';
  UserPropertiesModel? userPropertiesModel;
  bool propertyLoaded = false;

//banner
  String getBannerUrl = '${Constants.GET_USER_BANNER}';
  WholeBannerModel? wholeBannerModel;
  bool bannerLoaded = false;

  @override
  void onInit() {
    super.onInit();
    init();
  }


  void init() async {
      showLoading = true;
    update();
    try {
      // categories
      userCategoriesModel = UserCategoriesModel.fromJson(
          await ApiHelper.getApi(getUserCategoriesUrl));
      print(userCategoriesModel);
      categoryLoaded = true;
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
    try {
      // properties
      userPropertiesModel = UserPropertiesModel.fromJson(
          await ApiHelper.getApi(getUserPropertiesUrl));
      print(userPropertiesModel);
      propertyLoaded = true;
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
    try {
      // banners
      wholeBannerModel =
          WholeBannerModel.fromJson(await ApiHelper.getApi(getBannerUrl));
      print(wholeBannerModel);
      bannerLoaded = true;
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

// List   _bannerList = [
//     {
//       "image": "assets/image/dogiimg1.png",
//       "title": "Dog cat food",
//       "subtitle":"Up to 25 % OFF all Products"
//     },
//     {
//       "image": "assets/image/dogiimg1.png",
//    "title": "Dog cat food",
//       "subtitle":"Up to 25 % OFF all Products"
//     },
//     {
//       "image": "assets/image/dogiimg1.png",
//        "title": "Dog cat food",
//       "subtitle":"Up to 25 % OFF all Products"
//     },
    
//   ].obs;
  
  
  List _ourbandList = [
    {
      "image": "assets/image/ourdogimg.png",
      "title": "Reservation",
      "logo":"assets/image/dog9.png"
    },
    {
      "image": "assets/image/ourdogimg.png",
      "title": "Reservation",
      "logo":"assets/image/foodicon.png"
    },
    {
      "image": "assets/image/ourdogimg.png",
      "title": "Reservation",
      "logo":"assets/image/dog9.png"
    },
    
  ].obs;


 List _serviceList = [
    {
      "image": "assets/image/ourdogimg.png",
      "title": "Brush",
    
    },
    {
      "image": "assets/image/ourdogimg.png",
      "title": "Nail Cuttter",
     
    },
    {
      "image": "assets/image/ourdogimg.png",
      "title": "comb",
     
    },
    {
      "image": "assets/image/ourdogimg.png",
      "title": "Slicker",
     
    },
    
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
   get getOurBrandList => _ourbandList;
   get getServiceList => _serviceList;
    // get getbannerList => _bannerList;
}
