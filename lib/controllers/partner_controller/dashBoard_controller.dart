

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/models/partnerModel/orderDetailsModel.dart';
import 'package:pet/models/partnerModel/partnerTotalOrderModel.dart';
import 'package:pet/models/partnerModel/partnerTotalProductModel.dart';
import 'package:pet/utils/api_helper.dart';

import '../../utils/constants.dart';

class PartnerDashBoardController extends GetxController{
//orderdeatils

  String getMyOrderDetailsUrl =
      '${Constants.GET_ORDER_DETAILS}';
 final storage = GetStorage();
//partnerTotalProduct

String getProductUrl = '${Constants.GET_TOTALPRODUCT_PARTNER}';

//TotalOrder
String getTotalOrderPartnerUrl = '${Constants.GET_TOTALORDER_PARTNER}';

//partnerTotalOrder
int? orderID;


PartnerTotalOrderModel? partnertotalOrderModel;
PartnerTotalProductModel? partnertotalProductModel;
  bool partnertotalorderLoaded = false;
 bool partnertotalproductLoaded = false;
  PartnerOrderDetailsModel? patnerorderdetailsModel;
  bool showLoading = false;

 @override
  void onInit() {
    super.onInit();
    init();
     TotalOrderinit();
     var partnerId = storage.read("partnerid");
     print("PatnerId");
     print(partnerId);
          print(storage.read("partnerid"));
    //  orderdetailsinit();
    // userID = storage.read('id');
  }

  void addorder(int id) {
    orderID = id;
    update();
    print("orderID${orderID}");
  }

 Future <void> init() async {
    showLoading = true;
    update();

 try {
      // partnerTotalProduct
      partnertotalProductModel = PartnerTotalProductModel.fromJson(
          await ApiHelper.getApi(getProductUrl +"${storage.read("partnerid")}"));
          print("WholeSellerPartner " +getProductUrl +"${storage.read("partnerid")}");
      print(partnertotalProductModel);
      partnertotalproductLoaded = true;
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
 // partnerTotalOrder
      partnertotalOrderModel = PartnerTotalOrderModel.fromJson(
          await ApiHelper.getApi(getTotalOrderPartnerUrl+"${storage.read("partnerid")}"));
          print( "TotalOrderPartner " +getTotalOrderPartnerUrl+"${storage.read("partnerid")}");
      print(partnertotalOrderModel);
      partnertotalorderLoaded = true;
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

 Future <void> TotalOrderinit() async {
    showLoading = true;
    update();


 try {
      partnertotalOrderModel = PartnerTotalOrderModel.fromJson(
          await ApiHelper.getApi(getTotalOrderPartnerUrl+"${storage.read("partnerid")}"));
          print( "TotalOrderPartner " +getTotalOrderPartnerUrl+"${storage.read("partnerid")}");
      print(partnertotalOrderModel);
      partnertotalorderLoaded = true;
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

  Future<void> orderdetailsinit() async {
   showLoading = true;
    update();
    try {
      // myorder
      patnerorderdetailsModel = PartnerOrderDetailsModel.fromJson(
          await ApiHelper.getApi(getMyOrderDetailsUrl+"${orderID}"));
      print(patnerorderdetailsModel);
       print(getMyOrderDetailsUrl+"${orderID}");
      // orderLoaded = true;
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
}