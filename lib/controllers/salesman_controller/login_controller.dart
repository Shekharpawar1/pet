import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:pet/models/cityModel.dart';
import 'package:pet/models/stateModel.dart';
import 'package:pet/models/stateModel.dart' as statesFile;
import 'package:pet/models/cityModel.dart' as cityFile;
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form is valid')),
      );
      completer.complete(true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form is invalid')),
      );
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

      print(response["data"]);
      try {
        sellerid = response["data"][0]["id"];
        sellertoken = response["data"][0]["auth_token"];
        sellerData = response["data"];
      } catch (e) {
        sellerid = response["data"]![0]["id"];
                sellertoken = response["data"]![0]["auth_token"];
        sellerData = response["data"][0];
      }
      // // var id = userLoginModel.data![0].id;
      print("=====>>>> Id ${sellerid} token: ${sellertoken} data: ${sellerData}");
      storage.write('sellerData', sellerData);
      storage.write('sellerid', sellerid);
       storage.write('sellertoken', sellertoken);
     
      print(storage.read('sellerid').toString());
      print(storage.read('sellerData').toString());
      print(storage.read('sellertoken').toString());
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
      Get.snackbar(
        'Error',
        'An error occurred: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
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
