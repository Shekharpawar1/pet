import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/models/salesmanModel/ourBrandModel.dart';
import 'package:pet/models/usersModel/bannerModel.dart';
import 'package:pet/models/usersModel/getUserCategoriesModel.dart';
import 'package:pet/models/usersModel/getUserPropertiesModel.dart';
import 'package:pet/models/usersModel/ourBrandModel.dart';
import 'package:pet/models/usersModel/servicesCategoriesModel.dart';
import 'package:pet/models/usersModel/userProductByPartnerModel.dart';
import 'package:pet/models/usersModel/userWishListModel.dart';
import 'package:pet/screens/user/allcategory.dart';

import 'package:video_player/video_player.dart';
import 'package:pet/models/usersModel/servicesModel.dart';
import 'package:http/http.dart' as http;
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

class HomeuserController extends GetxController {
  var userId = GetStorage().read("id");
  late VideoPlayerController videoController;
  bool showLoading = false;
  //videoplayer
  updatevideo() {
    videoController = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize();
    update();
  }

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

 // ProductByPartner
  String getProductByPartnerUrl = '${Constants.GET_PRODUCTBYPARTNER}';
  UserProductByPartnerModel? userProductPartnerModel;
  bool partnerLoaded = false;
  
  // wishlist list
  WishListModel? wishList;
  String getWishListUrl = Constants.USER_GET_WISHLIST;
  List wishListItemsId = GetStorage().read('wishListItems') ?? [];

  // List wishListItemsId = GetStorage().read('wishListItems') ?? [];

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

  void getWishList() {
    wishListItemsId = GetStorage().read('wishListItems') ?? [];
    update();
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
      try {
      // ProductByPartner
      userProductPartnerModel = UserProductByPartnerModel.fromJson(
          await ApiHelper.getApi(getProductByPartnerUrl));
      print(userProductPartnerModel);
      partnerLoaded = true;
      
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
      // categories
      wishList =
          WishListModel.fromJson(await ApiHelper.getApi(getWishListUrl + "/1"));
      // print(wishList);
      // wishList!.data!.map((e) => e.itemId).toList();
      GetStorage().write('wishListItems',
          wishList!.data!.map((e) => e.itemId).toList().toSet().toList());
      // categoryLoaded = true;
      update();
      print("${GetStorage().read('wishListItems')}");
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

  // our services
  // String getServicesUrl = '${Constants.GET_USER_SERVICES}';
  ServicesCategoryModel? servicesCategoryModel;
  bool servicesCategoryLoaded = false;
 
  Future<void> getServicesCategories(String url) async {
    showLoading = true;
    update();
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

    showLoading = false;
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
  final storage = GetStorage();

  Future<void> addItemToWishList(int productId) async {
    showLoading = true;
    update();
    // await Future.delayed(Duration(seconds: 4));
    Map<String, String> body = {
      // "dates": DateFormat('dd-MM-yyyy').format(selectedDate).toString(),
      // "slot": timeSlots.map((e) => e.time).toList(),
      // "slot": selectedSlot!.time.toString(),
      // "name": nameController.text.trim().toString(),
      // "email": emailController.text.trim().toString(),
      // "pet": selectedPet.toString(),
      // "pet": petId.toString(),
      // "state": selectedState!.stateName.toString(),
      // "city": selectedCity!.cityName.toString(),
      // "address": addressController.text.trim().toString(),
      // "pet_problem": petProblemController.text.trim().toString(),
      // "phone": numberController.text.trim(),
      // "service_id": serviceId.toString(),
      "user_id": storage.read('id').toString(),
      "item_id": productId.toString(),
      // "dates": DateFormat('dd-MM-yyy').format(pickedDate!).toString(),
    };
    String addToWishList = Constants.USER_ADD_TO_FAV;
    print(body);
    try {
      // List documentList = [
      //   {'value': '/C:/Users/PC/Downloads/Rectangle 45 (1).png', 'key': "logo"},
      //   {'value': '/C:/Users/PC/Downloads/Rectangle 45.png', 'key': "profile"},
      // ];
      // var body = {'id': 'value', 'name': 'dhruv'};
      var request = http.MultipartRequest('POST', Uri.parse(addToWishList));
      request.fields.addAll(body);
      // request.files.add(await http.MultipartFile.fromPath(
      //     'image', '/C:/Users/PC/Downloads/Rectangle 45 (1).png'));
      // documentList.forEach((element) async {
      //   request.files.add(await http.MultipartFile.fromPath(
      //       element["key"], element["value"]));
      // });
      await ApiHelper.postFormData(request: request);
      wishListItemsId.add(productId);
      update();
      GetStorage().write('wishListItems', wishListItemsId);

      // clearFields();
      update();
      // Get.back();
      Get.snackbar(
        'Success',
        'Item Added',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      print('Error: $e');
      if (e.toString() == "Error: Already in List") {
        wishListItemsId.add(productId);
        update();
        GetStorage().write('wishListItems', wishListItemsId);
        removeItemFromWishList(productId);
        // Get.snackbar(
        //   'Exists',
        //   'Remove it from WishList Page',
        //   snackPosition: SnackPosition.BOTTOM,
        //   backgroundColor: Colors.orange,
        //   colorText: Colors.white,
        // );
      } else {
        Get.snackbar(
          'Error',
          'An error occurred: $e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
    print(wishListItemsId);
    showLoading = false;
    update();
  }

  Future<void> removeItemFromWishList(int productId) async {
    // var data = await GetStorage().read("userData");
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
      await ApiHelper.deleteByUrl(url: url + "/$productId" + "/${storage.read('id').toString()}");
      wishListItemsId.removeWhere((e) => e.toString() == productId.toString());
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
        GetStorage().write('wishListItems', wishListItemsId.toSet().toList());
        Get.snackbar(
          'Item Not Found',
          'Item does not exist',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Error',
          'An error occurred: $e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }

    showLoading = false;
    update();
  }

}
