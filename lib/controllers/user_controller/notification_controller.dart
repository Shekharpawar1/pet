import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/models/notificationModel.dart';
import 'package:pet/models/usersModel/notifyListModel.dart';
import 'package:pet/models/usersModel/notifydeleteModel.dart';
import 'package:pet/models/usersModel/readunreadModel.dart';

import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

import 'package:http/http.dart' as http;

class NotificationController extends GetxController {
int? itemID;
int ?notifyId;
final storage = GetStorage();
var totalN ;

  bool showLoading = false;
 
// total
var total;
int totalNotify  = 0;
//  int notiTotal = 0;
// int notiiicoutLength = 0 ;
  // notification
  String getNotificationUrl = '${Constants.GET_USER_NOTIFICATION}';
  NotificationModel? userNotificationModel;
  bool notificationLoaded = false;

  // notify
  String getNotifyListUrl = '${Constants.GET_USER_NOTIFy}';
  NotifyListModel? userNotifyListModel;
  bool notifiyLoaded = false;

// readunread
String getReadUnreadUrl = '${Constants.GET_USER_NOTIFY_VIEW}';
ReadUnreadNotiyModel? readunreadModel;
bool readLoaded = false;

  // notifyDelete
  String getNotifyDeleteListUrl = '${Constants.GET_USER_NOTIFy_DELETE}';
  NotifyListDeleteModel? userNotifydeleteListModel;
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
    // init();
    notifyinit();
    notifydeleteinit();
  //  total = (userNotifyListModel?.data?.length ?? 0) + (userNotificationModel?.state?.length ?? 0);


    print("total*** ${total}") ;
  }

//   Future<void> init() async {

//  showLoading = true;
//     update();
//     try {
//       // Public Notification
//       userNotificationModel = NotificationModel.fromJson(
//           await ApiHelper.getApi(getNotificationUrl));
//       print(userNotificationModel);
//       notificationLoaded = true;
    
//       update();
//     } catch (e) {
//       print('Error: $e');
//      // Get.snackbar(
//       //   'Error',
//       //   'An error occurred: $e',
//       //   snackPosition: SnackPosition.BOTTOM,
//       //   backgroundColor: Colors.red,
//       //   colorText: Colors.white,
//       // );
//     }
//      showLoading = false;
//     update();
//   }



 Future<void> notifyinit() async {
 showLoading = true;
    update();
    
    try {
      // Notify
      print("UserIID  ${storage.read('id')}");
      userNotifyListModel = NotifyListModel.fromJson(
         await ApiHelper.getApi(getNotifyListUrl + "${storage.read('id')}"));
          print("NotifyUrl " + getNotifyListUrl + "${storage.read('id')}");
      notifiyLoaded = true;
          List<dynamic> noticount   = userNotifyListModel!.notification!.where((element) => element.status == "unread").toList();
 List<dynamic> notiiicout = userNotifyListModel!.data!.where((element) => element.status == "unread").toList();
List<dynamic> allnotiiicout = userNotifyListModel!.allNotification!.where((element) => element.status == "unread").toList();

print("LIstNotificatio == ${noticount.length}");



print("LIstData == ${notiiicout.length}");
int notiTotal = noticount.length;
int notiiicoutLength = notiiicout.length;
int  allnotiiicoutLength = allnotiiicout.length;
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
     showLoading = false;
    update();
  }



 Future<void> notifydeleteinit() async {
    try {
      // Notify
      userNotifydeleteListModel = NotifyListDeleteModel.fromJson(
         await ApiHelper.deleteApi(getNotifyDeleteListUrl + "${notifyId}"));
          // await ApiHelper.getApi(getNotifyListUrl + "${GetStorage().read('id')}"));
          print("NotifyDeleteUrl" + getNotifyDeleteListUrl + "${notifyId}");
      // print("NotifyUrl" + getNotifyListUrl + "${GetStorage().read('id')}");
      notifiydeleteLoaded = true;
      notifyinit();
      //  init() ;
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
