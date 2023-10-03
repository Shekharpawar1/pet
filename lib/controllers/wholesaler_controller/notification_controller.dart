import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/controllers/wholesaler_controller/notifyListModel.dart';
import 'package:pet/models/notificationModel.dart';
import 'package:pet/models/wholesalerModel/notifydeleteModel.dart';

import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

class WholeNotificationController extends GetxController {
  int? itemID;
  // notification
  var wholesalerId = GetStorage().read("wholesalerid");
  String getNotificationUrl = '${Constants.GET_USER_NOTIFICATION}';
  NotificationModel? wholeNotificationModel;
  bool notificationLoaded = false;

  
  // notify
  String getNotifyListUrl = '${Constants.GET_USER_NOTIFy}';
  WholeNotifyListModel? wholeNotifyListModel;
  bool notifiyLoaded = false;



  // notifyDelete
  String getNotifyDeleteListUrl = '${Constants.GET_USER_NOTIFy_DELETE}';
  WholeNotifyListDeleteModel? wholeNotifydeleteListModel;
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
      wholeNotificationModel = NotificationModel.fromJson(
          await ApiHelper.getApi(getNotificationUrl));
      print(wholeNotificationModel);
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
      wholeNotifyListModel = WholeNotifyListModel.fromJson(
         await ApiHelper.getApi(getNotifyListUrl + "${wholesalerId}"));
          // await ApiHelper.getApi(getNotifyListUrl + "${GetStorage().read('id')}"));
          print("NotifyUrl" + getNotifyListUrl + "${wholesalerId}");
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
      wholeNotifydeleteListModel = WholeNotifyListDeleteModel.fromJson(
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
