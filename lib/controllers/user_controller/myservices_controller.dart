

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/models/usersModel/myservicesModel.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

class MyServicesController extends GetxController {


// my services

  String getUserMyServicesUrl =
      '${Constants.GET_USER_MYSERVICES}';
  MyServicesModel? myservicesmodel;
  bool myservicesLoaded = false;

  
  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init() async {
    try {
      // myservices
      myservicesmodel = MyServicesModel.fromJson(
          await ApiHelper.getApi(getUserMyServicesUrl));
      print(" Services"+getUserMyServicesUrl);
      myservicesLoaded = true;
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

  }
}