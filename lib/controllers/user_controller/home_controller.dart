import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/controllers/user_controller/addtocartcontroller.dart';
import 'package:pet/controllers/user_controller/notification_controller.dart';
import 'package:pet/models/salesmanModel/ourBrandModel.dart';
import 'package:pet/models/usersModel/bannerModel.dart';
import 'package:pet/models/usersModel/getUserCategoriesModel.dart';
import 'package:pet/models/usersModel/getUserPropertiesModel.dart';
import 'package:pet/models/usersModel/getUserPropertiesModel.dart' as Model;
import 'package:pet/models/usersModel/ourBrandModel.dart';
import 'package:pet/models/usersModel/partnerModel.dart';
import 'package:pet/models/usersModel/servicesCategoriesModel.dart';
import 'package:pet/models/usersModel/userProductByPartnerItemModel.dart';
import 'package:pet/models/usersModel/userProductByPartnerModel.dart';
import 'package:pet/models/usersModel/userWishListModel.dart';
import 'package:pet/screens/user/allcategory.dart';

import 'package:pet/models/usersModel/bannerModel.dart' as Banner;
import 'package:video_player/video_player.dart';
import 'package:pet/models/usersModel/servicesModel.dart';
import 'package:http/http.dart' as http;
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';


class HomeuserController extends GetxController {
  var userId = GetStorage().read("id");
  // late VideoPlayerController videoController; 
    // VideoPlayerController? videoPlayerController;
    late  VideoPlayerController videoController;
  TextEditingController searchcontroller = TextEditingController();
   NotificationController notificationcontroller =
      Get.put(NotificationController());
  MyCartController mycartController = Get.put(MyCartController());
  bool showLoading = false;
var videourl;
  int? itempartnerId;
  int? vendorId;
  
RxString ServiceDescription=''.obs;
  List<Model.Datum> searchScreenData = [];
  void clearSearchData() {
    searchScreenData = [];
    update();
  }

  void searchDataFilter(UserPropertiesModel? dataModel, String keyword) {
    

    List<Model.Datum> filteredData = filter(keyword, dataModel!.data!);
    searchScreenData = filteredData;
    update();
    print("###### KEYWORD:     $keyword");
    // print(filteredData);
    filteredData.forEach((item) {
      print("${filteredData.indexOf(item)})   ${item.id}");
      print("     ${item.name}");
      print("     ${item.description}");
      print("     ${item.subCategory}");
      print("     ${item.categoryIds}");
      print("     ${item.brandId}");
      print("     ${item.lifeStageId}");
      print("     ${item.helthConditionId}");
      print("     ${item.petsbreedsId}");
      print("     ${item.price}");
      print("     ${item.wholePrice}");
    });
  }

