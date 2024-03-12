import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/models/notificationModel.dart';

import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

class PartnerNotificationController extends GetxController {

  bool showLoading = false;

  // notification
  String getNotificationUrl = '${Constants.GET_USER_NOTIFICATION}';
  NotificationModel? partnerNotificationModel;
  bool notificationLoaded = false;

  @override
  void onInit() {
    super.onInit();
    init();
  }


  Future<void> init() async {

 showLoading = true;
    update();
    try {
      // Public Notification
      partnerNotificationModel = NotificationModel.fromJson(
          await ApiHelper.getApi(getNotificationUrl));
      print(partnerNotificationModel);
      notificationLoaded = true;
    
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
