
 import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pet/models/partnerModel/subscriptionModel.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';

class SubscriptionController extends GetxController{
  // RxInt selectedIndex = 0.obs;
 bool showLoading = false;
  //  toggle(int index) => selectedIndex.value = index;
  int? selectedIndex;



  void updateSelectedIndex(int id) {
    selectedIndex = id;
    update();
    print("subindex${selectedIndex}");
  }
    late DateTime oneMonthLater;
  late DateTime sixMonthsLater;
  late DateTime oneYearLater;

  @override
  void onInit() {
    super.onInit();
    init();
    Dateinit();
  }

   void Dateinit() {
    DateTime initialDate = DateTime.now(); // Replace with your initial date
    oneMonthLater = initialDate.add(Duration(days: 30));
    sixMonthsLater = initialDate.add(Duration(days: 30 * 6));
    oneYearLater = initialDate.add(Duration(days: 365)); // Note: This is a simple approximation for one year, not accounting for leap years

    print('Initial Date: ${formatDate(initialDate)}');
    print('One Month Later: ${formatDate(oneMonthLater)}');
    print('Six Months Later: ${formatDate(sixMonthsLater)}');
    print('One Year Later: ${formatDate(oneYearLater)}');
  }

  String formatDate(DateTime date) {
    return DateFormat('dd-MM-yyyy').format(date);
  }





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


// Future<void> purchaseinit() async {
//     showLoading = true;
//     update();
   
//      Map<String, String> body = {
//         "vendor_id":fullNameController.text,
//       "plan_name": lastNameController.text,
//       "plan_price":numberController.text,
//       "plan_type":flataddressController.text,
//       "plan_purchase_date":areaaddressController.text,
//       "plan_expaire_date": landmarkController.text,
//       "product_upload":pincodeController.text ,
//      "advertisement":selectedState!.stateName.toString(),
     
     
//     };
//     String PurchasePlanURl = Constants.PURCHASE_PLAN;
//     print(body);
//     try {
     
//       var request = http.MultipartRequest('POST', Uri.parse(PurchasePlanURl));
//       request.fields.addAll(body);
      
//       await ApiHelper.postFormData(request: request);
//       update();
//       Get.back();
//       Get.snackbar(
//         'Success',
//         'Address Added',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.green,
//         colorText: Colors.white,
//       );
//     } catch (e) {
//       print('Error: $e');
//       Get.snackbar(
//         'Error',
//         'An error occurred: $e',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//     }

//     showLoading = false;
//     update();
//   }


}