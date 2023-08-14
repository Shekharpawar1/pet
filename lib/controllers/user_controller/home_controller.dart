import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/models/salesmanModel/ourBrandModel.dart';
import 'package:pet/models/usersModel/bannerModel.dart';
import 'package:pet/models/usersModel/getUserCategoriesModel.dart';
import 'package:pet/models/usersModel/getUserPropertiesModel.dart';
import 'package:pet/models/usersModel/ourBrandModel.dart';
import 'package:pet/models/usersModel/servicesCategoriesModel.dart';
import 'package:pet/screens/user/allcategory.dart';

import 'package:video_player/video_player.dart';
import 'package:pet/models/usersModel/servicesModel.dart';

import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

class HomeuserController extends GetxController {
  late VideoPlayerController videoController;

 


  // categories
  String getUserCategoriesUrl =
      '${Constants.BASE_URL}${Constants.API_V1_PATH}${Constants.GET_USER_CATEGORIES}';
  UserCategoriesModel? userCategoriesModel;
  bool categoryLoaded = false;
  // properties
  String getUserPropertiesUrl =
      '${Constants.BASE_URL}${Constants.API_V1_PATH}${Constants.GET_USER_PROPERTIES}';
  UserPropertiesModel? userPropertiesModel;
  bool propertyLoaded = false;

  // banner
  String getBannerUrl = '${Constants.GET_USER_BANNER}';
  UserBannerModel? userBannerModel;
  bool bannerLoaded = false;

  // our brand
  String getBrandUrl = '${Constants.GET_OUR_BRAND}';
  UserOurBrandModel? userBrandModel;
  UserOurBrandModel? userOurBrandModel = UserOurBrandModel();
  bool brandLoaded = false;

  // our services
  String getServicesUrl = '${Constants.GET_USER_SERVICES}';
  ServicesModel? userServicesModel;
  bool servicesLoaded = false;

  @override
  void onInit() {
    super.onInit();

    videoController = VideoPlayerController.asset('assets/image/video1.eaf55f566741325a7b40.mp4')
      ..initialize().then((_) {
        // Video is initialized
         videoController.play(); 
        update();
      });
    init();
  }


  @override
  void onClose() {
    videoController.dispose();
    super.onClose();
  }

  
  void init() async {
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
      // pets
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
      userBannerModel =
          UserBannerModel.fromJson(await ApiHelper.getApi(getBannerUrl));
      print(userBannerModel);
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
    try {
      // our brands
      userBrandModel =
          UserOurBrandModel.fromJson(await ApiHelper.getApi(getBrandUrl));
      // userOurBrandModel = userBrandModel;
      // userOurBrandModel!.data = [];
      // userBrandModel!.data!.forEach((e) {
      //   if (e.canine == 1) {
      //     userOurBrandModel!.data!.add(e);
      //   }
      // });
      print(
          "CAnine products ===>>>> ${userBrandModel!.data!.where((element) => element.canine == 1).toList()}");
      brandLoaded = true;
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
      // our services
      userServicesModel =
          ServicesModel.fromJson(await ApiHelper.getApi(getServicesUrl));
      print(userServicesModel);
      servicesLoaded = true;
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

  // our services
  // String getServicesUrl = '${Constants.GET_USER_SERVICES}';
  ServicesCategoryModel? servicesCategoryModel;
  bool servicesCategoryLoaded = false;
 
  Future<void> getServicesCategories(String url) async {
    try {
      // our services
      servicesCategoryModel =
          ServicesCategoryModel.fromJson(await ApiHelper.getApi(url));
      print(servicesCategoryModel);
      servicesCategoryLoaded = true;
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

  List _ourbandList = [
    {
      "image": "assets/image/ourdogimg.png",
      "title": "Reservation",
      "logo": "assets/image/dog9.png"
    },
    {
      "image": "assets/image/ourdogimg.png",
      "title": "Reservation",
      "logo": "assets/image/foodicon.png"
    },
    {
      "image": "assets/image/ourdogimg.png",
      "title": "Reservation",
      "logo": "assets/image/dog9.png"
    },
  ].obs;

  List toylist = [
    {
      "image": "assets/image/food.png",
      "title": "Dog cat food",
      "subtitle": "Up to 25 % OFF all Products"
    },
    {
      "image": "assets/image/food.png",
      "title": "Dog cat food",
      "subtitle": "Up to 25 % OFF all Products"
    },
    {
      "image": "assets/image/food.png",
      "title": "Dog cat food",
      "subtitle": "Up to 25 % OFF all Products"
    },
  ].obs;

  // List _serviceList = [
  //   {
  //     "image": "assets/image/ourdogimg.png",
  //     "title": "Brush",
  //   },
  //   {
  //     "image": "assets/image/ourdogimg.png",
  //     "title": "Nail Cuttter",
  //   },
  //   {
  //     "image": "assets/image/ourdogimg.png",
  //     "title": "comb",
  //   },
  //   {
  //     "image": "assets/image/ourdogimg.png",
  //     "title": "Slicker",
  //   },
  // ].obs;
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
  // get getServiceList => _serviceList;
  get gettoyList => toylist;
}
