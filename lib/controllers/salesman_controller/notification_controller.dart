import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/models/notificationModel.dart';
import 'package:pet/models/salesmanModel/notifyListModel.dart';
import 'package:pet/models/salesmanModel/notifydeleteModel.dart';

import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

class NotificationsalesController extends GetxController {

  int? itemID;
  
    var wholesellerID = GetStorage().read('wholesalerId');
  // notification
  String getNotificationUrl = '${Constants.GET_USER_NOTIFICATION}';
  NotificationModel? salesNotificationModel;
  bool notificationLoaded = false;
// notify
  String getNotifyListUrl = '${Constants.GET_USER_NOTIFy}';
  SalesNotifyListModel? salesNotifyListModel;
  bool notifiyLoaded = false;



  // notifyDelete
  String getNotifyDeleteListUrl = '${Constants.GET_USER_NOTIFy_DELETE}';
  SalesNotifyListDeleteModel? salesNotifydeleteListModel;
  bool notifiydeleteLoaded = false;

void itemView(int id) {
    itemID = id;
    update();
    print("itemId${itemID}");
  }
  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init() async {
    try {
      // banners
      salesNotificationModel = NotificationModel.fromJson(
          await ApiHelper.getApi(getNotificationUrl));
      print(salesNotificationModel);
      notificationLoaded = true;
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
  }


 Future<void> notifyinit() async {
    try {
      // Notify
      salesNotifyListModel = SalesNotifyListModel.fromJson(
         await ApiHelper.getApi(getNotifyListUrl + "${wholesellerID}"));
          // await ApiHelper.getApi(getNotifyListUrl + "${GetStorage().read('id')}"));
          print("NotifyUrl" + getNotifyListUrl + "${wholesellerID}");
      // print("NotifyUrl" + getNotifyListUrl + "${GetStorage().read('id')}");
      notifiyLoaded = true;
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
  }



Future<void> notifydeleteinit() async {
    try {
      // Notify
      salesNotifydeleteListModel = SalesNotifyListDeleteModel.fromJson(
         await ApiHelper.getApi(getNotifyDeleteListUrl + "${itemID}"));
          // await ApiHelper.getApi(getNotifyListUrl + "${GetStorage().read('id')}"));
          print("NotifyDeleteUrl" + getNotifyDeleteListUrl + "${itemID}");
      // print("NotifyUrl" + getNotifyListUrl + "${GetStorage().read('id')}");
      notifiydeleteLoaded = true;
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
  }


}
