


import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

import 'package:http/http.dart' as http;

class BalanceSalesController extends GetxController {
bool showLoading = false; 
var walletBalance = GetStorage().read('sellerwallet'); 
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
var wholesalerId = GetStorage().read('wholesalerId');
  TextEditingController addbalanceController = TextEditingController();
 @override
  void onInit() {
    super.onInit();
    print("Balance");
   print(walletBalance);
    
  }
Future<bool> validateForm(BuildContext context) {
    final completer = Completer<bool>();

    if (formKey.currentState!.validate()) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Form is valid')),
      // );
      completer.complete(true);
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Form is invalid')),
      // );
      completer.complete(false);
    }

    return completer.future;
  }
Future<void> addWalletsalesinit() async {
    showLoading = true;
   
    update();
   
     Map<String, String> body = {
      "user_id": wholesalerId.toString(),
      "amount":  addbalanceController.text.toString(),
      
     
     
    };
    String addwalletBalanceURl = Constants.ADDBALANCEWALLET_URL;
   print(body);
    try {
   
      var request = http.MultipartRequest('POST', Uri.parse(addwalletBalanceURl));
      request.fields.addAll(body);
    print(addwalletBalanceURl);
  var  response =   await ApiHelper.postFormData(request: request);
    print("AddBalanceWallet==>${response}");
      update();
      Get.back();
      Get.snackbar(
        'Success',
        'Add Balance Successfully',
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