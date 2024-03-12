import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/controllers/salesman_controller/addtocartcontroller.dart';
import 'package:pet/controllers/salesman_controller/notification_controller.dart';
import 'package:pet/models/salesmanModel/bannerModel.dart';
import 'package:pet/models/salesmanModel/getUserCategoriesModel.dart';
import 'package:pet/models/salesmanModel/getUserPropertiesModel.dart';
import 'package:pet/models/salesmanModel/ourBrandModel.dart';
import 'package:pet/models/salesmanModel/salesProductByPartnerItemModel.dart';
import 'package:pet/models/salesmanModel/salesProductByPartnerModel.dart';
import 'package:pet/models/salesmanModel/salesWishListModel.dart';
import 'package:pet/models/usersModel/bannerModel.dart';
import 'package:http/http.dart' as http;
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/models/salesmanModel/getUserPropertiesModel.dart' as Model;

class HomeSalesController extends GetxController {
  bool showLoading = false;
    TextEditingController searchcontroller = TextEditingController();
  final storage = GetStorage();
    int? itempartnerId;
     NotificationsalesController notificationsalescontroller = Get.put(NotificationsalesController()) ;
  SalesMyCartController mycartController = Get.put(SalesMyCartController());
  int? selectImages = 0;
  //  var sellerId = GetStorage().read("sellerid");
  var wholesellerID;
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

  List<Model.Datum> searchScreenData = [];
  void clearSearchData() {
    searchScreenData = [];
    update();
  }


void viewpartner(int id) {
    itempartnerId = id;
    update();
    print("itempartnerId${itempartnerId}");
  }
  void searchDataFilter(SalesPropertiesModel? dataModel, String keyword) {
    // const String keyword = "999";

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

  // ProductByPartner
  String getProductByPartnerUrl = '${Constants.GET_PRODUCTBYPARTNER}';
  SalesProductByPartnerModel? salesProductPartnerModel;
  bool partnerLoaded = false;

  // our brand
  String getBrandUrl = '${Constants.GET_OUR_BRAND}';
  SalesOurBrandModel? salesBrandModel;
  SalesOurBrandModel? salesOurBrandModel = SalesOurBrandModel();
  bool brandLoaded = false;

  // wishlist list
  SalesWishListModel? saleswishList;
  String getWishListUrl = Constants.USER_GET_WISHLIST;
  List wishListItemsId = GetStorage().read('wishListItems') ?? [];

  @override
  void onInit() {
    super.onInit();
    init();
    mycartController.init(); 
  }

  fethUserId() {
    wholesellerID = storage.read('wholesalerId');
    print("WholeSellerID ==>${wholesellerID}");
    //  print("SellerID ==>${sellerId}");
  }

  Future<void> init() async {
    showLoading = true;
    update();
    try {
      // categories
      salesCategoriesModel = SalesCategoriesModel.fromJson(
          await ApiHelper.getApi(getUserCategoriesUrl));
      print(salesCategoriesModel);
      categoryLoaded = true;
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
      // pets
      salesPropertiesModel = SalesPropertiesModel.fromJson(
          await ApiHelper.getApi(getUserPropertiesUrl));
      salesPropertiesModel!.data = salesPropertiesModel!.data!
          .where((element) => element.moduleId == 1)
          .toList();

      print(salesPropertiesModel);
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
      // banners
      salesBannerModel =
          SalesBannerModel.fromJson(await ApiHelper.getApi(getBannerUrl));
      print(salesBannerModel);
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
    try {
      // our brands
      salesBrandModel =
          SalesOurBrandModel.fromJson(await ApiHelper.getApi(getBrandUrl));
      //salesOurBrandModel =salesBrandModel;
      //salesOurBrandModel!.data = [];
      //salesBrandModel!.data!.forEach((e) {
      //   if (e.canine == 1) {
      //    salesOurBrandModel!.data!.add(e);
      //   }
      // });
      print(
          "CAnine products ===>>>> ${salesBrandModel!.data!.where((element) => element.canine == 1).toList()}");
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
      // ProductByPartner
      salesProductPartnerModel = SalesProductByPartnerModel.fromJson(
          await ApiHelper.getApi(getProductByPartnerUrl));
      print(salesProductPartnerModel);
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

    showLoading = false;
    update();
  }


String getPartnerItemUrl = '${Constants.GET_PRODUCT_PARTNER_ITEM}';
SalesProductByPartnerItemModel? salesproductbypartneritemModel;
  bool partneritemLoaded = false;

  Future<void> partnerIteminit() async {
    showLoading = true;
     try {
      // our services
     salesproductbypartneritemModel =
          SalesProductByPartnerItemModel.fromJson(await ApiHelper.getApi(getPartnerItemUrl+"${itempartnerId}"));
     salesproductbypartneritemModel!.data = salesproductbypartneritemModel!.data!.where((element) => element.moduleId == 1).toList();
    
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
  
  Future<void> addItemToWishList(int productId) async {
    showLoading = true;
    update();
    // await Future.delayed(Duration(seconds: 4));
    Map<String, String> body = {
      
      "user_id": wholesellerID.toString(),
      "item_id": productId.toString(),
   
    };
    String addToWishList = Constants.USER_ADD_TO_FAV;
    print(body);
    try {
      
      var request = http.MultipartRequest('POST', Uri.parse(addToWishList));
      request.fields.addAll(body);
      
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


 Future<void> fetchWishList() async {
    
    showLoading = true;
    update();
    try {
      // wishlist
      saleswishList =
          SalesWishListModel.fromJson(await ApiHelper.getApi(getWishListUrl + "/${GetStorage().read('id')}"));
     
      GetStorage().write('wishListItems',
          saleswishList!.data!.map((e) => e.itemId).toList().toSet().toList());
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


Future<void> getWishinit() async{
 showLoading = true;
    update();

 try {
      // wishlist
      saleswishList =
          SalesWishListModel.fromJson(await ApiHelper.getApi(getWishListUrl + "/${GetStorage().read('id')}"));
      // print(wishList);
      // wishList!.data!.map((e) => e.itemId).toList();
      GetStorage().write('wishListItems',
          saleswishList!.data!.map((e) => e.itemId).toList().toSet().toList());
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
   
  Future<void> removeItemFromWishList(int productId) async {
    // var data = await GetStorage().read("userData");
    showLoading = true;
    update();
    print("Removing item");
    try {
      
      String url = Constants.USER_REMOVE_FROM_FAV;
      await ApiHelper.deleteByUrl(url: url + "/$productId" + "/$wholesellerID");
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
 
  get getOurBrandList => _ourbandList;
  get getServiceList => _serviceList;
  // get getbannerList => _bannerList;

  get getCartList => _cartList;
  get getAnimalList => _animalList;
}
