

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/models/partnerModel/orderDetailsModel.dart';
import 'package:pet/models/partnerModel/partnerTotalOrderModel.dart';
import 'package:pet/models/partnerModel/partnerTotalProductModel.dart';
import 'package:pet/utils/api_helper.dart';

import '../../utils/constants.dart';

class PartnerDashBoardController extends GetxController{
  bool showLoading = false;
//partnerTotalOrder
int? orderID;
var partnerId = GetStorage().read("partnerid");

  void addorder(int id) {
    orderID = id;
    update();
    print("orderID${orderID}");
  }

 @override
  void onInit() {
    super.onInit();
    init();
     TotalOrderinit();
    //  orderdetailsinit();
    // userID = storage.read('id');
  }


//partnerTotalProduct

String getProductUrl = '${Constants.GET_TOTALPRODUCT_PARTNER}';
PartnerTotalProductModel? partnertotalProductModel;
 bool partnertotalproductLoaded = false;

//TotalOrder
String getTotalOrderPartnerUrl = '${Constants.GET_TOTALORDER_PARTNER}';
PartnerTotalOrderModel? partnertotalOrderModel;
  bool partnertotalorderLoaded = false;


//orderdeatils

  String getMyOrderDetailsUrl =
      '${Constants.GET_ORDER_DETAILS}';
  PartnerOrderDetailsModel? patnerorderdetailsModel;


 Future <void> init() async {
    showLoading = true;
    update();

 try {
      // partnerTotalProduct
      partnertotalProductModel = PartnerTotalProductModel.fromJson(
          await ApiHelper.getApi(getProductUrl +"${19}"));
          print("WholeSellerPartner " +getProductUrl +"${19}");
      print(partnertotalProductModel);
      partnertotalproductLoaded = true;
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
 // partnerTotalOrder
      partnertotalOrderModel = PartnerTotalOrderModel.fromJson(
          await ApiHelper.getApi(getTotalOrderPartnerUrl+"${19}"));
          print( "TotalOrderPartner " +getTotalOrderPartnerUrl+"${19}");
      print(partnertotalOrderModel);
      partnertotalorderLoaded = true;
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


 
 Future <void> TotalOrderinit() async {
    showLoading = true;
    update();

//  try {
//       // partnerTotalProduct
//       partnertotalProductModel = PartnerTotalProductModel.fromJson(
//           await ApiHelper.getApi(getProductUrl +"${19}"));
//           print("WholeSellerPartner " +getProductUrl +"${19}");
//       print(partnertotalProductModel);
//       partnertotalproductLoaded = true;
//       update();
//     } catch (e) {
//       print('Error: $e');
//       Get.snackbar(
//         'Error',
//         'An error occurred: $e',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//     }

 try {
 // partnerTotalOrder
      partnertotalOrderModel = PartnerTotalOrderModel.fromJson(
          await ApiHelper.getApi(getTotalOrderPartnerUrl+"${19}"));
          print( "TotalOrderPartner " +getTotalOrderPartnerUrl+"${19}");
      print(partnertotalOrderModel);
      partnertotalorderLoaded = true;
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
      patnerorderdetailsModel = PartnerOrderDetailsModel.fromJson(
          await ApiHelper.getApi(getMyOrderDetailsUrl+"${orderID}"));
      print(patnerorderdetailsModel);
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