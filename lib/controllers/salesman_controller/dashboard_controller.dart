import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/models/salesmanModel/orderDetailsModel.dart';
import 'package:pet/models/salesmanModel/totalOrderSellerModel.dart';
import 'package:pet/models/salesmanModel/totalWholeSellerModel.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

class DashBoardController extends GetxController{

var sellerId = GetStorage().read("sellerid");
  bool showLoading = false;
int? orderID;
var wholesalerid;

//Totalwholeseller
  String getWholeSellerUrl = '${Constants.GET_WHOLESELLER_TOTAL}';
 TotalWholeSellerModel? total1wholesellerModel;
  bool wholetotalorderLoaded = false;

//TotalOrderseller
  String getTotalOrderSellerUrl = '${Constants.GET_TOTALSELLER_ORDER}';
 TotalOrderSellerModel? totalordersellerModel;
  bool sellertotalorderLoaded = false;
  

  
  String getMyOrderDetailsUrl =
      '${Constants.GET_ORDER_DETAILS}';
  SalesOrderDetailsModel? salesorderdetailsModel;
@override
  void onInit() {
    super.onInit();
    init();
    sellerinit();
   orderdetailsinit();
    // sellerId = storage.read('wholesalerid');
  }


  void addorder(int id) {
    orderID = id;
    update();
    print("orderID${orderID}");
  }

  Future<void> init() async {
      showLoading = true;
    update();

try {
      // Totalorder
      total1wholesellerModel = TotalWholeSellerModel.fromJson(
          await ApiHelper.getApi(getWholeSellerUrl + "${1}"));
      print("WholeSellerUrl ==> ${getWholeSellerUrl + "${1}"}");

     
      wholetotalorderLoaded = true;
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


  Future<void> sellerinit() async {
      showLoading = true;
    update();
     
 // TotalorderSeller
    try {
     
      totalordersellerModel = TotalOrderSellerModel.fromJson(
          await ApiHelper.getApi(getTotalOrderSellerUrl + "${17}"));
      print("WholeSellerUrl ==> ${getTotalOrderSellerUrl + "${17}"}");
      sellertotalorderLoaded = true;
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




  Future<void> orderdetailsinit() async {
   showLoading = true;
    update();
    try {
      // myorder
      salesorderdetailsModel = SalesOrderDetailsModel.fromJson(
          await ApiHelper.getApi(getMyOrderDetailsUrl+"${orderID}"));
      print(salesorderdetailsModel);
       print(getMyOrderDetailsUrl+"${orderID}");
      // orderLoaded = true;
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
 
  
}