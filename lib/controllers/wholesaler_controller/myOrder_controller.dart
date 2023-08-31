

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/models/wholesalerModel/myOrderModel.dart';
import 'package:pet/models/wholesalerModel/orderDetailsModel.dart';

import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

class WholeMyOrderController extends GetxController{
final storage = GetStorage();
bool showLoading = false;
var wholesalerId;
int? orderID;


 @override
  void onInit() {
    super.onInit();
    init();
     orderdetailsinit();
    wholesalerId = storage.read('wholesalerid');
  }


  void addorder(int id) {
    orderID = id;
    update();
    print("orderID${orderID}");
  }


   
String getMyOrderUrl =
      '${Constants.GET_MY_ORDER}';
  WholeMyOrderModel? wholemyorderModel;
  bool orderLoaded = false;

  String getMyOrderDetailsUrl =
      '${Constants.GET_ORDER_DETAILS}';
  WholeOrderDetailsModel? wholeorderdetailsModel;
  // bool orderdetailsLoaded = false;

  Future<void> init() async {
   showLoading = true;
    // update();
    try {
      // myorder
      wholemyorderModel = WholeMyOrderModel.fromJson(
          await ApiHelper.getApi(getMyOrderUrl+"${storage.read('wholesalerid')}"));
      print(wholemyorderModel);
       print(getMyOrderUrl+"${storage.read('wholesalerid')}");
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
      wholeorderdetailsModel = WholeOrderDetailsModel.fromJson(
          await ApiHelper.getApi(getMyOrderDetailsUrl+"${orderID}"));
      print(wholeorderdetailsModel);
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