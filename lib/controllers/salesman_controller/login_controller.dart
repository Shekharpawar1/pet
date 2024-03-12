import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:pet/models/cityModel.dart';
import 'package:pet/models/stateModel.dart';
import 'package:pet/models/stateModel.dart' as statesFile;
import 'package:pet/models/cityModel.dart' as cityFile;
import 'package:pet/screens/salesman/Dashboard.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';
import 'package:http/http.dart' as http;

class SalesLoginController extends GetxController {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
bool passwordVisible = false;
final storage = GetStorage();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? otpText;
  updateOtp(String otp) {
    otpText = otp;
    update();
  }
  void updatepass() {
    passwordVisible = !passwordVisible;
    update();
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

  Future<void> loginsales() async {
    try {
      // sate list
      var body = {"phone": phoneNumberController.text.trim().toString(),
      "password": passwordController.text.trim().toString()};
    var response=  await ApiHelper.postApi(url: Constants.SALESMAN_LOGIN, body: body);
      print(body);
       storage.write('login', true);
      print("============= Success ${storage.read("login")}=============");
        var sellerid;
        var sellertoken;
      var sellerData;
      var sellerzoneID;
      var sellerwallet;
      var sellerDataStatus;


      print(response["data"]);
      try {
        sellerid = response["data"][0]["id"];
        sellertoken = response["data"][0]["auth_token"];
        sellerzoneID = response["data"][0]["zone_id"];
        sellerData = response["data"];
        sellerwallet = response["data"][0]["wallet_balance"];
sellerDataStatus =  response["data"][0]["status"];
      
      }catch(e){
        sellerid = response["data"]![0]["id"];
         sellerzoneID = response["data"][0]["zone_id"];
                sellertoken = response["data"]![0]["auth_token"];
        sellerData = response["data"][0];
        sellerwallet = response["data"][0]["wallet_balance"];
        
sellerDataStatus =  response["data"][0]["status"];
      }
      // // var id = userLoginModel.data![0].id;
      
      print("=====>>>> Id ${sellerid} ZOneID: ${sellerzoneID} data: ${sellerData} Status ${sellerDataStatus}");
      storage.write('sellerData', sellerData);
      storage.write('sellerid', sellerid);
       storage.write('sellerZoneId', sellerzoneID);
        storage.write('sellertoken', sellertoken);
        storage.write('sellerwallet', sellerwallet);
      print(storage.read('sellerid').toString());
      print(storage.read('sellerData').toString());
      print(storage.read('sellertoken').toString());
        print(storage.read('sellerZoneId').toString());
        print(storage.read('sellerwallet').toString());

      //    if (response["data"] != null && response["data"].isNotEmpty) {
      // var userData = response["data"][0];

      // if (userData["verified"] == 0) {
      //   Get.snackbar(
      //     'Inactive Account',
      //     'Your account is not active. Please contact support.',
      //     snackPosition: SnackPosition.BOTTOM,
      //     backgroundColor: Colors.red,
      //     colorText: Colors.white,
      //   );

      // }

      try{
        
  if (sellerDataStatus == 1) {
    Get.to(DashboardSales());
       

    
      }
       else{

         Get.snackbar(
          'Inactive Account',
          'Your account is not active. Please contact support.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }




      }catch(e){ 
 print("Exception occurred: $e");

       
      
      }
 

      update();
    
      
      
    }  catch (e) {
      print('Error: ${storage.read("showmessage")}');
     Get.snackbar(
        'Error',
        'An error occurred: ${ storage.read("showmessage")}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
     
      throw "Invalid Field";
    }
  }

  Future<void> postUserData() async {
    try {
      List documentList = [
        '/C:/Users/PC/Downloads/Rectangle 45 (1).png',
        '/C:/Users/PC/Downloads/Rectangle 45.png'
      ];
      var body = {'id': 'value', 'name': 'dhruv'};
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://canine.hirectjob.in/api/v1/auth/state'));
      request.fields.addAll(body);
      request.files.add(await http.MultipartFile.fromPath(
          'image', '/C:/Users/PC/Downloads/Rectangle 45 (1).png'));
      documentList.forEach((element) async {
        request.files
            .add(await http.MultipartFile.fromPath('documents', element));
      });
      await ApiHelper.postFormData(request: request);
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

  // Future<void> sendOtp() async {
  //   try {
  //     // sate list
  //     var body = {
  //       "number": phoneNumberController.text.trim().toString(),
  //       "otp": otpText
  //     };
  //     await ApiHelper.postApi(url: Constants.USER_LOGIN_OTP, body: body);
  //     // print(stateListModel);
  //     // stateLoaded = true;
  //     update();
  //   } catch (e) {
  //     print('Error: $e');
  //     Get.snackbar(
  //       'Error',
  //       'An error occurred: $e',
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //   }
  // }

  @override
  void onInit() {
    super.onInit();
    // init();
  }
}
