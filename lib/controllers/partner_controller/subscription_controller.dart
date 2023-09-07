
 import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/models/partnerModel/subscriptionModel.dart';
import 'package:pet/utils/api_helper.dart';

import '../../utils/constants.dart';

class SubscriptionController extends GetxController{
  RxInt selectedIndex = 0.obs;
 bool showLoading = false;
   toggle(int index) => selectedIndex.value = index;

     @override
  void onInit() {
    super.onInit();  
    init();
    }
 // Subscription
  String getSubscriptionUrl = '${Constants.GET_SUBSCRIPTION}';
  SubscriptionModel? subscriptionModel;
  bool subscritionLoaded = false;



    Future <void> init() async {
    showLoading = true;
    update();
    
      try {
      // subscription
      subscriptionModel = SubscriptionModel.fromJson(
          await ApiHelper.getApi(getSubscriptionUrl));
      print(subscriptionModel);
      subscritionLoaded = true;
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