
 import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:pet/models/partnerModel/subscriptionModel.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';

class SubscriptionController extends GetxController{
 final storage = GetStorage();
 bool showLoading = false;
  //  toggle(int index) => selectedIndex.value = index;
  int? selectedIndex;
String? price1;
 String? planname1;
  String? plantype1;
  String? advertistment1;
  String? productLimit;
  DateTime? expireyDate;
  String? image;
   var partnerID;
// void update(int id) {
//     selectedIndex = id;
//     update();
//     print("subindex${selectedIndex}");
//   }
  void updateSelectedIndex(int id, String price, String planname, String plantype,String productlmt, String advertistment , DateTime expire,String image1 ) {
    selectedIndex = id;
    price1= price;
    plantype1 =plantype;
    planname1=planname;
    advertistment1 = advertistment;
productLimit = productlmt;
      expireyDate= expire;
      image = image1;
    update();
    print(" SelectID ${selectedIndex} Expireydate ${expireyDate}");
  }
    late DateTime oneMonthLater;
  late DateTime sixMonthsLater;
  late DateTime oneYearLater;

  @override
  void onInit() {
    super.onInit();
    init();
    partnerID = storage.read('partnerid');
  }

  //  void Dateinit() {
  //    // Note: This is a simple approximation for one year, not accounting for leap years

  //   print('Initial Date: ${formatDate(initialDate)}');
  //   print('One Month Later: ${formatDate(oneMonthLater)}');
  //   print('Six Months Later: ${formatDate(sixMonthsLater)}');
  //   print('One Year Later: ${formatDate(oneYearLater)}');
  // }

  // String formatDate(DateTime date) {
  //   return DateFormat('dd-MM-yyyy').format(date);
  // }


//   void chooseplan(int planId){
// isselected = planId;
//  update();
//  print("planId  ${isselected}");
//   }


//  late DateTime oneMonthLater;

// @override
// void onInit() {
//   super.onInit();
//   init();
//   oneMonthLater = _calculateOneMonthLater();
//   print('One Month Later: $oneMonthLater');
// }

// DateTime _calculateOneMonthLater() {
//   DateTime initialDate = DateTime.now(); // Replace with your initial date
//   return initialDate.add(Duration(days: 30)); // Add 30 days to the initial date
// }
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


Future<void> purchaseinit() async {
    showLoading = true;
    update();
   
     Map<String, String> body = {
        "vendor_id":storage.read('partnerid').toString(),
      "plan_name": planname1.toString(),
      "plan_price":price1.toString(),
      "plan_type":plantype1.toString(),
      "plan_purchase_date": DateTime.now().toString(),
      "plan_expaire_date": expireyDate.toString(),
      "product_upload":productLimit.toString() ,
     "advertisement":advertistment1.toString(),
     
     
    };
    String PurchasePlanURl = Constants.PURCHASE_PLAN;
    print(body);
    try {
     
      var request = http.MultipartRequest('POST', Uri.parse(PurchasePlanURl));
      request.fields.addAll(body);
      
     var response = await ApiHelper.postFormData(request: request);
      print("PurchasePlanURL"+PurchasePlanURl);
      print(response);
      update();
      Get.back();
      Get.snackbar(
        'Success',
        'Purchaes Plan',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
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