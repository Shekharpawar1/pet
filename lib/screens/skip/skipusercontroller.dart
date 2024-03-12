import 'dart:math';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/models/usersModel/bannerModel.dart';
import 'package:pet/models/usersModel/getUserCategoriesModel.dart';
import 'package:pet/models/usersModel/getUserPropertiesModel.dart';
import 'package:pet/models/usersModel/ourBrandModel.dart';
import 'package:pet/models/usersModel/servicesCategoriesModel.dart';
import 'package:pet/models/usersModel/servicesModel.dart';
import 'package:pet/models/usersModel/toysModel.dart';
import 'package:pet/models/usersModel/userProductByPartnerModel.dart';

import '../../utils/api_helper.dart';
import '../../utils/constants.dart';

class SkipUserController extends GetxController {
  UserBannerModel? userBannerModel;
  UserCategoriesModel? userCategoriesModel;
  UserPropertiesModel? userPropertiesModel;
  UserOurBrandModel? userBrandModel;
  UserProductByPartnerModel? userProductPartnerModel;
  ServicesModel? userServicesModel;
  ToyModel? usertoyModel;
  var subtotal;
  var tax;
  var total;
  List cartlist = [];
  var loading = true;

  @override
  void onInit() {
    // TODO: implement onInit
    var a = GetStorage().read("cartlist");
    if (a != null) {
      cartlist = a;
    }
    getbanner();
    super.onInit();
  }

  decrementSize(index) {
    int a = cartlist[index]["quantity"];
    double b = double.parse(cartlist[index]["actualprice"]);
    if (a > 1) {
      a--;
      cartlist[index]["quantity"] = a;

      var c = b * double.parse(a.toString());
      cartlist[index]["price"] = c.toString();

      update();
    } else {}
  }

  incrementSize(index) {
    int a = cartlist[index]["quantity"];
    double b = double.parse(cartlist[index]["actualprice"]);
    a++;
    cartlist[index]["quantity"] = a;
    var c = b * double.parse(a.toString());
    cartlist[index]["price"] = c.toString();

    update();
  }

  countingprice() {
    double tot = 0;
    for (var i = 0; i < cartlist.length; i++) {
      var b = double.parse(cartlist[i]['price']);
      print(b);

      tot = tot + b;
    }
    subtotal = tot.toString();

    var b = double.parse(subtotal) * (5 / 100);
    tax = b.toStringAsFixed(2);
    total = b + tot;

    update();
    print(b);
  }

  getbanner() async {
    loading = true;
    try {
      String getBannerUrl = '${Constants.GET_USER_BANNER}';
      var response = await ApiHelper.getApi(getBannerUrl);
      userBannerModel = UserBannerModel.fromJson(response);

      getcategory();

      print(response);
    } catch (e) {
      print(e.toString());
    }
  }

  getcategory() async {
    loading = true;
    try {
      String getUserCategoriesUrl =
          '${Constants.BASE_URL}${Constants.API_V1_PATH}${Constants.GET_USER_CATEGORIES}';
      var response = await ApiHelper.getApi(getUserCategoriesUrl);

      userCategoriesModel = UserCategoriesModel.fromJson(response);
      update();

      getproperties();
    } catch (e) {
      print(e.toString());
    }
  }

  getproperties() async {
        loading = true;
    try {
      String getUserPropertiesUrl =
          '${Constants.BASE_URL}${Constants.API_V1_PATH}${Constants.GET_USER_PROPERTIES}';
      var response = await ApiHelper.getApi(getUserPropertiesUrl);

      userPropertiesModel = UserPropertiesModel.fromJson(response);
      update();
      getuserbrand();
    } catch (e) {
      print(e.toString());
    }
  }

  getuserbrand() async {
        loading = true;
    try {
      String getBrandUrl = '${Constants.GET_OUR_BRAND}';
      var response = await await ApiHelper.getApi(getBrandUrl);

      userBrandModel = UserOurBrandModel.fromJson(response);
      gettoy();
      update();
    } catch (e) {
      print(e.toString());
    }
  }

  gettoy() async {
        loading = true;
    try {
      String getUsertoyUrl = '${Constants.GET_USER_TOY}';
      var response = await ApiHelper.getApi(
          getUsertoyUrl + "sub_category=6&category1=1&category2=2");

      usertoyModel = ToyModel.fromJson(response);
      update();

      getuserproduct();
    } catch (e) {
      print(e.toString());
    }
  }

  getuserproduct() async {    
    loading = true;
    try {
      // ProductByPartner
      String getProductByPartnerUrl = '${Constants.GET_PRODUCTBYPARTNER}';
      var response = await ApiHelper.getApi(getProductByPartnerUrl);

      userProductPartnerModel = UserProductByPartnerModel.fromJson(response);
      loading = false;
      update();
      getuserservice();
    } catch (e) {
      print(e.toString());
    }
  }

  getuserservice() async {
        loading = true;
    try {
      String getServicesUrl = '${Constants.GET_USER_SERVICES}';
      var response = await ApiHelper.getApi(getServicesUrl);

      userServicesModel = ServicesModel.fromJson(response);
      update();
    } catch (e) {
      print(e.toString());
    }
  }

}
