import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/models/notificationModel.dart';
import 'package:pet/models/usersModel/notifyListModel.dart';
import 'package:pet/models/usersModel/notifydeleteModel.dart';

import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

class NotificationController extends GetxController {
int? itemID;
  var userId = GetStorage().read("id");
  // notification
  String getNotificationUrl = '${Constants.GET_USER_NOTIFICATION}';
  NotificationModel? userNotificationModel;
  bool notificationLoaded = false;

  // notify
  String getNotifyListUrl = '${Constants.GET_USER_NOTIFy}';
  NotifyListModel? userNotifyListModel;
  bool notifiyLoaded = false;



  // notifyDelete
  String getNotifyDeleteListUrl = '${Constants.GET_USER_NOTIFy_DELETE}';
  NotifyListDeleteModel? userNotifydeleteListModel;
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
    notifydeleteinit();
  }

  void init() async {
    try {
      // banners
      userNotificationModel = NotificationModel.fromJson(
          await ApiHelper.getApi(getNotificationUrl));
      print(userNotificationModel);
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
      userNotifyListModel = NotifyListModel.fromJson(
         await ApiHelper.getApi(getNotifyListUrl + "${userId}"));
          // await ApiHelper.getApi(getNotifyListUrl + "${GetStorage().read('id')}"));
          print("NotifyUrl" + getNotifyListUrl + "${userId}");
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
      userNotifydeleteListModel = NotifyListDeleteModel.fromJson(
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
