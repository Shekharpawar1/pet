import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/models/salesmanModel/bannerModel.dart';
import 'package:pet/models/salesmanModel/getUserCategoriesModel.dart';
import 'package:pet/models/salesmanModel/getUserPropertiesModel.dart';
import 'package:pet/models/salesmanModel/ourBrandModel.dart';
import 'package:pet/models/usersModel/bannerModel.dart';

import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

class HomeSalesController extends GetxController {
  List _cartList = [
    Colors.blue,
    Colors.green,
    Colors.black,
    Colors.purple,
    Colors.blue,
    Colors.green,
    Colors.black,
    Colors.purple,
    Colors.blue,
    Colors.green,
  ].obs;

  List _animalList = [
    {
      "image": "assets/image/dog.png",
      "title": "Dog",
    },
    {
      "image": "assets/image/rabbit.png",
      "title": "Rabbit",
    },
    {
      "image": "assets/image/rat.png",
      "title": "Hamster",
    },
    {
      "image": "assets/image/cat.png",
      "title": "Cat",
    }
  ].obs;

  String getUserCategoriesUrl =
      '${Constants.BASE_URL}${Constants.API_V1_PATH}${Constants.GET_USER_CATEGORIES}';
  SalesCategoriesModel? salesCategoriesModel;
  bool categoryLoaded = false;

  // properties
  String getUserPropertiesUrl =
      '${Constants.BASE_URL}${Constants.API_V1_PATH}${Constants.GET_USER_PROPERTIES}';
  SalesPropertiesModel? salesPropertiesModel;
  bool propertyLoaded = false;

  // banner
  String getBannerUrl = '${Constants.GET_USER_BANNER}';
  SalesBannerModel? salesBannerModel;
  bool bannerLoaded = false;

  // our brand
  String getBrandUrl = '${Constants.GET_OUR_BRAND}';
  SalesOurBrandModel? salesBrandModel;
  bool brandLoaded = false;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init() async {
    try {
      // categories
      salesCategoriesModel = SalesCategoriesModel.fromJson(
          await ApiHelper.getApi(getUserCategoriesUrl));
      print(salesCategoriesModel);
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
      salesPropertiesModel = SalesPropertiesModel.fromJson(
          await ApiHelper.getApi(getUserPropertiesUrl));
      print(salesPropertiesModel);
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
      salesBannerModel =
          SalesBannerModel.fromJson(await ApiHelper.getApi(getBannerUrl));
      print(salesBrandModel);
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
      salesBrandModel =
          SalesOurBrandModel.fromJson(await ApiHelper.getApi(getBrandUrl));
      print(salesBrandModel);
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
  }

  void deleteCartItem(dynamic item) {
    _cartList.remove(item);
    update();
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

  // List _bannerList = [
  //   {
  //     "image": "assets/image/dogiimg1.png",
  //     "title": "Dog cat food",
  //     "subtitle": "Up to 25 % OFF all Products"
  //   },
  //   {
  //     "image": "assets/image/dogiimg1.png",
  //     "title": "Dog cat food",
  //     "subtitle": "Up to 25 % OFF all Products"
  //   },
  //   {
  //     "image": "assets/image/dogiimg1.png",
  //     "title": "Dog cat food",
  //     "subtitle": "Up to 25 % OFF all Products"
  //   },
  // ].obs;
  get getOurBrandList => _ourbandList;
  get getServiceList => _serviceList;
  // get getbannerList => _bannerList;

  get getCartList => _cartList;
  get getAnimalList => _animalList;
}