  List<Model.Datum> filter(String key, List<Model.Datum> data) {
    Set<Model.Datum> finalData = {};

    final List<String> keywords = key.toLowerCase().split(' ');

    for (var item in data) {
      var itemLower = item.toString().toLowerCase();

      if (keywords.every((keyword) =>
          itemLower.contains(keyword) ||
          item.name.toString().toLowerCase().contains(keyword) ||
          item.description.toString().toLowerCase().contains(keyword) ||
          item.subCategory.toString().toLowerCase().contains(keyword) ||
          item.categoryIds.toString().toLowerCase().contains(keyword) ||
          item.brandId.toString().toLowerCase().contains(keyword) ||
          item.lifeStageId.toString().toLowerCase().contains(keyword) ||
          item.helthConditionId.toString().toLowerCase().contains(keyword) ||
          item.petsbreedsId.toString().toLowerCase().contains(keyword) ||
          item.price.toString().toLowerCase().contains(keyword) ||
          item.wholePrice.toString().toLowerCase().contains(keyword))) {
        finalData.add(item);
      }
    }

    return finalData.toList();
  }


void viewpartner(int id,) {
    itempartnerId = id;
   
    update();
    print("itempartnerId${itempartnerId} ");
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


  // 

  // wishlist list
  WishListModel? wishList;
  String getWishListUrl = Constants.USER_GET_WISHLIST;
  List wishListItemsId = GetStorage().read('wishListItems') ?? [];

 
  
  



  @override
void onInit()  {
    super.onInit();

  var videopath = GetStorage().read('videobanner');


  print("bbmmmmm");
  print(videourl);

 try {
  
// var videourl = "https://canine.hirectjob.in/storage/app/654224036ea93.mp4";
// "${Constants.BASE_URL}/storage/app/${videopath}";
// https://canine.hirectjob.in/storage/app/654224036ea93.mp4
 print("bbmmmmm99  ${videourl}");
  videoController = VideoPlayerController.networkUrl(Uri.parse
   ( "https://canine.hirectjob.in/storage/app/${videopath}")
  )
  ..initialize().then((_) {
    videoController.play();
    update();
      videoController.setLooping(true);
  });
} catch (error) {
  print("Error initializing the video: $error");
} 
partnerIteminit();
  init();
     bannerListinit();
    notificationcontroller.notifyinit();
       mycartController.init();

  }
  
//   Future<void>uploadVideoPlayer() async {
//    try {
//   videoController = VideoPlayerController.networkUrl(Uri.parse
//    ( videourl)
//   )..initialize().then((_) {
//     videoController.play();
//     update();
//       videoController.setLooping(true);
//   });
// } catch (error) {
//   print("Error initializing the video: $error");
// } ;
//   }

  void getWishList() {
    wishListItemsId = GetStorage().read('wishListItems') ?? [];
    print("WIshListItem");
    print(wishListItemsId);
    update();
  }


   
  Future<void> init() async {
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
      // Get.snackbar(
      //   'Error',
      //   'An error occurred: $e',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.red,
      //   colorText: Colors.white,
      // );
    }
   
    try {
      // our brands
      userBrandModel =
          UserOurBrandModel.fromJson(await ApiHelper.getApi(getBrandUrl));
     
      print(
          "CAnine products ===>>>> ${userBrandModel!.data!.where((element) => element.canine == 1).toList()}");
      brandLoaded = true;
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
    try {
      // our services
      userServicesModel =
          ServicesModel.fromJson(await ApiHelper.getApi(getServicesUrl));
      print(userServicesModel);
      servicesLoaded = true;
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
    try {
      // ProductByPartner
      userProductPartnerModel = UserProductByPartnerModel.fromJson(
          await ApiHelper.getApi(getProductByPartnerUrl));
      print(userProductPartnerModel);
      partnerLoaded = true;

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
    try {
      // wishlist
      wishList =
          WishListModel.fromJson(await ApiHelper.getApi(getWishListUrl + "/${GetStorage().read('id')}"));
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

 Future<void> bannerListinit() async {
    
    showLoading = true;
    update();
   try {
      // banners
      userBannerModel =
          UserBannerModel.fromJson(await ApiHelper.getApi(getBannerUrl));
      print(userBannerModel);
      bannerLoaded = true;
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
  Future<void> fetchWishList() async {
    
    showLoading = true;
    update();
    try {
      // wishlist
      wishList =
          WishListModel.fromJson(await ApiHelper.getApi(getWishListUrl + "/${GetStorage().read('id')}"));
      // print(wishList);
      print("wishhhlist${wishList}");
      GetStorage().write('wishListItems',
          wishList!.data!.map((e) => e.itemId).toList().toSet().toList());
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





Future<void> getWishinit() async{
 showLoading = true;
    update();

 try {
      // wishlist
      wishList =
          WishListModel.fromJson(await ApiHelper.getApi(getWishListUrl + "/${GetStorage().read('id')}"));
      print("WhishGetbbb${wishList}");
      // wishList!.data!.map((e) => e.itemId).toList();
      GetStorage().write('wishListItems',
          wishList!.data!.map((e) => e.itemId).toList().toSet().toList());
      // categoryLoaded = true;
      update();
      print("GetWishData");
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
   // ProductByPartnerItem
  String getPartnerItemUrl = '${Constants.GET_PRODUCT_PARTNER_ITEM}';
ProductByPartnerItemModel?  userproductbypartneritemModel;
  bool partneritemLoaded = false;

  Future<void> partnerIteminit() async {
    showLoading = true;
     try {
      // our services
      userproductbypartneritemModel =
          ProductByPartnerItemModel.fromJson(await ApiHelper.getApi(getPartnerItemUrl+"${itempartnerId}"));
      print(getPartnerItemUrl);
      partneritemLoaded = true;
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
  // our services
  String getServicesUrl1 = '${Constants.GET_USER_SERVICES}';
  ServicesCategoryModel? servicesCategoryModel;
  bool servicesCategoryLoaded = false;

  Future<void> getServicesCategories() async {
    showLoading = true;
    update();
    try {
      // our services
      servicesCategoryModel =
          ServicesCategoryModel.fromJson(await ApiHelper.getApi(getServicesUrl1));
      print(servicesCategoryModel);
      servicesCategoryLoaded = true;
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
    Map<String, String> body = {
     
      "user_id": storage.read('id').toString(),
      "item_id": productId.toString(),
     
    };
    String addToWishList = Constants.USER_ADD_TO_FAV;
    print(body);
    try {
     
      var request = http.MultipartRequest('POST', Uri.parse(addToWishList));
      request.fields.addAll(body);
     
     var response = await ApiHelper.postFormData(request: request);
      wishListItemsId.add(productId);
      print(response);
      print("product");
      print(productId);
        String? message ;
    final RegExp messageRegExp = RegExp(r'message:\s*(.+?),', caseSensitive: false);

final Match? messageMatch = messageRegExp.firstMatch(response.toString());

if (messageMatch != null) {
 message = messageMatch.group(1)!;
    print("=====message${message}");
  print(message); 
} else {
  print("Message not found");
}
      update();
      GetStorage().write('wishListItems', wishListItemsId);

      // clearFields();
      update();
      // Get.back();
      Get.snackbar(
        'Success',
        'Item ${message??'Already Added in list'}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      print('Error: $e');
      if (e.toString() == "Error: Already in List") {
        wishListItemsId.remove(productId);
        
        update();
        GetStorage().write('wishListItems', wishListItemsId);
        removeItemFromWishList(productId);
        Get.snackbar(
          'Exists',
          'Remove it from WishList Page',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange,
          colorText: Colors.white,
        );
      } else {
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
    print(wishListItemsId);
    showLoading = false;
    update();
  }

  Future<void> removeItemFromWishList(int productId) async {
    // var data = await GetStorage().read("userData");
    showLoading = true;
    update();
    print("Removing item ##");
    try {
      // remove from wishlist
      // servicesCategoryModel =
      //     ServicesCategoryModel.fromJson(await ApiHelper.getApi(url));
      // print(servicesCategoryModel);
      // servicesCategoryLoaded = true;
      String url = Constants.USER_REMOVE_FROM_FAV;
     print("====>>>>> remove fav api ${url + "$productId" + "/${storage.read('id').toString()}"}");
     await ApiHelper.deleteByUrl(
          url: url + "$productId" + "/${storage.read('id').toString()}");
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

    @override
  void onClose() {
    videoController?.dispose();
    super.onClose();
  }
}
