

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/models/wholesalerModel/totalordermodel.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

class WholeTotalOrderController extends GetxController{
var wholesalerId = GetStorage().read("wholesalerid");
  bool showLoading = false;

//Totalorder
  String getTotalOrderUrl = '${Constants.GET_WHOLE_TOTALORDER}';
 WholeTotalOrderModel? wholetotalorderModel;
  bool totalorderLoaded = false;

@override
  void onInit() {
    super.onInit();
    init();
  }
  void init() async {
      showLoading = true;
    update();

try {
      // Totalorder
      wholetotalorderModel = WholeTotalOrderModel.fromJson(
          await ApiHelper.getApi(getTotalOrderUrl + "${wholesalerId}"));
      print("TotalOrderURL ==> ${getTotalOrderUrl}");
      totalorderLoaded = true;
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