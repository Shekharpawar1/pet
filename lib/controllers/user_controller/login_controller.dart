import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pet/models/cityModel.dart';
import 'package:pet/models/stateModel.dart';
import 'package:pet/models/stateModel.dart' as statesFile;
import 'package:pet/models/cityModel.dart' as cityFile;
import 'package:pet/models/usersModel/usesrLoginModel.dart';
import 'package:pet/screens/user/otp.dart';
import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

class UserLoginController extends GetxController {
  final storage = GetStorage();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();
  
  String? otpText;
  String? errormsg = "";

  bool isFinishedOtp = false;
  void updateIsFinishedOtp(bool val) {
    isFinishedOtp = val;
    update();
  }

  updateOtp(String otp) {
    otpText = otp;
    update();
  }

void validateNumber(String value) {
    // setState(() {
      if (value.length < 4) {
        errormsg = 'Enter OTP';
      } else {
        errormsg = '';
      // }
    }
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

  Future<void> getOtp() async {
    try {
      // sate list
      var body = {"cust_phone": phoneNumberController.text.trim().toString()};
      await ApiHelper.postApi(url: Constants.USER_LOGIN, body: body);
      // print(stateListModel);
      // stateLoaded = true;
      Get.snackbar(
        'Success',
        'Login',
        snackPosition: SnackPosition.BOTTOM,
       backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.to(OtpUser());
     
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

  Future<void> postUserData(List documentList, var body) async {
    try {
      
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://canine.hirectjob.in/api/v1/auth/state'));
      request.fields.addAll(body);
      documentList.forEach((element) async {
        request.files.add(await http.MultipartFile.fromPath(
            element["key"], element["value"]));
      });
      print("document List ${documentList}");
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


Future<void> sendOtp() async {
    try {
      // sate list
      var body = {
        "phone": phoneNumberController.text.trim().toString(),
        "otp": otpText
      };
      var response =
          await ApiHelper.postApi(url: Constants.USER_LOGIN_OTP, body: body);
      storage.write('login', true);
      print("============= Success ${storage.read("login")}=============");
      // var jsonResponse = json.decode(response);
      // UserLoginModel userLoginModel = UserLoginModel.fromJson(response);
      // print(userLoginModel);
      var id;
      var userData;
      print(response["data"]);
      try {
        id = response["data"]["id"];
        userData = response["data"];

        Get.snackbar(
        'Success',
        'Your Registration is Done',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      } catch (e) {
        id = response["data"]![0]["id"];
        userData = response["data"][0];
        Get.snackbar(
        'Success',
        'Logging you in',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );}

      // // var id = userLoginModel.data![0].id;
      print("=====>>>> Id ${id} Data: ${userData}");
      storage.write('userData', userData);
      storage.write('id', id);
      print(storage.read('id').toString());
      print(storage.read('userData').toString());
      phoneNumberController.clear();
      otpText = null;
      
      // print(stateListModel);
      // stateLoaded = true;
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
 

  @override
  void onInit() {
    super.onInit();
  }
}
