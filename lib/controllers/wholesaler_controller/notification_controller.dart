import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:pet/controllers/wholesaler_controller/notifyListModel.dart';
import 'package:pet/models/notificationModel.dart';
import 'package:pet/models/wholesalerModel/notifyListModel.dart';
import 'package:pet/models/wholesalerModel/notifydeleteModel.dart';
import 'package:pet/models/wholesalerModel/readunreadModel.dart';

import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

import 'package:http/http.dart' as http;

class WholeNotificationController extends GetxController {
  int? itemID;
  int totalNotify = 0;
  int ?notifyId;
final storage = GetStorage();
    bool showLoading = false;
  // notification
  var wholesalerId = GetStorage().read("wholesalerid");
  // String getNotificationUrl = '${Constants.GET_USER_NOTIFICATION}';
  // NotificationModel? wholeNotificationModel;
  // bool notificationLoaded = false;

  
  // notify
  String getNotifyListUrl = '${Constants.GET_USER_NOTIFy}';
  WholeNotifyListModel? wholeNotifyListModel;
  bool notifiyLoaded = false;



// readunread
String getReadUnreadUrl = '${Constants.GET_USER_NOTIFY_VIEW}';
ReadUnreadNotiyModelwhole? readunreadModel;
bool readLoaded = false;


  // notifyDelete
  String getNotifyDeleteListUrl = '${Constants.GET_USER_NOTIFy_DELETE}';
  WholeNotifyListDeleteModel? wholeNotifydeleteListModel;
  bool notifiydeleteLoaded = false;


void itemView(int id,int notifyid) {
    itemID = id;
    notifyId = notifyid;
    update();
    print("itemId***${itemID}  ==Id${notifyId}");
  }
  @override
  void onInit() {
    super.onInit();
    //init();
  }

  // void init() async {
  //   try {
  //     // banners
  //     wholeNotificationModel = NotificationModel.fromJson(
  //         await ApiHelper.getApi(getNotificationUrl));
  //     print(wholeNotificationModel);
  //     notificationLoaded = true;
  //     update();
  //   } catch (e) {
  //     print('Error: $e');
  //    // Get.snackbar(
  //     //   'Error',
  //     //   'An error occurred: $e',
  //     //   snackPosition: SnackPosition.BOTTOM,
  //     //   backgroundColor: Colors.red,
  //     //   colorText: Colors.white,
  //     // );
  //   }
  // }



 Future<void> notifyinit() async {
    try {
      // Notify
      wholeNotifyListModel = WholeNotifyListModel.fromJson(
         await ApiHelper.getApi(getNotifyListUrl + "${wholesalerId}"));
          // await ApiHelper.getApi(getNotifyListUrl + "${GetStorage().read('id')}"));
          print("NotifyUrl" + getNotifyListUrl + "${wholesalerId}");
      // print("NotifyUrl" + getNotifyListUrl + "${GetStorage().read('id')}");
      notifiyLoaded = true;
              List<dynamic> noticount   = wholeNotifyListModel!.notification!.where((element) => element.status == "unread").toList();
 List<dynamic> notiiicout = wholeNotifyListModel!.data!.where((element) => element.status == "unread").toList();

 List<dynamic> allnotiiicout = wholeNotifyListModel!.allNotification!.where((element) => element.status == "unread").toList();
print("LIstNotificatio == ${noticount.length}");



print("LIstData == ${notiiicout.length}");
int notiTotal = noticount.length;
int notiiicoutLength = notiiicout.length;
int allnotiiicoutLength= allnotiiicout.length;

  totalNotify = (notiTotal) + (notiiicoutLength) + (allnotiiicoutLength);
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


 Future<void> notifydeleteinit() async {
    try {
      // Notify
      wholeNotifydeleteListModel = WholeNotifyListDeleteModel.fromJson(
         await ApiHelper.deleteApi(getNotifyDeleteListUrl + "${notifyId}"));
          // await ApiHelper.getApi(getNotifyListUrl + "${GetStorage().read('id')}"));
          print("NotifyDeleteUrl" + getNotifyDeleteListUrl + "${notifyId}");
      // print("NotifyUrl" + getNotifyListUrl + "${GetStorage().read('id')}");
      notifiydeleteLoaded = true;
      notifyinit();
      
      Get.back();
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




  Future<void> notifyView() async {
    showLoading = true;
    update();
    // await Future.delayed(Duration(seconds: 4));

    try {
      var request = http.MultipartRequest('POST', Uri.parse(getReadUnreadUrl+"${notifyId}"));
    
print(getReadUnreadUrl+"${notifyId}");
      await ApiHelper.postFormData( request:request );
      update();
      notifyinit();
      Get.back();
      // Get.snackbar(
      //   'Success',
      //   'Product Added',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.green,
      //   colorText: Colors.white,
      // );
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
