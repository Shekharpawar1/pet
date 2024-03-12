import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/models/notificationModel.dart';
import 'package:pet/models/salesmanModel/notifyListModel.dart';
import 'package:pet/models/salesmanModel/notifydeleteModel.dart';
import 'package:pet/models/wholesalerModel/readunreadModel.dart';

import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

import 'package:http/http.dart' as http;
class NotificationsalesController extends GetxController {

  int? itemID;
  int? notifyId;
  
int totalNotify  = 0;
    bool showLoading = false;
  
    var wholesellerID = GetStorage().read('wholesalerId');
 
  String getNotifyListUrl = '${Constants.GET_USER_NOTIFy}';
  SalesNotifyListModel? salesNotifyListModel;
  bool notifiyLoaded = false;

// readunread
String getReadUnreadUrl = '${Constants.GET_USER_NOTIFY_VIEW}';
ReadUnreadNotiyModelwhole? readunreadModel;
bool readLoaded = false;


  // notifyDelete
  String getNotifyDeleteListUrl = '${Constants.GET_USER_NOTIFy_DELETE}';
  SalesNotifyListDeleteModel? salesNotifydeleteListModel;
  bool notifiydeleteLoaded = false;

void itemView(int id, int notifyid) {
    itemID = id;
     notifyId = notifyid;
    update();
    print("itemId${itemID}");
  }
  @override
  void onInit() {
    super.onInit();
    // init();
  }


 Future<void> notifyinit() async {
    try {
      // Notify
      salesNotifyListModel = SalesNotifyListModel.fromJson(
         await ApiHelper.getApi(getNotifyListUrl + "${wholesellerID}"));
          print("NotifyUrl" + getNotifyListUrl + "${wholesellerID}");
      // print("NotifyUrl" + getNotifyListUrl + "${GetStorage().read('id')}");
      notifiyLoaded = true;

         List<dynamic> noticount   = salesNotifyListModel!.notification!.where((element) => element.status == "unread").toList();
 List<dynamic> notiiicout = salesNotifyListModel!.data!.where((element) => element.status == "unread").toList();
print("LIstNotificatio == ${noticount.length}");

print("LIstData == ${notiiicout.length}");
int notiTotal = noticount.length;
int notiiicoutLength = notiiicout.length;

  totalNotify = (notiTotal) + (notiiicoutLength);
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
      salesNotifydeleteListModel = SalesNotifyListDeleteModel.fromJson(
         await ApiHelper.deleteApi(getNotifyDeleteListUrl + "${notifyId}"));
          // await ApiHelper.getApi(getNotifyListUrl + "${GetStorage().read('id')}"));
          print("NotifyDeleteUrl" + getNotifyDeleteListUrl + "${notifyId}");
      // print("NotifyUrl" + getNotifyListUrl + "${GetStorage().read('id')}");
      notifiydeleteLoaded = true;
       notifyinit() ;
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
