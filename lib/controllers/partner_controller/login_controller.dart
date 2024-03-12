import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pet/models/cityModel.dart';
import 'package:pet/models/stateModel.dart';
import 'package:pet/models/stateModel.dart' as statesFile;
import 'package:pet/models/cityModel.dart' as cityFile;
import 'package:pet/screens/partner/Dashboard.dart';
import 'package:pet/screens/partner/login.dart';
import 'package:pet/screens/partner/subsciption.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

class  PartnerLoginController extends GetxController {
  final storage = GetStorage();
   bool passwordVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? otpText;


// @override
//   void onClose() {
//     print("closing...");
//   clearFields();
//     super.onClose();
//   }

//   void clearFields() {
    
//     emailController.text.clear();
//      couponsController.maxAmount = null;
// update();
//   }
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

  // Function to check if the response contains a 401 error
 
  Future<void> getOtp() async {
    
    try {
      // sate list
      var body = {"vendor_type":"owner" ,"email":emailController.text.trim().toString(),"password":passwordController.text.trim().toString()};
     var response=     await ApiHelper.postApi(url: Constants.PARTNER_LOGIN, body: body);
      // print(stateListModel);
      // stateLoaded = true;
      print("LOgin");
     print(response);

     
 storage.write('login', true);
      print("============= Success ${storage.read("login")}=============");

       
        var partnerid;
        var partnertoken;
      var partnerData;
var planname; 
var planprice;
var planpurchase;
var planexpirey;
      print(response["data"]);
      try {
        partnerid = response["data"]["id"];
        partnertoken = response["data"]["token"];
        partnerData = response["data"];
        planname = response["data"]["plan_name"];
        planprice = response["data"]["plan_price"];
        planpurchase = response["data"]["plan_purchase_date"];
        planexpirey = response["data"]["plan_expaire_date"];
      } catch (e) {
       partnerid = response["data"]["id"];
        partnertoken = response["data"]["token"];
        partnerData = response["data"];
      }
      // // var id = userLoginModel.data![0].id;
      print("=====>>>> Id ${partnerid} token: ${partnertoken} data: ${partnerData}");
      storage.write('partnerData', partnerData);
      storage.write('partnerid', partnerid);
       storage.write('partnertoken', partnertoken);
     storage.write("planname", planname);
       storage.write("planprice", planprice);
   storage.write("planpurchase", planpurchase);
   storage.write("planexpirey", planexpirey);
     storage.read('planpurchase').toString();
      print(storage.read('partnerid').toString());
      print(storage.read('partnerData').toString());
      print(storage.read('planname').toString());
      
      print(storage.read('partnertoken').toString());
      try {
        partnerid = response["data"]["id"];
        partnerData = response["data"];

        Get.snackbar(
        'Success',
        'Your Login is Done',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      if(partnerData["plan_name"] != null || partnerData["plan_price"] !=null ){
        Get.snackbar(
        'Success',
        'You are subscribed',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
Get.to(DashboardPartner());
      }else{
        Get.to(Subscription());
      }
      
      } catch (e) {
        partnerid = response["data"]![0]["id"];
        partnerData = response["data"][0];
      //   Get.snackbar(
      //   'Success',
      //   'Logging you in',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.green,
      //   colorText: Colors.white,
      // );

//  Get.to(Subscription());
      }
      update();
    } catch (e) {
      print('Error: $e');
    
     Get.snackbar(
        'Error',
        'An error occurred: Unauthorized',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // Future<void> postUserData(List documentList, var body) async {
  //   try {
  //     // List documentList = [
  //     //   {'value': '/C:/Users/PC/Downloads/Rectangle 45 (1).png', 'key': "logo"},
  //     //   {'value': '/C:/Users/PC/Downloads/Rectangle 45.png', 'key': "profile"},
  //     // ];
  //     // var body = {'id': 'value', 'name': 'dhruv'};
  //     var request = http.MultipartRequest(
  //         'POST', Uri.parse('https://canine.hirectjob.in/api/v1/auth/state'));
  //     request.fields.addAll(body);
  //     // request.files.add(await http.MultipartFile.fromPath(
  //     //     'image', '/C:/Users/PC/Downloads/Rectangle 45 (1).png'));
  //     documentList.forEach((element) async {
  //       request.files.add(await http.MultipartFile.fromPath(
  //           element["key"], element["value"]));
  //     });
  //     await ApiHelper.postFormData(request: request);
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

  // Future<void> sendOtp() async {
  //   try {
  //     // sate list
  //     var body = {
  //       "phone": phoneNumberController.text.trim().toString(),
  //       "otp": otpText
  //     };
  //     var response =
  //         await ApiHelper.postApi(url: Constants.USER_LOGIN_OTP, body: body);
  //     storage.write('login', true);
  //     print("============= Success ${storage.read("login")}=============");
  //     var jsonResponse = jsonDecode(response);
  //     var id = jsonResponse['state'][0]['id'];
  //     storage.write('id', id);
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
