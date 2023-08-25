

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/models/usersModel/myOrderModel.dart';
import 'package:pet/models/usersModel/orderDetailsModel.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

class MyOrderController extends GetxController{
final storage = GetStorage();
bool showLoading = false;
var userId;
int? orderID;


 @override
  void onInit() {
    super.onInit();
    init();
     orderdetailsinit();
    userId = storage.read('id');
  }


  void addorder(int id) {
    orderID = id;
    update();
    print("orderID${orderID}");
  }


   
String getMyOrderUrl =
      '${Constants.GET_MY_ORDER}';
  MyOrderModel? myorderModel;
  bool orderLoaded = false;

  String getMyOrderDetailsUrl =
      '${Constants.GET_ORDER_DETAILS}';
  OrderDetailsModel? orderdetailsModel;
  // bool orderdetailsLoaded = false;

  Future<void> init() async {
   showLoading = true;
    // update();
    try {
      // myorder
      myorderModel = MyOrderModel.fromJson(
          await ApiHelper.getApi(getMyOrderUrl+"${storage.read('id')}"));
      print(myorderModel);
       print(getMyOrderUrl+"${storage.read('id')}");
       orderLoaded = true;
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
      orderdetailsModel = OrderDetailsModel.fromJson(
          await ApiHelper.getApi(getMyOrderDetailsUrl+"${orderID}"));
      print(orderdetailsModel);
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